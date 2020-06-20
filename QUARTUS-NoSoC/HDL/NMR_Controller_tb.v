// in this testbench, the ADC_CLKOUT is just the same with ADC_CLK
// but in reality, the ADC_CLKOUT should be out of phase by 90 degrees

`timescale 1ps / 1ps

module NMR_Controller_tb;
	
	// parameters are referenced in MHz for calculation
	parameter timescale_ref = 1000000; // reference scale based on timescale => 1ps => 1THz => 1000000 MHz
	parameter PULSEPROG_CLK_RATE = 96; // MHz
	localparam integer pulseprog_clk_ticks = (timescale_ref / PULSEPROG_CLK_RATE) / 2.0;

	
	localparam DATABUS_WIDTH = 32;
	localparam ADC_DATA_WIDTH = 16;
	localparam ADC_PHYS_WIDTH = 14; 	// ADC physical data width
	localparam ADC_LATENCY = 5;			// check the datasheet of LTC1746 for this

	// control signals
	reg START;
	wire FSMSTAT;
	
	// nmr parameters
	reg [DATABUS_WIDTH-1:0]	T1_PULSE180;
	reg [DATABUS_WIDTH-1:0]	T1_DELAY;
	reg [DATABUS_WIDTH-1:0] PULSE90;
	reg [DATABUS_WIDTH-1:0] DELAY_NO_ACQ;
	reg [DATABUS_WIDTH-1:0] PULSE180;
	reg [DATABUS_WIDTH-1:0] DELAY_WITH_ACQ;
	reg [DATABUS_WIDTH-1:0]	ECHO_PER_SCAN;
	reg [DATABUS_WIDTH-1:0] SAMPLES_PER_ECHO;
	reg [DATABUS_WIDTH-1:0]	ADC_INIT_DELAY;
	reg [DATABUS_WIDTH-1:0]	RX_DELAY;
	reg [DATABUS_WIDTH-1:0]	ECHO_SKIP;
	
	// nmr rf tx-output (differential)
	wire RF_OUT_P;
	wire RF_OUT_N;
	
	// nmr control signals
	reg PHASE_CYCLE;
	reg PULSE_ON_RX;
	wire EN_ADC;
	wire EN_RX;
	wire ACQ_WND_DLY;
	wire TX_SD;
	wire EN_QSW;
	
	// adc bus
	reg [ADC_PHYS_WIDTH-1:0] Q_IN;
	reg Q_IN_OV;
	
	// data output
	wire [ADC_DATA_WIDTH-1:0] ADC_OUT_DATA;
	wire ADC_DATA_VALID;
	
	reg PULSEPROG_CLK;
	wire ADC_CLK;
	reg RESET;
	
	
	NMR_Controller
	#(
		.DATABUS_WIDTH (DATABUS_WIDTH),
		.ADC_DATA_WIDTH (ADC_DATA_WIDTH),
		.ADC_PHYS_WIDTH (ADC_PHYS_WIDTH), 	// ADC physical data width
		.ADC_LATENCY (ADC_LATENCY)
	)
	uut
	(
		// control signals
		.START		(START),
		.FSMSTAT	(FSMSTAT),
				
		// nmr parameters
		.T1_PULSE180		(T1_PULSE180),
		.T1_DELAY			(T1_DELAY),
		.PULSE90			(PULSE90),
		.DELAY_NO_ACQ		(DELAY_NO_ACQ),
		.PULSE180			(PULSE180),
		.DELAY_WITH_ACQ		(DELAY_WITH_ACQ),
		.ECHO_PER_SCAN		(ECHO_PER_SCAN),	// echo per scan integer number
		.SAMPLES_PER_ECHO	(SAMPLES_PER_ECHO),
		.ADC_INIT_DELAY		(ADC_INIT_DELAY),
		.RX_DELAY			(RX_DELAY),
		.ECHO_SKIP			(ECHO_SKIP),
		
		// nmr rf tx-output (differential)
		.RF_OUT_P	(RF_OUT_P),
		.RF_OUT_N	(RF_OUT_N),
		
		// nmr control signals
		.PHASE_CYCLE	(PHASE_CYCLE),
		.PULSE_ON_RX	(PULSE_ON_RX),
		.EN_ADC			(EN_ADC),
		.EN_RX			(EN_RX),		// enable receiver signal
		.ACQ_WND_DLY	(ACQ_WND_DLY),	// delayed acquisition window for broadband board
		.TX_SD			(TX_SD), // shutdown the transmitter during reception (minimize noise during reception)
		.EN_QSW			(EN_QSW),	// enable Q-switch
		
		// ADC bus
		.Q_IN (Q_IN),
		.Q_IN_OV (Q_IN_OV),
		
		// data output
		.ADC_OUT_DATA		(ADC_OUT_DATA),
		.ADC_DATA_VALID		(ADC_DATA_VALID),
		
		// system signals
		.PULSEPROG_CLK		(PULSEPROG_CLK),
		.ADC_CLK			(ADC_CLK),
		.ADC_CLKOUT			(ADC_CLK),
		.RESET				(RESET)
	);
	
	
	initial begin
		START = 1'b0;
		T1_PULSE180 = 0;
		T1_DELAY = 0;
		PULSE90 = 64;
		DELAY_NO_ACQ = 64;
		PULSE180 = 128;
		DELAY_WITH_ACQ = 512;
		ECHO_PER_SCAN = 16;
		SAMPLES_PER_ECHO = 30;
		ADC_INIT_DELAY = 30;
		RX_DELAY = 20;
		PULSEPROG_CLK = 1;
		PHASE_CYCLE = 0;
		Q_IN_OV = 0;
		PULSE_ON_RX = 1;
		ECHO_SKIP = 2;

		#(pulseprog_clk_ticks*2) RESET = 1'b1;
		#(pulseprog_clk_ticks*2) RESET = 1'b0;
		#(pulseprog_clk_ticks*2) START = 1'b1;
		#(pulseprog_clk_ticks*2) START = 1'b0;

	end
	
	initial begin
		Q_IN = 100;
		forever
		begin
			#(pulseprog_clk_ticks*2) Q_IN = Q_IN + 1'b1;
		end
	end
	
	always begin
		#pulseprog_clk_ticks PULSEPROG_CLK = ~PULSEPROG_CLK;
	end
	

endmodule