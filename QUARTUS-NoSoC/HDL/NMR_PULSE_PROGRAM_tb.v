`timescale 1ps / 1ps

module NMR_PULSE_PROGRAM_tb;
	
	// parameters are referenced in MHz for calculation
	parameter timescale_ref = 1000000; // reference scale based on timescale => 1ps => 1THz => 1000000 MHz
	parameter CLK_RATE_HZ = 4.3; // in MHz
		
	reg START;
	wire FSMSTAT;
	//wire PHASE;
	wire OUT_EN;
	wire ACQ_WND;
	
	localparam DATABUS_WIDTH = 32;
	localparam NMR_MAIN_TIMER_WIDTH = 32;

	reg [DATABUS_WIDTH-1:0]	T1_PULSE180;
	reg [DATABUS_WIDTH-1:0]	T1_DELAY;
	reg [DATABUS_WIDTH-1:0] PULSE90;
	reg [DATABUS_WIDTH-1:0] DELAY_NO_ACQ;
	reg [DATABUS_WIDTH-1:0] PULSE180;
	reg [DATABUS_WIDTH-1:0] DELAY_WITH_ACQ;
	reg [DATABUS_WIDTH-1:0]	ECHO_PER_SCAN;
	reg [DATABUS_WIDTH-1:0]	ECHO_SKIP;
	
	// adc clock generator
	wire ADC_CLK;
	
	// nmr tx clock output
	wire TX_OUT_P;
	wire TX_OUT_N;
	
	reg PHASE_CYC;
	reg PULSE_ON_RX;
	
	// nmr tx clock generator
	// wire TX_CLK_0;
	// wire TX_CLK_90;
	// wire TX_CLK_180;
	// wire TX_CLK_270;
	
	reg CLK;
	reg RESET;
	
	
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	NMR_PULSE_PROGRAM
	uut
	(
		// control signals
		.START 		(START),
		.FSMSTAT 	(FSMSTAT),
		
		// nmr control signals
		.PHASE_CYC	(PHASE_CYC),
		.PULSE_ON_RX (PULSE_ON_RX),
		.ACQ_WND 	(ACQ_WND),
		.OUT_EN		(OUT_EN),
		
		// nmr parameters
		.T1_PULSE180	(T1_PULSE180),
		.T1_DELAY		(T1_DELAY),
		.PULSE90 		(PULSE90),
		.DELAY_NO_ACQ 	(DELAY_NO_ACQ),
		.PULSE180 		(PULSE180),
		.DELAY_WITH_ACQ	(DELAY_WITH_ACQ),
		.ECHO_PER_SCAN 	(ECHO_PER_SCAN),
		.ECHO_SKIP		(ECHO_SKIP),
		
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
		PULSE90 = 32;
		DELAY_NO_ACQ = 512;
		PULSE180 = 256;
		DELAY_WITH_ACQ = 512;
		ECHO_PER_SCAN = 8;
		ECHO_SKIP = 3;
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