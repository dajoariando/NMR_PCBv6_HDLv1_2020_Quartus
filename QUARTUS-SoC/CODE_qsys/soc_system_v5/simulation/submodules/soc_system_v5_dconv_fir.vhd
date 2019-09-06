-- (C) 2001-2017 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


library IEEE;
use IEEE.std_logic_1164.all;
use work.auk_dspip_lib_pkg_hpfir.all;
use work.auk_dspip_math_pkg_hpfir.all;

entity soc_system_v5_dconv_fir is
  port (
    clk : in STD_LOGIC;    
    reset_n : in STD_LOGIC;
    coeff_in_clk : in STD_LOGIC;
    coeff_in_areset : in STD_LOGIC;
    coeff_in_address : in STD_LOGIC_VECTOR(6-1 downto 0);
    coeff_in_data : in STD_LOGIC_VECTOR(16-1 downto 0);
    coeff_in_we : in STD_LOGIC_VECTOR(0 downto 0);
    coeff_in_read : in STD_LOGIC;
    coeff_out_data : out STD_LOGIC_VECTOR(16-1 downto 0);
    coeff_out_valid : out STD_LOGIC_VECTOR(0 downto 0);
    ast_sink_data : in STD_LOGIC_VECTOR((0 + 1*15) * 1 + 0 - 1 downto 0);
    ast_sink_valid : in STD_LOGIC;
    ast_sink_error : in STD_LOGIC_VECTOR(1 downto 0);
    ast_source_data : out STD_LOGIC_VECTOR(32 * 1*1 - 1 downto 0);
    ast_source_valid : out STD_LOGIC;
    ast_source_error : out STD_LOGIC_VECTOR(1 downto 0)
  );
end soc_system_v5_dconv_fir;


architecture syn of soc_system_v5_dconv_fir is
  component soc_system_v5_dconv_fir_ast
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    bus_clk            : in std_logic;
    h_areset           : in std_logic;
    busIn_a           : in std_logic_vector(6-1 downto 0);
    busIn_d            : in std_logic_vector(15 downto 0);
    busIn_w            : in std_logic_vector(0 downto 0);
    busIn_read         : in std_logic;
    busOut_r           : out std_logic_vector(15 downto 0);
    busOut_v           : out std_logic_vector(0 downto 0);
    ast_sink_data : in STD_LOGIC_VECTOR((0 + 1*15) * 1 + 0 - 1 downto 0);
    ast_sink_valid : in STD_LOGIC;
    ast_sink_ready : out STD_LOGIC;
    ast_sink_sop : in STD_LOGIC;
    ast_sink_eop : in STD_LOGIC;
    ast_sink_error : in STD_LOGIC_VECTOR(1 downto 0);
    ast_source_data : out STD_LOGIC_VECTOR(1*32 * 1 - 1 downto 0);
    ast_source_ready : in STD_LOGIC;
    ast_source_valid : out STD_LOGIC;
    ast_source_sop : out STD_LOGIC;
    ast_source_eop : out STD_LOGIC;
    ast_source_channel : out STD_LOGIC_VECTOR(log2_ceil_one(1) - 1 downto 0);
    ast_source_error : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;

    signal coeff_in_read_sig : std_logic;

begin

    coeff_in_read_sig  <= not(coeff_in_we(0));



  soc_system_v5_dconv_fir_ast_inst : soc_system_v5_dconv_fir_ast
  port map (
    clk => clk,
    reset_n => reset_n,
        bus_clk => coeff_in_clk,
        h_areset => coeff_in_areset,
        busIn_a   => coeff_in_address,
        busIn_d   => coeff_in_data,
        busIn_w   => coeff_in_we,
        busIn_read  => coeff_in_read_sig,
        busOut_r  => coeff_out_data,
        busOut_v  => coeff_out_valid,       
    ast_sink_data => ast_sink_data,
    ast_source_data => ast_source_data,
    ast_sink_valid => ast_sink_valid,
        ast_sink_ready => open,
        ast_source_ready => '1',
    ast_source_valid => ast_source_valid,
        ast_sink_sop => '0',
        ast_sink_eop => '0',
    ast_sink_error => ast_sink_error,
        ast_source_sop => open,
        ast_source_eop => open,
        ast_source_channel => open,
    ast_source_error => ast_source_error
  );
end syn;


