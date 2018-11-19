`timescale 1ps / 1ps

module NMR_PULSE_PROGRAM_tb;
	
	// parameters are referenced in MHz for calculation
	parameter timescale_ref = 1000000; // reference scale based on timescale => 1ps => 1THz => 1000000 MHz
	parameter CLK_RATE_HZ = 4.3; // in MHz
		
	reg START;
	wire FSMSTAT;
	//wire PHASE;
	//wire OUT_EN;
	wire ACQ_WND;
	
	localparam PULSE_AND_DELAY_WIDTH = 32;
	localparam ECHO_PER_SCAN_WIDTH = 32;
	localparam NMR_MAIN_TIMER_WIDTH = 32;

	reg [PULSE_AND_DELAY_WIDTH-1:0]	T1_PULSE180;
	reg [PULSE_AND_DELAY_WIDTH-1:0]	T1_DELAY;
	reg [PULSE_AND_DELAY_WIDTH-1:0] PULSE90;
	reg [PULSE_AND_DELAY_WIDTH-1:0] DELAY_NO_ACQ;
	reg [PULSE_AND_DELAY_WIDTH-1:0] PULSE180;
	reg [PULSE_AND_DELAY_WIDTH-1:0] DELAY_WITH_ACQ;
	reg [ECHO_PER_SCAN_WIDTH-1:0]	ECHO_PER_SCAN;
	
	// adc clock generator
	wire ADC_CLK;
	
	// nmr tx clock output
	wire TX_OUT_P;
	wire TX_OUT_N;
	
	reg PHASE_CYC;
	
	// nmr tx clock generator
	// wire TX_CLK_0;
	// wire TX_CLK_90;
	// wire TX_CLK_180;
	// wire TX_CLK_270;
	
	reg CLK;
	reg RESET;
	
	
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	NMR_PULSE_PROGRAM
	#(
		.PULSE_AND_DELAY_WIDTH (PULSE_AND_DELAY_WIDTH),
		.ECHO_PER_SCAN_WIDTH (PULSE_AND_DELAY_WIDTH),
		.NMR_MAIN_TIMER_WIDTH (NMR_MAIN_TIMER_WIDTH)
	)
	uut
	(
		// control signals
		.START 		(START),
		.FSMSTAT 	(FSMSTAT),
		
		// nmr control signals
		.PHASE_CYC	(PHASE_CYC),
		.ACQ_WND 	(ACQ_WND),
		
		// nmr parameters
		.T1_PULSE180	(T1_PULSE180),
		.T1_DELAY		(T1_DELAY),
		.PULSE90 		(PULSE90),
		.DELAY_NO_ACQ 	(DELAY_NO_ACQ),
		.PULSE180 		(PULSE180),
		.DELAY_WITH_ACQ	(DELAY_WITH_ACQ),
		.ECHO_PER_SCAN 	(ECHO_PER_SCAN),
		
		// adc clock generator
		.ADC_CLK		(ADC_CLK),
		
		// nmr tx clock output
		.TX_OUT_P		(TX_OUT_P),
		.TX_OUT_N		(TX_OUT_N),
		
		// system signals
		.CLK	(CLK),
		.RESET	(RESET)
	);
	
	
	initial begin
		START = 1'b0;
		T1_PULSE180 = 0;
		T1_DELAY = 0;
		PULSE90 = 128;
		DELAY_NO_ACQ = 512;
		PULSE180 = 256;
		DELAY_WITH_ACQ = 512;
		ECHO_PER_SCAN = 3;
		CLK = 0;
		PHASE_CYC = 1'b1;

		#(clockticks*2) RESET = 1'b1;
		#(clockticks*2) RESET = 1'b0;
		#(clockticks*2) START = 1'b1;
		#(clockticks*2) START = 1'b0;
		
		#(clockticks*10000) START = 1'b1;
		#(clockticks*2) START = 1'b0; 
	end
	
	always begin
		#clockticks CLK = ~CLK;
	end

endmodule