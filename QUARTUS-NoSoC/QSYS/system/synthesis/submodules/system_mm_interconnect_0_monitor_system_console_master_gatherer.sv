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


// $Id: //acds/rel/17.1std/ip/sld/trace/monitors/altera_trace_stats_gatherer/altera_trace_stats_gatherer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2017/07/30 $
// $Author: swbranch $
`default_nettype none
`timescale 1 ns / 1 ns

module system_mm_interconnect_0_monitor_system_console_master_gatherer_address_decode_fsm(
  input wire is_config_master_access,
  input wire control_read,
  input wire control_write,

  input wire ack_config_access,
  output reg control_waitrequest,

  input wire config_readdatavalid,

  input wire clk,
  input wire reset
);
  typedef enum int unsigned {
    ST_AD_IDLE,
    ST_AD_R0,
    ST_AD_R1,
    ST_AD_W0,
    ST_AD_CMR0,
    ST_AD_CMR1,
    ST_AD_CMW,
    ST_AD_FAIL
  } t_address_decode_state;
  t_address_decode_state state, p1_state;

  logic p1_control_waitrequest;
  always @* begin : state_transition
    p1_control_waitrequest = '1;
    p1_state = state;
    case (state)
      ST_AD_IDLE: begin
        if (control_read) begin
          if (is_config_master_access) begin
            p1_state = ST_AD_CMR0;
          end
          else begin
            p1_control_waitrequest = '0;
            p1_state = ST_AD_R0;
          end
        end
        else if (control_write) begin
          if (is_config_master_access) begin
            p1_state = ST_AD_CMW;
          end
          else begin
            p1_control_waitrequest = '0;
            p1_state = ST_AD_W0;
          end
        end
      end
      
      ST_AD_R0: begin
        p1_state = ST_AD_R1;
        p1_control_waitrequest = '1;
      end

      ST_AD_R1: begin
        p1_state = ST_AD_IDLE;
        p1_control_waitrequest = '1;
      end

      ST_AD_W0: begin
        p1_state = ST_AD_IDLE;
        p1_control_waitrequest = '1;
      end

      ST_AD_CMW: begin
        if (ack_config_access) begin
          p1_control_waitrequest = '0;
        end
        if (~control_waitrequest) begin
          p1_state = ST_AD_IDLE;
        end
      end

      ST_AD_CMR0: begin
        if (ack_config_access) begin
          p1_control_waitrequest = '0;
          if (config_readdatavalid)
            // One cycle of delay before going idle.
            p1_state = ST_AD_R1;
          else
            // Go await rdv.
            p1_state = ST_AD_CMR1;
        end
      end

      ST_AD_CMR1: begin
        if (config_readdatavalid) begin
          p1_control_waitrequest = '1;
          p1_state = ST_AD_IDLE;
        end
      end

      default: begin
        p1_state = ST_AD_FAIL;
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      control_waitrequest <= '1;
      state <= ST_AD_IDLE;
    end
    else begin
      control_waitrequest <= p1_control_waitrequest;
      state <= p1_state;
    end
  end

endmodule

// Address decoding
// This module takes advantage of the control interface's wait state
// assignments:
//   set_interface_property control readWaitTime 2
//   set_interface_property control writeWaitTime 1
// to do compute registered address decodes, secure in 
// the knowledge that writedata is valid, and readdata is sampled
// in the third cycle of each access.
// wait time of 2 for reads was chosen to allow one cycle for 
// address decode, one cycle for readdata muxing.
//
module system_mm_interconnect_0_monitor_system_console_master_gatherer_address_decode(
  // computed address selects
  output reg enable_valid,
  output reg new_timer_reload_value_valid,
  output reg new_config_address_value_valid,
  output reg read_ID,
  output reg read_TS_INFO,
  output reg read_CONTROL,
  output reg read_TIMER_RELOAD,
  output reg read_CONFIG_ADDRESS,
  output reg read_nothing,
  output reg initiate_read_CONFIG_DATA,
  output reg initiate_write_CONFIG_DATA,
  output reg control_waitrequest,

  input wire config_readdatavalid,

  // input address, read, write
  input wire [6 - 1 : 0] control_address,
  input wire control_read,
  input wire control_write,

  // feedback from the config master
  input wire ack_config_access,

  input wire clk,
  input wire reset
);

  localparam 
    CONTROL_ADDRESS_ID = 6'h0,
    CONTROL_ADDRESS_TS_INFO = 6'h4,
    CONTROL_ADDRESS_CONTROL = 6'h10,
    CONTROL_ADDRESS_TIMER_RELOAD = 6'h14,
    CONTROL_ADDRESS_CONFIG_ADDRESS = 6'h18,
    CONTROL_ADDRESS_CONFIG_DATA = 6'h20;

  wire nothing_selected = control_read & (
    (control_address == 6'h8) |
    (control_address == 6'hC) |
    (control_address == 6'h1C)
  );

  logic d1_nothing_selected;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      d1_nothing_selected <= '0;
    end
    else begin
      d1_nothing_selected <= nothing_selected;
    end
  end
  assign read_nothing = d1_nothing_selected & ~control_waitrequest;

  system_mm_interconnect_0_monitor_system_console_master_gatherer_address_decode_fsm ad_fsm (
    .is_config_master_access (control_address[6 - 1]),
    .control_read (control_read),
    .control_write (control_write),
    .ack_config_access (ack_config_access),
    .control_waitrequest (control_waitrequest),
    .config_readdatavalid (config_readdatavalid),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_write_address_decode #(.ADDR (CONTROL_ADDRESS_CONTROL)) write_ENABLE_decode(
    .write_select (enable_valid),
    .control_address (control_address),
    .control_write (control_write),
    .clk (clk),
    .reset (reset)
  );
  system_mm_interconnect_0_monitor_system_console_master_gatherer_write_address_decode #(.ADDR (CONTROL_ADDRESS_TIMER_RELOAD)) write_TIMER_RELOAD_decode(
    .write_select (new_timer_reload_value_valid),
    .control_address (control_address),
    .control_write (control_write),
    .clk (clk),
    .reset (reset)
  );
  system_mm_interconnect_0_monitor_system_console_master_gatherer_write_address_decode #(.ADDR (CONTROL_ADDRESS_CONFIG_ADDRESS)) write_CONFIG_ADDRESS_decode(
    .write_select (new_config_address_value_valid),
    .control_address (control_address),
    .control_write (control_write),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_address_decode_begintransfer read_CONFIG_DATA_decode( 
    .read_begintransfer (initiate_read_CONFIG_DATA),
    .write_begintransfer (initiate_write_CONFIG_DATA),
    .is_config_master_access (control_address[6 - 1]),
    .waitrequest (control_waitrequest),
    .read (control_read),
    .write (control_write),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_read_address_decode #(.ADDR (CONTROL_ADDRESS_ID)) read_ID_decode(
    .read_select (read_ID),
    .control_address (control_address),
    .control_read (control_read),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_read_address_decode #(.ADDR (CONTROL_ADDRESS_TS_INFO)) read_TS_INFO_decode(
    .read_select (read_TS_INFO),
    .control_address (control_address),
    .control_read (control_read),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_read_address_decode #(.ADDR (CONTROL_ADDRESS_CONTROL)) read_CONTROL_decode(
    .read_select (read_CONTROL),
    .control_address (control_address),
    .control_read (control_read),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_read_address_decode #(.ADDR (CONTROL_ADDRESS_TIMER_RELOAD)) read_TIMER_RELOAD_decode(
    .read_select (read_TIMER_RELOAD),
    .control_address (control_address),
    .control_read (control_read),
    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_read_address_decode #(.ADDR (CONTROL_ADDRESS_CONFIG_ADDRESS)) read_CONFIG_ADDRESS_decode(
    .read_select (read_CONFIG_ADDRESS),
    .control_address (control_address),
    .control_read (control_read),
    .clk (clk),
    .reset (reset)
  );

endmodule

// One select cycle at the start of each transfer.
module system_mm_interconnect_0_monitor_system_console_master_gatherer_address_decode_begintransfer(
    output reg read_begintransfer,
    output reg write_begintransfer,
    input wire is_config_master_access,
    input wire waitrequest,
    input wire read,
    input wire write,
    input wire clk,
    input wire reset
  );

  wire reading = read & is_config_master_access;
  wire writing = write & is_config_master_access;

  logic first_cycle;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      first_cycle <= '1;
    end
    else if (read | write) begin
      first_cycle <= ~waitrequest;
    end
  end

  assign read_begintransfer = reading & first_cycle;
  assign write_begintransfer = writing & first_cycle;

endmodule

// Read address decoder for 2 read wait states.
// Select pulse is driven for the 2nd of the 3 read cycles.
module system_mm_interconnect_0_monitor_system_console_master_gatherer_read_address_decode #(
    parameter [6 - 1 : 0 ] ADDR = {6 {1'b0}}
  )
  (
    output reg read_select,

    input wire [6 - 1 : 0] control_address,
    input wire control_read,

    input wire clk,
    input wire reset
  );

  reg d1_read_select;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      read_select <= '0;
      d1_read_select <= '0;
    end
    else begin
      read_select <= ~read_select & ~d1_read_select & control_read & (control_address == ADDR);
      d1_read_select <= read_select;
    end
  end

endmodule

// Write address decoder for 1 write wait state.
// Select pulse is driven for the 2nd of the 2 write cycles.
module system_mm_interconnect_0_monitor_system_console_master_gatherer_write_address_decode #(
    parameter [6 - 1 : 0 ] ADDR = {6 {1'b0}}
  )
  (
    output reg write_select,
    input wire [6 - 1 : 0] control_address,
    input wire control_write,

    input wire clk,
    input wire reset
  );

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      write_select <= '0;
    end
    else begin
      write_select <= 
        ~write_select & control_write & (control_address == ADDR);
    end
  end
endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_periodic_timer(
  // enable_valid triggers count enable/disable, according to enable
  input wire enable,
  input wire enable_valid,

  // new_timer_reload_value_valid triggers capture of a new terminal count value.
  input wire [26 - 1 : 0 ] new_timer_reload_value,
  input wire new_timer_reload_value_valid,

  // trigger is active for a single cycle at the end of the polling period.
  output reg trigger_capture,
  output reg enabled,
  output reg [26 - 1 : 0] timer_reload,

  input wire clk,
  input wire reset
);


  logic d1_enabled;
  // recently_enabled goes active after enable asserts; it's used to trigger a
  // sample soon after enablement.
  logic recently_enabled;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      enabled <= '0;
      recently_enabled <= '0;
      d1_enabled <= '0;
    end
    else begin
      if (enable_valid) begin
        enabled <= enable;
      end
      d1_enabled <= enabled;
      recently_enabled <= (enabled & ~d1_enabled);
    end
  end

  logic [26 - 1 : 0] counter;
  logic [26 - 1 : 0] p1_counter;
  assign p1_counter = (!enabled || trigger_capture) ? '0 : counter + 1'b1;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      counter <= '0;
    end
    else begin
      // Does Quartus infer efficient set/reset logic here?
      counter <= p1_counter;
    end

  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      timer_reload <= 26'd999999;
    end
    else if (new_timer_reload_value_valid) begin
        timer_reload <= new_timer_reload_value;
    end

  end

  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      trigger_capture <= '0;
    end
    else begin
      trigger_capture <= recently_enabled || (p1_counter == timer_reload);
    end
  end

endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_data_master(
  output reg [(32 / 8) - 1 : 0] data_byteenable,
  output reg data_read,
  output reg [4 - 1 : 0] data_address,
  output reg timestamp_capture,

  output reg data_master_busy,
  output reg last_rdv,
  input wire data_readdatavalid,
  input wire data_waitrequest,

  input wire initiate_capture,

  input wire clk,
  input wire reset
);

  typedef enum int unsigned {
    ST_DM_IDLE, 
    ST_DM_READ_S0,
    ST_DM_FAIL
  } t_data_master_state;
  t_data_master_state state, p1_state;


  // slave 0 spans from 4'h0 to 4'h0 + 2'h3 (inclusive start, end)
  logic [4 - 1 : 0] p1_data_address;
  logic [(32 / 8) - 1 : 0] p1_data_byteenable;
  logic [2 - 1 : 0] p1_slave_word_count;
  logic [2 - 1 : 0] slave_word_count;
  logic set_ts_capture_enable, ts_capture_enable;

  logic [2 - 1 : 0] payload_counter;
  logic [2 - 1 : 0] p1_payload_counter;

  logic p1_data_read;
  always @* begin : state_transition
    // default assignments
    p1_state = state;
    p1_data_byteenable = '1;
    p1_data_address = data_address;
    p1_data_read = '0;
    p1_slave_word_count = slave_word_count;
    set_ts_capture_enable = '0;
    p1_payload_counter = 
      data_readdatavalid ? (payload_counter - 1'b1) : payload_counter;
    case (state)
      ST_DM_IDLE: begin
        if (initiate_capture) begin
          p1_state = ST_DM_READ_S0;
          p1_data_address = 4'h0;
          p1_data_read = '1;
          p1_slave_word_count = 2'h3;
          set_ts_capture_enable = '1; 
          p1_payload_counter = 2'd3;
        end
      end

      ST_DM_READ_S0: begin
        p1_data_read = '1;
        if (~data_waitrequest) begin
          if (slave_word_count > 0) begin
            p1_data_address = data_address + 3'd4;
            p1_slave_word_count = slave_word_count - 1'b1;
          end
          else begin
            p1_state = ST_DM_IDLE;
            p1_data_read = '0;
            // Todo: enable eop in the trace packet.
          end
        end
      end

      default: begin
        p1_state = ST_DM_FAIL;
      end
       
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      data_address <= '0;
      data_read <= '0;
      data_byteenable <= '1;
      slave_word_count <= '0;
      state <= ST_DM_IDLE;
      data_master_busy <= '0;
    end
    else begin
      data_address <= p1_data_address;
      data_read <= p1_data_read;
      data_byteenable <= p1_data_byteenable;
      slave_word_count <= p1_slave_word_count;
      state <= p1_state;

      data_master_busy <= 
        (p1_state != ST_DM_IDLE) ? 1'b1 : 
        (p1_state == ST_DM_IDLE) && (p1_payload_counter == 2'b0) ? 1'b0 : 
        data_master_busy;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      ts_capture_enable <= '0;
    end
    else begin
      if (set_ts_capture_enable)
        ts_capture_enable <= '1;
      if (data_readdatavalid)
        ts_capture_enable <= '0;
    end
  end
  assign timestamp_capture = ts_capture_enable & data_readdatavalid;
  // Todo: probably should pre-compute and register last_rdv.
  assign last_rdv = data_readdatavalid & (payload_counter == '0);
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      payload_counter <= '0;
    end
    else begin
      payload_counter <= p1_payload_counter;
    end
  end

endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_control_readdata_mux(
    output reg [32 - 1 : 0] control_readdata,
    output reg control_readdatavalid,

    input wire read_ID,
    input wire read_TS_INFO,
    input wire read_CONTROL,
    input wire read_TIMER_RELOAD,
    input wire read_CONFIG_ADDRESS,
    input wire read_nothing,

    input wire data_master_busy,
    input wire capture_packet_transmitted,
    input wire enabled,
    input wire [26 - 1 : 0] timer_reload,
    input wire [4 - 1 : 0] config_address,
    input wire [32 - 1 : 0] config_readdata,
    input wire config_readdatavalid,

    input wire clk,
    input wire reset
  );

  localparam 
            SHORT_TS_LENGTH   = 8'd0,
            LONG_TS_LENGTH    = 8'd24,
            VERSION = 4'h0,
            TYPE_NAME = 16'h010A,
            ALTERA = 11'h6E;
  logic busy;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      busy <= '0;
    end
    else begin
      if (data_master_busy)
        busy <= '1;
      else if (capture_packet_transmitted)
        busy <= '0;
    end
  end

  logic d1_config_readdatavalid;
  // Dependency alert: read_something fanin and control_readdata mux control.
  wire read_something =
    read_ID | read_TS_INFO | read_CONTROL | read_TIMER_RELOAD | read_CONFIG_ADDRESS | read_nothing | d1_config_readdatavalid;
  logic [32 - 1 : 0] d1_config_readdata;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      control_readdata <= '0;
      control_readdatavalid <= '0;
      d1_config_readdata <= '0;
      d1_config_readdatavalid <= '0;
    end
    else begin
      d1_config_readdata <= config_readdata;
      d1_config_readdatavalid <= config_readdatavalid;
      if (read_something) begin
        control_readdata <= 
          {32 {read_ID}} & {VERSION, TYPE_NAME, 1'b0, ALTERA} |
          {32 {read_TS_INFO}} & {16'b0, SHORT_TS_LENGTH, LONG_TS_LENGTH} |
          {32 {read_CONTROL}} & {30'b0, busy, enabled} |
          {32 {read_TIMER_RELOAD}} & {6'b0, timer_reload} |
          {32 {read_CONFIG_ADDRESS}} & config_address | 
          {32 {d1_config_readdatavalid}} & d1_config_readdata;

      end
      control_readdatavalid <= read_something;
    end

  end
endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_timestamp_generator #(
  parameter FULL_TS_LENGTH = 24
  ) (
      output reg [24 - 1 : 0 ] full_timestamp,

      input wire clk,
      input wire reset
  );

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      full_timestamp <= '0;
    end
    else begin
      full_timestamp <= full_timestamp + 1'b1;
    end
  end

endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_capture_source(
  output reg [32 - 1 : 0] capture_data,
  output reg capture_valid,
  input wire capture_ready,
  output reg capture_startofpacket,
  output reg capture_endofpacket,
  output reg [2 - 1 : 0] capture_empty,

  // valid signal and timestamp, for the first packet beat.
  input wire timestamp_capture,
  input wire [24 - 1 : 0 ] full_timestamp,

  // rdv signal and readdata, for not-first packet beats.
  input wire last_rdv,
  input wire data_readdatavalid,
  input wire [32 - 1 : 0] data_readdata,

  // Maintain state for noting that one or more packets were dropped,
  // and reporting that in the next packet transmission.
  input wire packet_dropped,

  input wire clk,
  input wire reset
);

  // Unused empty signal.  This signal is include to match the trace controller
  // capture sink.
  assign capture_empty = '0;

  // Trace packet header
  logic header_prev_corrupt = 0;
  logic header_prev_dropped = 0;
  logic [7:0] header;
  assign header = {
    2'b10, // Full TS, always
    2'b00, // reserved
    1'b0,  // TPOI = 0
    1'b0,  // expansion byte = 0
    header_prev_corrupt,
    header_prev_dropped
  };

  logic d1_data_readdatavalid;
  logic d1_last_rdv;
  logic [32 - 1 : 0] d1_data_readdata;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      capture_valid <= '0;
      {capture_data, capture_startofpacket} <= 'x;
      d1_data_readdatavalid <= '0;
      d1_data_readdata <= '0;
    end
    else begin
      d1_data_readdatavalid <= data_readdatavalid;
      d1_data_readdata <= data_readdata;


      if (timestamp_capture) begin
        capture_valid <= '1;
        // header and timestamp beat
        // note endianness swapping on timestamp: assumes 24-bit full timestamp
        // width.
        capture_data <= {
          header, 
          full_timestamp[7:0], 
          full_timestamp[15:8], 
          full_timestamp[23:16]
        };
        capture_startofpacket <= '1;
      end
      else if (~capture_valid | capture_valid & capture_ready) begin
        capture_valid <= d1_data_readdatavalid;
        capture_startofpacket <= '0;

        // Note that capture_data could change while ready
        // is deasserted - this is not a protocol violation.
        // However, in order to guarantee that the first beat
        // of the packet contains a valid header byte, it's easiest
        // to register-enable capture_data as a function of ready.
        capture_data <= d1_data_readdata;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      d1_last_rdv <= '0;
      capture_endofpacket <= '0;
    end
    else begin
      d1_last_rdv <= last_rdv;
      // capture_endofpacket is set independent of capture_ready; this
      // covers the case where ready is deasserted one beat before the
      // last-arriving readdata item (otherwise endofpacket is never asserted
      // for that packet).
      if (d1_last_rdv)
        capture_endofpacket <= '1;
      else if (capture_valid & capture_ready)
        capture_endofpacket <= '0;
    end
  end

  // this_beat_corrupt is valid in the second and subsequent cycles of a beat.
  // It indicates that at some point during this beat, corruption occurred.
  // This signal prevents early clear of the CORR bit, when corruption
  // occurs on the startofpacket beat.
  logic this_beat_corrupt;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      this_beat_corrupt <= '0;
    end
    else begin
      if (capture_valid & ~capture_ready & (timestamp_capture | d1_data_readdatavalid)) begin
        this_beat_corrupt <= '1;
      end
      else if (capture_valid & capture_ready) begin
        this_beat_corrupt <= '0;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      header_prev_corrupt <= '0;
    end
    else begin
      if (capture_valid & ~capture_ready & (timestamp_capture | d1_data_readdatavalid)) begin
        // Set the CORR bit for transmission in the next packet.
        // Optimization: we might be at the beginning of a large, already
        // corrupt packet. Consider early termination of this packet, which
        // requires 1) signaling the data master to stop reading, 2) early eop
        // generation.
        // 
        header_prev_corrupt <= '1;
      end
      else if (~this_beat_corrupt & capture_valid & capture_ready & capture_startofpacket) begin
        // Just transmitted the status bits - clear them now.
        // Interesting corner case: corruption on the first packet beat.
        header_prev_corrupt <= '0;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      header_prev_dropped <= '0;
    end
    else begin
      if (packet_dropped) begin
        header_prev_dropped <= '1;
      end
      else if (capture_valid & capture_ready & capture_startofpacket) begin
        // Just transmitted the status bits - clear them now.
        header_prev_dropped <= '0;
      end
    end
  end


endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_capture_source_fifo(
  input wire [32 - 1 : 0] in_data,
  input wire in_valid,
  output reg in_ready,
  input wire in_startofpacket,
  input wire in_endofpacket,
  input wire [2 - 1 : 0] in_empty,

  output reg [32 - 1 : 0] out_data,
  output reg out_valid,
  input wire out_ready,
  output reg out_startofpacket,
  output reg out_endofpacket,
  output reg [2 - 1 : 0] out_empty,

  // Feedback to the read state machine: is there enough FIFO
  // space to store a complete packet? (If the internal FIFO 
  // feature is not enabled, default to "yes" for backward 
  // compatibility.)
  output wire enable_capture,

  input wire clk,
  input wire reset
);

  // altera_avalon_sc_fifo with 8 32-bit locations
  // The "almost empty" interface is active when there is
  // enough space in the FIFO for one packet (4 + 1 words).
  altera_avalon_sc_fifo #(
    .SYMBOLS_PER_BEAT    (4),
    .BITS_PER_SYMBOL     (8),
    .FIFO_DEPTH          (8),
    .CHANNEL_WIDTH       (0),
    .ERROR_WIDTH         (0),
    .USE_PACKETS         (1),
    .USE_FILL_LEVEL      (1),
    .EMPTY_LATENCY       (1),
    .USE_MEMORY_BLOCKS   (1),
    .USE_STORE_FORWARD   (0),
    .USE_ALMOST_FULL_IF  (0),
    .USE_ALMOST_EMPTY_IF (1)
  ) capture_fifo (
    .clk               (clk),
    .reset             (reset),
    .in_data           (in_data),
    .in_valid          (in_valid),
    .in_ready          (in_ready),
    .in_startofpacket  (in_startofpacket),
    .in_endofpacket    (in_endofpacket),
    .in_empty          ('0),
    .in_error          ('0),
    .in_channel        ('0),

    .out_data          (out_data),
    .out_valid         (out_valid),
    .out_ready         (out_ready),
    .out_startofpacket (out_startofpacket),
    .out_endofpacket   (out_endofpacket),
    .out_empty         (),
    .out_error         (),
    .out_channel       (),

    .csr_address       (2'b11),
    .csr_read          (1'b0),
    .csr_write         (1'b1),
    .csr_readdata      (),
    .csr_writedata     (32'd3),

    .almost_full_data  (),
    .almost_empty_data (enable_capture)
  );

  // empty is not really used by these ST interfaces, but it's needed to avoid
  // a warning from the trace controller.
  assign out_empty = in_empty;

endmodule

module system_mm_interconnect_0_monitor_system_console_master_gatherer_config_master(
  output reg [(32 / 8) - 1 : 0] config_byteenable,
  output reg config_read,
  output reg config_write,
  output reg [4 - 1 : 0] config_address,
  output reg [32 - 1 : 0] config_writedata,
  input wire config_waitrequest,
  input wire config_readdatavalid,

  input wire new_config_address_value_valid,
  input wire [4 - 1 : 0] new_config_address_value,
  input wire [32 - 1 : 0] new_config_writedata_value,

  input wire initiate_read_CONFIG_DATA,
  input wire initiate_write_CONFIG_DATA,
  output reg ack_config_access,

  input wire clk,
  input wire reset
);

  typedef enum int unsigned {
    ST_CM_IDLE,
    ST_CM_WRITE_WAIT,
    ST_CM_READ_WAIT,
    ST_CM_FAIL
  } t_config_master_state;
  t_config_master_state state, p1_state;

  logic [32 - 1 : 0] p1_config_writedata;
  logic [(32 / 8) - 1 : 0] p1_config_byteenable;
  logic p1_config_write, p1_config_read;
  logic p1_ack_config_access;
  logic pending_rdv, p1_pending_rdv;
  always @* begin : state_transition
    p1_state = state;
    p1_config_byteenable = config_byteenable;
    p1_ack_config_access = '0;
    p1_config_writedata = config_writedata; 
    p1_config_write = config_write;
    p1_config_read = config_read;
    p1_pending_rdv = pending_rdv & ~config_readdatavalid;
    case (state)
      ST_CM_IDLE: begin
        if (initiate_write_CONFIG_DATA | initiate_read_CONFIG_DATA) begin
          p1_state = initiate_write_CONFIG_DATA ? ST_CM_WRITE_WAIT : ST_CM_READ_WAIT;
          p1_config_write = ~pending_rdv & initiate_write_CONFIG_DATA;
          p1_config_read = ~pending_rdv & initiate_read_CONFIG_DATA;
          p1_config_writedata = new_config_writedata_value;
        end
      end

      ST_CM_WRITE_WAIT: begin
        p1_config_write = ~pending_rdv;
        if (config_write & ~config_waitrequest) begin
          p1_state = ST_CM_IDLE;
          p1_config_write = '0;
          p1_ack_config_access = '1;
        end
      end

      ST_CM_READ_WAIT: begin
        p1_config_read = ~pending_rdv;
        if (config_read & ~config_waitrequest) begin
          p1_config_read = '0;
          p1_ack_config_access = '1;
          p1_state = ST_CM_IDLE;
          p1_pending_rdv = '1;
        end
      end

      default: begin
        p1_state = ST_CM_FAIL;
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      ack_config_access <= '0;
      config_read <= '0;
      config_write <= '0;
      config_byteenable <= '1;
      config_writedata <= '0;
      state <= ST_CM_IDLE;
      pending_rdv <= '0;
    end
    else begin
      ack_config_access <= p1_ack_config_access;
      config_read <= p1_config_read;
      config_write <= p1_config_write;
      config_byteenable <= p1_config_byteenable;
      config_writedata <= p1_config_writedata;
      state <= p1_state;
      pending_rdv <= p1_pending_rdv;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      config_address <= '0;
    end
    else if (new_config_address_value_valid) begin
      config_address <= new_config_address_value;
    end
  end

endmodule

// Generation parameters:
//   output_name: system_mm_interconnect_0_monitor_system_console_master_gatherer
//   capture_datawidth: 32
//   capture_emptywidth: 2
//   control_datawidth: 32
//   control_addresswidth: 6
//   data_addresswidth: 4
//   config_addresswidth: 4
//   base_addresses: 0
//   end_addresses: 16
//   spans: 3
//   spanwidth: 2
//   num_slaves: 1
//   count_width: 26
//   timer_reload: 999999
//   full_ts_length: 24
//   payload_size: 4
//   payload_counter_width: 2
//   clock_rate: 50000000
//   sample_period: 20.0
//   sample_period_units: MSEC
//   start_enabled: false
//   use_internal_fifo: true
//   fifo_size: 8

module system_mm_interconnect_0_monitor_system_console_master_gatherer (

  // capture
  output reg [32 - 1 : 0] capture_data,
  output reg capture_valid,
  input wire capture_ready,
  output reg capture_startofpacket,
  output reg capture_endofpacket,
  output reg [2 - 1 : 0] capture_empty,

  // control
  input wire [6 - 1 : 0] control_address,
  input wire control_read,
  input wire control_write,
  input wire [32 - 1 : 0] control_writedata,
  output wire [32 - 1 : 0] control_readdata,
  output wire control_waitrequest,
  output wire control_readdatavalid,
  
  // data
  input wire [32 - 1 : 0] data_readdata,
  output wire [(32 / 8) - 1 : 0] data_byteenable,
  output wire data_read,
  output wire [4 - 1 : 0] data_address,
  input wire data_readdatavalid,
  input wire data_waitrequest,

  // config
  input wire [32 - 1 : 0] config_readdata,
  output wire [(32 / 8) - 1 : 0] config_byteenable,
  output wire config_read,
  output wire config_write,
  output wire [4 - 1 : 0] config_address,
  output wire [32 - 1 : 0] config_writedata,
  input wire config_readdatavalid,
  input wire config_waitrequest,

  // clock
  input wire clk,

  // reset
  input wire reset
);
  localparam 
            NUM_SLAVES      = 1,
            SHORT_TS_LENGTH = 0,
            VERSION         = 4'h0,
            TYPE_NAME       = 16'hXXXX, // TBD
            ALTERA          = 11'h6E;
  // Address decode
  logic enable_valid;
  logic new_timer_reload_value_valid;
  logic new_config_address_value_valid;
  logic read_ID;
  logic read_TS_INFO;
  logic read_CONTROL;
  logic read_TIMER_RELOAD;
  logic read_CONFIG_ADDRESS;
  logic read_nothing;
  logic initiate_read_CONFIG_DATA;
  logic initiate_write_CONFIG_DATA;
  logic initiate_write_CONFIG_DATA_ack;
  logic ack_config_access;
  system_mm_interconnect_0_monitor_system_console_master_gatherer_address_decode addr_decode(
    .enable_valid (enable_valid),
    .new_timer_reload_value_valid (new_timer_reload_value_valid),
    .new_config_address_value_valid (new_config_address_value_valid),
    .read_ID (read_ID),
    .read_TS_INFO (read_TS_INFO),
    .read_CONTROL (read_CONTROL),
    .read_TIMER_RELOAD (read_TIMER_RELOAD),
    .read_CONFIG_ADDRESS (read_CONFIG_ADDRESS),
    .read_nothing (read_nothing),
    .initiate_read_CONFIG_DATA (initiate_read_CONFIG_DATA),
    .initiate_write_CONFIG_DATA (initiate_write_CONFIG_DATA),

    .control_address (control_address),
    .control_read (control_read),
    .control_write (control_write),
    .control_waitrequest (control_waitrequest),

    .config_readdatavalid (config_readdatavalid),

    .ack_config_access (ack_config_access),

    .clk (clk),
    .reset (reset)
  );

  // The periodic timer
  logic trigger_capture;
  logic enabled;
  logic [26 - 1 : 0] timer_reload;
  system_mm_interconnect_0_monitor_system_console_master_gatherer_periodic_timer timer(
    .enable (control_writedata[0]),
    .enable_valid (enable_valid),
    .enabled (enabled),
    .new_timer_reload_value (control_writedata[26 - 1 : 0 ]),
    .new_timer_reload_value_valid (new_timer_reload_value_valid),
    .timer_reload (timer_reload),
    .trigger_capture (trigger_capture),
    .clk (clk),
    .reset (reset)
  );

  // data master
  logic data_master_busy;
  logic timestamp_capture;
  logic last_rdv;
  logic enable_capture;
  wire initiate_capture = trigger_capture & enable_capture;
  wire packet_dropped = trigger_capture & ~enable_capture;
  system_mm_interconnect_0_monitor_system_console_master_gatherer_data_master data_master(
    .data_byteenable (data_byteenable),
    .data_read (data_read),
    .data_address (data_address),
    .data_readdatavalid (data_readdatavalid),
    .data_waitrequest (data_waitrequest),
    .initiate_capture (initiate_capture),
    .timestamp_capture (timestamp_capture),
    .last_rdv (last_rdv),
    .data_master_busy (data_master_busy),
    .clk (clk),
    .reset (reset)
  );

  // control interface readdata mux
  system_mm_interconnect_0_monitor_system_console_master_gatherer_control_readdata_mux control_readdata_mux(
    .control_readdata (control_readdata),
    .control_readdatavalid (control_readdatavalid),
    .data_master_busy (data_master_busy),
    .capture_packet_transmitted (capture_valid & capture_ready & capture_endofpacket),
    .enabled (enabled),
    .timer_reload (timer_reload),
    .config_address (config_address),
    .read_ID (read_ID),
    .read_TS_INFO (read_TS_INFO),
    .read_CONTROL (read_CONTROL),
    .read_TIMER_RELOAD (read_TIMER_RELOAD),
    .read_CONFIG_ADDRESS (read_CONFIG_ADDRESS),
    .read_nothing (read_nothing),
    .config_readdata (config_readdata),
    .config_readdatavalid (config_readdatavalid),
    .clk (clk),
    .reset (reset)
  );

  // timestamp generator
  logic [24 - 1 : 0] timestamp;
  system_mm_interconnect_0_monitor_system_console_master_gatherer_timestamp_generator #(
      .FULL_TS_LENGTH (24)
    )
    timestamp_gen(
      .full_timestamp (timestamp),

      .clk (clk),
      .reset (reset)
  );

  logic [32 - 1 : 0] pre_fifo_capture_data;
  logic pre_fifo_capture_valid;
  logic pre_fifo_capture_ready;
  logic pre_fifo_capture_startofpacket;
  logic pre_fifo_capture_endofpacket;
  logic [2 - 1 : 0] pre_fifo_capture_empty;
  // capture source
  system_mm_interconnect_0_monitor_system_console_master_gatherer_capture_source capture_source(
    .capture_data (pre_fifo_capture_data),
    .capture_valid (pre_fifo_capture_valid),
    .capture_ready (pre_fifo_capture_ready),
    .capture_startofpacket (pre_fifo_capture_startofpacket),
    .capture_endofpacket (pre_fifo_capture_endofpacket),
    .capture_empty (pre_fifo_capture_empty),

    .timestamp_capture (timestamp_capture),
    .full_timestamp (timestamp),

    .last_rdv (last_rdv),
    .data_readdatavalid (data_readdatavalid),
    .data_readdata (data_readdata),
   
    .packet_dropped (packet_dropped),

    .clk (clk),
    .reset (reset)
  );

  system_mm_interconnect_0_monitor_system_console_master_gatherer_capture_source_fifo capture_fifo(
    .in_data (pre_fifo_capture_data),
    .in_valid (pre_fifo_capture_valid),
    .in_ready (pre_fifo_capture_ready),
    .in_startofpacket (pre_fifo_capture_startofpacket),
    .in_endofpacket (pre_fifo_capture_endofpacket),
    .in_empty (pre_fifo_capture_empty),

    .out_data (capture_data),
    .out_valid (capture_valid),
    .out_ready (capture_ready),
    .out_startofpacket (capture_startofpacket),
    .out_endofpacket (capture_endofpacket),
    .out_empty (capture_empty),

    .enable_capture (enable_capture),

    .clk (clk),
    .reset (reset)
  );

  // config master
  system_mm_interconnect_0_monitor_system_console_master_gatherer_config_master config_master(
    .config_byteenable (config_byteenable),
    .config_read (config_read),
    .config_write (config_write),
    .config_writedata (config_writedata),
    .config_address (config_address),
    .config_waitrequest (config_waitrequest),
    .config_readdatavalid (config_readdatavalid),

    .new_config_address_value_valid (new_config_address_value_valid),
    .new_config_address_value (control_writedata[4 - 1 : 0 ]),

    .new_config_writedata_value (control_writedata),
    
    .initiate_read_CONFIG_DATA (initiate_read_CONFIG_DATA),
    .initiate_write_CONFIG_DATA (initiate_write_CONFIG_DATA),
    .ack_config_access (ack_config_access),

    .clk (clk),
    .reset (reset)
  );

endmodule

`default_nettype wire



