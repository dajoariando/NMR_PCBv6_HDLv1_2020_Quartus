`timescale 1ps / 1ps

module GNRL_IQcomb_decimator_tb;
	
	// parameters are referenced in MHz for calculation
	parameter timescale_ref = 1000000; // reference scale based on timescale => 1ps => 1THz => 1000000 MHz
	parameter CLK_RATE_HZ = 25; // in MHz
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	localparam DATA_WIDTH = 32;
	localparam DEC_WIDTH = 16;

	reg [DATA_WIDTH-1:0] dataI;	// in-phase data
	reg [DATA_WIDTH-1:0] dataQ;	// quadrature data
	wire [DATA_WIDTH-1:0] dataout;// output data
	
	// control
	reg in_valid;
	wire out_valid;
	
	// parameters
	reg [DEC_WIDTH-1:0] dec_sel; // the decimation factor selector
	
	// system
	reg CLK;
	reg RESET;

	GNRL_IQcomb_decimator
	#(
		.DATA_WIDTH (32),
		.DEC_WIDTH (16)
	)
	GNRL_IQcomb_decimator1
	(
		// signals
		.dataI (dataI),	// in-phase data
		.dataQ (dataQ),	// quadrature data
		.dataout (dataout),// output data
		
		// control
		.in_valid (in_valid),
		.out_valid (out_valid),
		
		// parameters
		.dec_sel (dec_sel), // the decimation factor selector
		
		// system
		.CLK (CLK),
		.RESET (RESET)
		
	);

	initial begin
		CLK = 1'b1;
		RESET = 1'b0;
		dec_sel = 3;
		
		#(clockticks*2) RESET = 1'b1;
		#(clockticks*2) RESET = 1'b0;
		
		
		
		#(clockticks * 4) in_valid = 1;
		#(clockticks * 400) in_valid = 0;
		
		#(clockticks * 100) in_valid = 1;
		#(clockticks * 400) in_valid = 0;
	end
	
	always begin
		#clockticks CLK = ~CLK;
	end
	
	always begin
		#(clockticks*2)
			dataI = $urandom%8000;
			dataQ = $urandom%8000;
	end
	
	
endmodule