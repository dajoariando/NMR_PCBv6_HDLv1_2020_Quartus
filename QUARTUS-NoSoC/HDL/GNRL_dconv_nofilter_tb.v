module GNRL_dconv_nofilter_tb;
	
	// parameters are referenced in MHz for calculation
	parameter timescale_ref = 1000000; // reference scale based on timescale => 1ps => 1THz => 1000000 MHz
	parameter CLK_RATE_HZ = 25; // in MHz
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	localparam ADC_PHYS_WIDTH = 14;
	
	reg [ADC_PHYS_WIDTH-1:0]	adc_data_in;
	reg [ADC_PHYS_WIDTH:0]		adc_dcval_subtractor;
	reg conv_en;
	reg CLK;
	reg RESET;
	
	wire [ADC_PHYS_WIDTH:0] data_i, data_q;

	GNRL_dconv_nofilter
# (
	.ADC_PHYS_WIDTH (14) 
) GNRL_dconv_nofilter1
(

	// data interface
	.adc_data_in	(adc_data_in), // unsigned integer data in
	.data_i			(data_i), // in-phase signed integer data (wider by 1 bit)
	.data_q			(data_q), // quadrature signed integer data (wider by 1 bit)

	// parameters
	.adc_dcval_subtractor	(adc_dcval_subtractor), // signed integer subtractor to remove dc value

	.conv_en			(conv_en),

	// system signal
	.CLK				(CLK),
	.RESET			(RESET)
);

	initial begin
		CLK = 1'b1;
		RESET = 1'b0;
		
		#(clockticks*2) RESET = 1'b1;
		#(clockticks*2) RESET = 1'b0;
		
		
		#(clockticks * 4)adc_dcval_subtractor =  1024;
		
		#(clockticks * 4) conv_en = 1;
		#(clockticks * 4000) conv_en = 0;
		
		
		
	end
	
	always begin
		#clockticks CLK = ~CLK;
	end
	always begin
		#(clockticks*2) adc_data_in = $urandom%8000;
	end
	
	initial begin

		#(clockticks * 100)adc_dcval_subtractor =  1024;

	end
	
endmodule