// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/17.1std/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2017/07/30 $
// $Author: swbranch $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module soc_system_v5_mm_interconnect_1_router_007_default_decode
  #(
     parameter DEFAULT_CHANNEL = 18,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 3 
   )
  (output [112 - 107 : 0] default_destination_id,
   output [45-1 : 0] default_wr_channel,
   output [45-1 : 0] default_rd_channel,
   output [45-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[112 - 107 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 45'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 45'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 45'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module soc_system_v5_mm_interconnect_1_router_007
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [137-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [137-1    : 0] src_data,
    output reg [45-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 112;
    localparam PKT_DEST_ID_L = 107;
    localparam PKT_PROTECTION_H = 127;
    localparam PKT_PROTECTION_L = 125;
    localparam ST_DATA_W = 137;
    localparam ST_CHANNEL_W = 45;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h8 - 64'h0); 
    localparam PAD1 = log2ceil(64'h10 - 64'h8); 
    localparam PAD2 = log2ceil(64'h20 - 64'h10); 
    localparam PAD3 = log2ceil(64'h40 - 64'h20); 
    localparam PAD4 = log2ceil(64'h80 - 64'h40); 
    localparam PAD5 = log2ceil(64'h100 - 64'h80); 
    localparam PAD6 = log2ceil(64'h200 - 64'h100); 
    localparam PAD7 = log2ceil(64'h300 - 64'h200); 
    localparam PAD8 = log2ceil(64'h340 - 64'h300); 
    localparam PAD9 = log2ceil(64'h360 - 64'h340); 
    localparam PAD10 = log2ceil(64'h380 - 64'h360); 
    localparam PAD11 = log2ceil(64'h3a0 - 64'h380); 
    localparam PAD12 = log2ceil(64'h3b0 - 64'h3a0); 
    localparam PAD13 = log2ceil(64'h3c0 - 64'h3b0); 
    localparam PAD14 = log2ceil(64'h3d0 - 64'h3c0); 
    localparam PAD15 = log2ceil(64'h3e0 - 64'h3d0); 
    localparam PAD16 = log2ceil(64'h3f0 - 64'h3e0); 
    localparam PAD17 = log2ceil(64'h400 - 64'h3f0); 
    localparam PAD18 = log2ceil(64'h410 - 64'h400); 
    localparam PAD19 = log2ceil(64'h420 - 64'h410); 
    localparam PAD20 = log2ceil(64'h430 - 64'h420); 
    localparam PAD21 = log2ceil(64'h440 - 64'h430); 
    localparam PAD22 = log2ceil(64'h448 - 64'h440); 
    localparam PAD23 = log2ceil(64'h450 - 64'h448); 
    localparam PAD24 = log2ceil(64'h460 - 64'h450); 
    localparam PAD25 = log2ceil(64'h470 - 64'h460); 
    localparam PAD26 = log2ceil(64'h480 - 64'h470); 
    localparam PAD27 = log2ceil(64'h4a0 - 64'h480); 
    localparam PAD28 = log2ceil(64'h4c0 - 64'h4a0); 
    localparam PAD29 = log2ceil(64'h4e0 - 64'h4c0); 
    localparam PAD30 = log2ceil(64'h500 - 64'h4e0); 
    localparam PAD31 = log2ceil(64'h580 - 64'h500); 
    localparam PAD32 = log2ceil(64'h600 - 64'h580); 
    localparam PAD33 = log2ceil(64'h608 - 64'h600); 
    localparam PAD34 = log2ceil(64'h640 - 64'h620); 
    localparam PAD35 = log2ceil(64'h660 - 64'h640); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h660;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [45-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    soc_system_v5_mm_interconnect_1_router_007_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x0 .. 0x8 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 11'h0  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x8 .. 0x10 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 11'h8  && read_transaction  ) begin
            src_channel = 45'b000000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 44;
    end

    // ( 0x10 .. 0x20 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 11'h10   ) begin
            src_channel = 45'b000000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 38;
    end

    // ( 0x20 .. 0x40 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 11'h20   ) begin
            src_channel = 45'b000000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x40 .. 0x80 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 11'h40   ) begin
            src_channel = 45'b000000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x80 .. 0x100 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 11'h80   ) begin
            src_channel = 45'b000000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x100 .. 0x200 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 11'h100   ) begin
            src_channel = 45'b000000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x200 .. 0x300 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 11'h200   ) begin
            src_channel = 45'b000000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 39;
    end

    // ( 0x300 .. 0x340 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 11'h300   ) begin
            src_channel = 45'b000000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x340 .. 0x360 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 11'h340   ) begin
            src_channel = 45'b000000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x360 .. 0x380 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 11'h360   ) begin
            src_channel = 45'b000001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 42;
    end

    // ( 0x380 .. 0x3a0 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 11'h380   ) begin
            src_channel = 45'b000100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x3a0 .. 0x3b0 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 11'h3a0  && read_transaction  ) begin
            src_channel = 45'b000000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x3b0 .. 0x3c0 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 11'h3b0   ) begin
            src_channel = 45'b000000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x3c0 .. 0x3d0 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 11'h3c0   ) begin
            src_channel = 45'b000000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 36;
    end

    // ( 0x3d0 .. 0x3e0 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 11'h3d0   ) begin
            src_channel = 45'b000000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 35;
    end

    // ( 0x3e0 .. 0x3f0 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 11'h3e0   ) begin
            src_channel = 45'b000000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
    end

    // ( 0x3f0 .. 0x400 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 11'h3f0   ) begin
            src_channel = 45'b000000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
    end

    // ( 0x400 .. 0x410 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 11'h400   ) begin
            src_channel = 45'b000000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
    end

    // ( 0x410 .. 0x420 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 11'h410   ) begin
            src_channel = 45'b000000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
    end

    // ( 0x420 .. 0x430 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 11'h420   ) begin
            src_channel = 45'b000000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
    end

    // ( 0x430 .. 0x440 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 11'h430   ) begin
            src_channel = 45'b000000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x440 .. 0x448 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 11'h440   ) begin
            src_channel = 45'b000000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
    end

    // ( 0x448 .. 0x450 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 11'h448  && read_transaction  ) begin
            src_channel = 45'b000000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x450 .. 0x460 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 11'h450   ) begin
            src_channel = 45'b000000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x460 .. 0x470 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 11'h460   ) begin
            src_channel = 45'b000000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 37;
    end

    // ( 0x470 .. 0x480 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 11'h470   ) begin
            src_channel = 45'b000000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x480 .. 0x4a0 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 11'h480   ) begin
            src_channel = 45'b000000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x4a0 .. 0x4c0 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 11'h4a0   ) begin
            src_channel = 45'b010000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x4c0 .. 0x4e0 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 11'h4c0   ) begin
            src_channel = 45'b001000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x4e0 .. 0x500 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 11'h4e0   ) begin
            src_channel = 45'b000000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x500 .. 0x580 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 11'h500   ) begin
            src_channel = 45'b000000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x580 .. 0x600 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 11'h580   ) begin
            src_channel = 45'b000000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x600 .. 0x608 )
    if ( {address[RG:PAD33],{PAD33{1'b0}}} == 11'h600  && read_transaction  ) begin
            src_channel = 45'b000000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x620 .. 0x640 )
    if ( {address[RG:PAD34],{PAD34{1'b0}}} == 11'h620   ) begin
            src_channel = 45'b100000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x640 .. 0x660 )
    if ( {address[RG:PAD35],{PAD35{1'b0}}} == 11'h640   ) begin
            src_channel = 45'b000010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 41;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule

