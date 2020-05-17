/*
author: David Ariando
March 26th 2020
This module receives 2 streams of IQ data, decimates it by a factor given, and saves the data into one output stream.
Minimum decimation factor is 3, which takes one data every 3 data.

 POSSIBLE ISSUE is present
*/

`timescale 1ps / 1ps
 
module GNRL_IQcomb_decimator
#(
	parameter DATA_WIDTH = 32,
	parameter DEC_WIDTH = 16
)(
	// signals
	input [DATA_WIDTH-1:0] dataI,	// in-phase data
	input [DATA_WIDTH-1:0] dataQ,	// quadrature data
	output reg [DATA_WIDTH-1:0] dataout,// output data
	
	// control
	input in_valid,
	output reg out_valid,
	
	// parameters
	input [DEC_WIDTH-1:0] dec_fact, // the decimation factor selector
	
	// system
	input CLK,
	input RESET
	
);
	
	reg [DEC_WIDTH-1:0] DEC_CNT;
	reg [DEC_WIDTH-1:0] BITSEL_DLY_CNT;
	reg bit_sel; // selected bit
	// wire [DATA_WIDTH-1:0] dataI_dly;
	// wire [DATA_WIDTH-1:0] dataQ_dly;
	reg [DATA_WIDTH-1:0] dataI_sum;
	reg [DATA_WIDTH-1:0] dataQ_sum;
	wire [DATA_WIDTH-1:0] dataQ_sum_dly;
	

	reg [4:0] State;
	localparam [4:0]
		S0 = 5'b00001,
		S1 = 5'b00010,
		S2 = 5'b00100,
		S3 = 5'b01000,
		S4 = 5'b10000;
		
	reg [4:0] SState;
	localparam [4:0]
		SS0 = 5'b00001,
		SS1 = 5'b00010,
		SS2 = 5'b00100,
		SS3 = 5'b01000,
		SS4 = 5'b10000;
	
	initial
	begin
		
		// state machine 1
		dataout <= {(DATA_WIDTH){1'b0}};
		DEC_CNT <= {(DEC_WIDTH){1'b0}};
		BITSEL_DLY_CNT <= {(DEC_WIDTH){1'b0}};
		State <= S0;
		
		// state machine 2
		DEC_CNT <= {(DEC_WIDTH){1'b0}}; // POSSIBLE ISSUE: dec_fact unsynchronized, needs a synchronizer outside the module
		SState <= SS2; // starts with SS2 to enable the output at first
		bit_sel <= 1'b0;
		
	end
	
	// capture the sum data every dconv_fact clock cycles
	always @(posedge CLK, posedge RESET)
	begin
	
		if (RESET)
			begin
												
				State <= S0; // set state to S3 to initialize the BITSEL_DLY_CNT
				out_valid <= 1'b0;
				dataout <= {(DATA_WIDTH){1'b0}};
				
			end
		else
			begin
			
				case (State)
				
					S0 : //
						begin
							
							out_valid <= 1'b0;
							BITSEL_DLY_CNT <= {1'b1,{(DEC_WIDTH-1){1'b0}}} - dec_fact + 4'd2;
							
							if (bit_sel)
								State <= S1;
						
						end

					S1 : 
						begin

							out_valid <= 1'b0;
							BITSEL_DLY_CNT = BITSEL_DLY_CNT + 1'b1; 
							if (BITSEL_DLY_CNT[DEC_WIDTH-1])
								State <= S2;		

						end
						
					S2	: // 
						
						begin
							
							out_valid	<= 1'b1;
							dataout		<= dataI_sum;
							
							State <= S3;
						
						end
						
					S3	: // output data 0
						
						begin
							
							out_valid	<= 1'b1;
							dataout		<= dataQ_sum_dly;
							BITSEL_DLY_CNT <= {1'b1,{(DEC_WIDTH-1){1'b0}}} - dec_fact + 4'd2;
							
							if (bit_sel) // skip S0 if bit_sel is 1						
								State <= S1;
							else State <= S0;
						
						end
				
				endcase
				
			end
			
	end
	
	// pulse generator for every dconv_fact clock cycles
	// also data sum function
	always @(posedge CLK)
	begin
		if (in_valid)
			begin
			case (SState)
			
				SS0 :
				begin
					dataI_sum <= dataI_sum + dataI;
					dataQ_sum <= dataQ_sum + dataQ;

					DEC_CNT <= {1'b1,{(DEC_WIDTH-1){1'b0}}} - dec_fact + 1'b1 + 1'b1;
					bit_sel <= 1'b0;
					
					
					SState <= SS1;
				
				end
				
				SS1 : // add delay
				begin
					
					dataI_sum <= dataI_sum + dataI;
					dataQ_sum <= dataQ_sum + dataQ;

					DEC_CNT = DEC_CNT + 1'b1; 
					
					if (DEC_CNT[DEC_WIDTH-1])
						SState <= SS2;

				end
				
				SS2 : // assert signal
				begin
					
					dataI_sum <= dataI;
					dataQ_sum <= dataQ;

					bit_sel <= 1'b1;
					
					SState <= SS0;
					
				end
				
			endcase
			end
		
		else 
			begin
				DEC_CNT <= {(DEC_WIDTH){1'b0}}; // POSSIBLE ISSUE: dec_fact unsynchronized, needs a synchronizer outside the module
				SState <= SS2; // starts with SS2 to enable the output at first
				bit_sel <= 1'b0;
			end
	end
	
	// 1 clock delay module for the Q data
	genvar i;
	generate
	begin
		for (i=0; i < DATA_WIDTH; i=i+1)
		begin : test1
			CDC_Input_Synchronizer
			#(
				.SYNC_REG_LEN (0)
			)
			I_delay
			(
				.ASYNC_IN (dataQ_sum[i]),
				.SYNC_OUT (dataQ_sum_dly[i]),
				.CLK (CLK)
			);
			
		end
	end
	endgenerate

	
	
	
	
	

endmodule