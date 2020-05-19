/*

	this is the downconversion algorithm to extract the AC value from the data
	and then do the data multiplication with 1,0,-1,0 for down conversion

*/

module GNRL_dconv_nofilter
# (
	parameter ADC_PHYS_WIDTH = 14 
)
(

	// data interface
	input [ADC_PHYS_WIDTH-1:0]		adc_data_in, // unsigned integer data in
	output reg [ADC_PHYS_WIDTH:0]	data_i, // in-phase signed integer data (wider by 1 bit)
	output reg [ADC_PHYS_WIDTH:0]	data_q, // quadrature signed integer data (wider by 1 bit)

	// parameters
	input [ADC_PHYS_WIDTH:0]		adc_dcval_subtractor, // signed integer subtractor to remove dc value

	input	conv_en,

	// system signal
	input CLK,
	input RESET
);

	wire [ADC_PHYS_WIDTH:0] adc_data_ac;
	reg [1:0] counter;

	assign adc_data_ac = {1'b0,adc_data_in} - adc_dcval_subtractor;

	initial
	begin
		counter <= {2{1'b0}};
		data_i <= adc_data_ac;
		data_q <= adc_data_ac;
	end
	
	// multiply by local oscillator. The magnitude of 45,135,225,315 are the same,
	// so it can be multiplied by one instead, and then later multiplied by the value (0.707 or -0.707)
	// using high-level processing.
	always @(*)
	begin
		case (counter)
			2'h0: begin
				data_i <= adc_data_ac; 		// *sin 45
				data_q <= adc_data_ac;		// *cos 45
			end
			2'h1: begin
				data_i <= adc_data_ac; 				// *sin 135
				data_q <= ~(adc_data_ac)+1'b1;	// *cos 135
			end
			2'h2: begin
				data_i <= ~(adc_data_ac)+1'b1;	// *sin 225
				data_q <= ~(adc_data_ac)+1'b1; 	// *cos 225
			end
			2'h3: begin
				data_i <= ~(adc_data_ac)+1'b1; 	// *sin 315
				data_q <= adc_data_ac;				// *cos 315
			end
		endcase
	end

	// counter always loop
	always @(posedge CLK, posedge RESET)
	begin
		if (RESET)
		begin
			counter <= {2{1'b0}};
		end
		else
		begin
			if (conv_en)
			begin
				counter <= counter + 1'b1;
			end
		end
	end

endmodule