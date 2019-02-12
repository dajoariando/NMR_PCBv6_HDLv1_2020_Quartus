module NMR_PULSE_PROGRAM
#(
	parameter PULSE_AND_DELAY_WIDTH = 32,
	parameter ECHO_PER_SCAN_WIDTH = 32,
	parameter NMR_MAIN_TIMER_WIDTH = 32
)
(
	// control signals
	input 		START,
	output reg 	FSMSTAT,
	
	// nmr control signals
	input		PHASE_CYC,
	output reg	ACQ_WND,
	
	// nmr parameters
	input [PULSE_AND_DELAY_WIDTH-1:0]	T1_PULSE180,
	input [PULSE_AND_DELAY_WIDTH-1:0]	T1_DELAY,
	input [PULSE_AND_DELAY_WIDTH-1:0]	PULSE90,
	input [PULSE_AND_DELAY_WIDTH-1:0]	DELAY_NO_ACQ,
	input [PULSE_AND_DELAY_WIDTH-1:0]	PULSE180,
	input [PULSE_AND_DELAY_WIDTH-1:0]	DELAY_WITH_ACQ,
	input [ECHO_PER_SCAN_WIDTH-1:0]		ECHO_PER_SCAN,	// echo per scan integer number
	
	// adc clock generator
	output ADC_CLK,
	
	// nmr tx clock output
	output TX_OUT_P,
	output TX_OUT_N,
	
	// system signals
	input CLK,
	input RESET
);

	// rollover counter reg
	reg [PULSE_AND_DELAY_WIDTH-1:0]	T1_PULSE180_CNT;
	reg [PULSE_AND_DELAY_WIDTH-1:0]	T1_DELAY_CNT;
	wire [PULSE_AND_DELAY_WIDTH-1:0]	JUMP_TO_S4;
	reg [PULSE_AND_DELAY_WIDTH-1:0]	PULSE90_CNT;
	reg [PULSE_AND_DELAY_WIDTH-1:0]	DELAY_NO_ACQ_CNT;
	wire [PULSE_AND_DELAY_WIDTH-1:0]	JUMP_TO_S6;
	reg [PULSE_AND_DELAY_WIDTH-1:0]	PULSE180_CNT;
	reg [PULSE_AND_DELAY_WIDTH-1:0]	DELAY_WITH_ACQ_CNT;
	wire [PULSE_AND_DELAY_WIDTH-1:0]	JUMP_TO_S7;
	reg [ECHO_PER_SCAN_WIDTH-1:0]	ECHO_PER_SCAN_CNT;
	
	// nmr tx clock generator
	wire TX_CLK_X; // tx phase 0 output
	wire TX_CLK_Y; // tx phase 90 output

	reg	PHASE;		// select the output tx phase
	reg	OUT_EN;		// tx output enable
	
	
	// register for NMR main timer
	reg [NMR_MAIN_TIMER_WIDTH-1:0] NMR_MAIN_TIMER_CNT;

	reg [9:0] State /* synthesis keep = 1 */;
	localparam [9:0]
		S0 = 10'b0000000001,
		S1 = 10'b0000000010,
		S2 = 10'b0000000100,
		S3 = 10'b0000001000,
		S4 = 10'b0000010000,
		S5 = 10'b0000100000,
		S6 = 10'b0001000000,
		S7 = 10'b0010000000,
		S8 = 10'b0100000000,
		S9 = 10'b1000000000;
	
	assign JUMP_TO_S4	= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - T1_PULSE180; // only MSB is used to define whether skipping/not is required
	assign JUMP_TO_S6	= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - PULSE90; // only MSB is used to define whether skipping/not is required
	assign JUMP_TO_S7	= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - PULSE180; // only MSB is used to define whether skipping/not is required
	
	initial
	begin
		FSMSTAT	<= 1'b0;
		PHASE	<= 1'b0;
		OUT_EN	<= 1'b0;
		ACQ_WND	<= 1'b0;
		State	<= S0;
	end
	
	// main controller always loop
	always @(posedge CLK, posedge RESET)
	begin
	
		if (RESET)
		begin
		
			FSMSTAT	<= 1'b0;
			PHASE	<= 1'b0;
			OUT_EN	<= 1'b0;
			ACQ_WND	<= 1'b0;
			State	<= S0;
			
		end
		else
		begin
		
			case (State)
			
				S0 :
				begin
					
					ECHO_PER_SCAN_CNT	<= {1'b1,{ (ECHO_PER_SCAN_WIDTH-1) {1'b0} }} - 	ECHO_PER_SCAN + 1;
					
					// Wait for the Start signal
					if (START)
						State <= S1;
				
				end
				
				S1 : 
				begin
					
					T1_PULSE180_CNT		<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - T1_PULSE180 + 1'b1;
					T1_DELAY_CNT		<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - T1_DELAY + 1'b1;
					PULSE90_CNT 		<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - PULSE90 + 1'b1;
					DELAY_NO_ACQ_CNT 	<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - DELAY_NO_ACQ + 1'b1;
					PULSE180_CNT		<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - PULSE180 + 1'b1;
					DELAY_WITH_ACQ_CNT	<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - DELAY_WITH_ACQ + 1'b1 + 1'b1; // another (+1'b1) compensate for S6 state 1 clock cycle 
					
					FSMSTAT <= 1'b1;
					
					// skip if the pulse length is 0. There are several scenario:
					// 1. There's no point of doing T1 inversion recovery if PULSE90 is 0, so skip S2 until S5 if this is true, no matter what T1_PULSE180 is.
					//    By skipping PULSE90, and with a single ECHO_PER_SCAN, FID measurement can be performed.
					// 2. If the inversion recovery is not intended, set the T1_PULSE180 to 0 to skip S2 and S3.					
					// 3. To do noise measurement, set the ECHO_PER_SCAN to be 1, and then set PULSE180 to be 0, effectively jumping all states before S7
					if (JUMP_TO_S7[PULSE_AND_DELAY_WIDTH-1])
						State <= S7;
					else if (JUMP_TO_S6[PULSE_AND_DELAY_WIDTH-1])
						State <= S6;
					else if (JUMP_TO_S4[PULSE_AND_DELAY_WIDTH-1])
						State <= S4;
					else
						State <= S2;
								
				end
				
				S2 : // initial pulse 180 for T1 measurement
				begin
				
					OUT_EN <= 1'b1;
					PHASE <= 1'b0;
					ACQ_WND <= 1'b0;
					
					T1_PULSE180_CNT <= T1_PULSE180_CNT + 1'b1;
					
					if (T1_PULSE180_CNT[PULSE_AND_DELAY_WIDTH-1])
						State <= S3;
				
				end
				
				S3 : // delay no-acquisition
				begin
					
					OUT_EN <= 1'b0;
					ACQ_WND <= 1'b0;
					
					T1_DELAY_CNT <= T1_DELAY_CNT + 1'b1;
					
					if (T1_DELAY_CNT[PULSE_AND_DELAY_WIDTH-1])
						State <= S4;
					
				end
				
				S4 : // pulse 90 state
				begin
					
					OUT_EN <= 1'b1;
					PHASE <= 1'b0;
					ACQ_WND <= 1'b0;
					
					PULSE90_CNT <= PULSE90_CNT + 1'b1;
					
					if (PULSE90_CNT[PULSE_AND_DELAY_WIDTH-1])
						State <= S5;
					
				end
				
				S5 : // delay no-acquisition
				begin
					
					OUT_EN <= 1'b0;
					ACQ_WND <= 1'b0;
					DELAY_NO_ACQ_CNT <= DELAY_NO_ACQ_CNT + 1'b1;
					
					if (DELAY_NO_ACQ_CNT[PULSE_AND_DELAY_WIDTH-1])
						State <= S6;
					
				end
				
				S6 : // pulse 180 state
				begin
				
					OUT_EN <= 1'b1;
					PHASE <= 1'b1;
					ACQ_WND <= 1'b0;
					
					PULSE180_CNT <= PULSE180_CNT + 1'b1;
					
					if (PULSE180_CNT[PULSE_AND_DELAY_WIDTH-1])
						State <= S7;
					
				end
				
				S7 : // delay with acquisition
				begin
					
					OUT_EN <= 1'b0;
					ACQ_WND <= 1'b1;
					
					DELAY_WITH_ACQ_CNT <= DELAY_WITH_ACQ_CNT + 1'b1;
					
					if (DELAY_WITH_ACQ_CNT[PULSE_AND_DELAY_WIDTH-1])
						State <= S8;
					
				end
				
				S8 : // check echo per scan rollover counter
				begin
					
					PULSE180_CNT		<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - PULSE180 + 1'b1;
					DELAY_WITH_ACQ_CNT	<= {1'b1,{ (PULSE_AND_DELAY_WIDTH-1) {1'b0} }} - DELAY_WITH_ACQ + 1'b1 + 1'b1; // another (+1'b1) compensate for S6 state 1 clock cycle 
					
					ECHO_PER_SCAN_CNT <= ECHO_PER_SCAN_CNT + 1'b1;
					
					if (ECHO_PER_SCAN_CNT[ECHO_PER_SCAN_WIDTH-1])
						State <= S9;
					else
						State <= S6;
						
				end
				
				S9 : // end of sequence
				begin
					
					FSMSTAT <= 1'b0;
					ACQ_WND <= 1'b0;
					
					State <= S0;
					
				end
				
				
			endcase
		
		end
	
	end
	
	// main NMR counter always loop
	always @(posedge CLK, posedge RESET)
	begin
		if (RESET)
		begin
			NMR_MAIN_TIMER_CNT <= {NMR_MAIN_TIMER_WIDTH{1'b0}};
		end
		else
		begin
			if (FSMSTAT)
				NMR_MAIN_TIMER_CNT <= NMR_MAIN_TIMER_CNT + 1'b1;
			else
				NMR_MAIN_TIMER_CNT <= {NMR_MAIN_TIMER_WIDTH{1'b0}};
		end
	end
	
	// generate ADC clock
	assign ADC_CLK = NMR_MAIN_TIMER_CNT[1]; // index 0 is to get CLK/2 frequency, and index 1 is to get CLK/4 frequency
	
	// generate TX clock
	wire [1:0] TX_CLK_X_CNT, TX_CLK_Y_CNT;
	assign TX_CLK_X_CNT = NMR_MAIN_TIMER_CNT[3:2]; // index 2: CLK/8, index 3: CLK/16.
	assign TX_CLK_Y_CNT = NMR_MAIN_TIMER_CNT[3:2] + 1'b1; // add extra 90 degrees phase shift
	assign TX_CLK_X = TX_CLK_X_CNT[1]; // phase 0
	assign TX_CLK_Y = TX_CLK_Y_CNT[1]; // phase 90
	
	// switch TX clock output (phase cycling by pulse-90)
	wire TX_OUT_X_phcyc; // phase cycling output signal 
	wire TX_OUT_P_int; // internal tx_p after selected by phase (switching between 0 and 90 degrees input pulse)
	assign TX_OUT_X_phcyc = PHASE_CYC ? TX_CLK_X : ~TX_CLK_X;
	assign TX_OUT_P_int = PHASE ?  TX_CLK_Y : TX_OUT_X_phcyc;
	assign TX_OUT_P = OUT_EN ? TX_OUT_P_int : 1'b0;
	assign TX_OUT_N = OUT_EN ? ~TX_OUT_P_int : 1'b0;


endmodule
