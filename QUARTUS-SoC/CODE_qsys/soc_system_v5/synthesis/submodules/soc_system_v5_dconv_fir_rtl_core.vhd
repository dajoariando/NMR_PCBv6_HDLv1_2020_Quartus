-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #590)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from soc_system_v5_dconv_fir_rtl_core
-- VHDL created on Fri Aug 30 09:42:08 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity soc_system_v5_dconv_fir_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(14 downto 0);  -- sfix15
        busIn_writedata : in std_logic_vector(15 downto 0);  -- sfix16
        busIn_address : in std_logic_vector(5 downto 0);  -- sfix6
        busIn_write : in std_logic_vector(0 downto 0);  -- sfix1
        busIn_read : in std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
    );
end soc_system_v5_dconv_fir_rtl_core;

architecture normal of soc_system_v5_dconv_fir_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_read_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_writedata_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rblookup_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rblookup_h : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_c : STD_LOGIC_VECTOR (0 downto 0);
    signal d_rblookup_h_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rm_reset0 : std_logic;
    signal rm_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal rm_aa : STD_LOGIC_VECTOR (5 downto 0);
    signal rm_ab : STD_LOGIC_VECTOR (5 downto 0);
    signal rm_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal rm_q : STD_LOGIC_VECTOR (10 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec0_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec0_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec1_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec2_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec3_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec4_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec4_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec5_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec6_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm6_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec7_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec7_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec8_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec9_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec9_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec10_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec10_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm10_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec11_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec11_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec12_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec12_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec13_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec13_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm13_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec14_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec14_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec15_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec15_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec16_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec16_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec17_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec17_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec18_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec18_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec19_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec19_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm19_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec20_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec20_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm20_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec21_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec21_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm21_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec22_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec22_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm22_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec23_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec23_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm23_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec24_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec24_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm24_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec25_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec25_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm25_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec26_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec26_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm26_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec27_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec27_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm27_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec28_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec28_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm28_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec29_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec29_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm29_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec30_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec30_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm30_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec31_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec31_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm31_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec32_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec32_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm32_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec33_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec33_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm33_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec34_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec34_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm34_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec35_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec35_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm35_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_dec36_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec36_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm36_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 31);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(30 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_cma0_ena0 : std_logic;
    signal u0_m0_wo0_cma0_ena1 : std_logic;
    signal u0_m0_wo0_cma1_reset : std_logic;
    signal u0_m0_wo0_cma1_a0 : u0_m0_wo0_cma0_a0type(0 to 5);
    attribute preserve of u0_m0_wo0_cma1_a0 : signal is true;
    signal u0_m0_wo0_cma1_c0 : u0_m0_wo0_cma0_c0type(0 to 5);
    attribute preserve of u0_m0_wo0_cma1_c0 : signal is true;
    signal u0_m0_wo0_cma1_p : u0_m0_wo0_cma0_ptype(0 to 5);
    type u0_m0_wo0_cma1_utype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal u0_m0_wo0_cma1_u : u0_m0_wo0_cma1_utype(0 to 5);
    signal u0_m0_wo0_cma1_w : u0_m0_wo0_cma1_utype(0 to 5);
    signal u0_m0_wo0_cma1_x : u0_m0_wo0_cma1_utype(0 to 5);
    signal u0_m0_wo0_cma1_y : u0_m0_wo0_cma1_utype(0 to 5);
    signal u0_m0_wo0_cma1_s : u0_m0_wo0_cma1_utype(0 to 5);
    signal u0_m0_wo0_cma1_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma1_ena0 : std_logic;
    signal u0_m0_wo0_cma1_ena1 : std_logic;
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr32_mem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_iq : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr32_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr32_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q : signal is true;
    signal rblookup_read_hit_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr33_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr34_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr35_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr36_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rmPad_sel_b : STD_LOGIC_VECTOR (15 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- d_busIn_writedata_11(DELAY,187)@10 + 1
    d_busIn_writedata_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_writedata, xout => d_busIn_writedata_11_q, clk => bus_clk, aclr => h_areset );

    -- rblookup(LOOKUP,4)@10 + 1
    rblookup_c <= STD_LOGIC_VECTOR(busIn_write);
    rblookup_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_q <= "000000";
            rblookup_h <= "0";
            rblookup_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000000" => rblookup_q <= "000000";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000001" => rblookup_q <= "000001";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000010" => rblookup_q <= "000010";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000011" => rblookup_q <= "000011";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000100" => rblookup_q <= "000100";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000101" => rblookup_q <= "000101";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000110" => rblookup_q <= "000110";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "000111" => rblookup_q <= "000111";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001000" => rblookup_q <= "001000";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001001" => rblookup_q <= "001001";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001010" => rblookup_q <= "001010";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001011" => rblookup_q <= "001011";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001100" => rblookup_q <= "001100";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001101" => rblookup_q <= "001101";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001110" => rblookup_q <= "001110";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "001111" => rblookup_q <= "001111";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010000" => rblookup_q <= "010000";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010001" => rblookup_q <= "010001";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010010" => rblookup_q <= "010010";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010011" => rblookup_q <= "010011";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010100" => rblookup_q <= "010100";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010101" => rblookup_q <= "010101";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010110" => rblookup_q <= "010110";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "010111" => rblookup_q <= "010111";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011000" => rblookup_q <= "011000";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011001" => rblookup_q <= "011001";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011010" => rblookup_q <= "011010";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011011" => rblookup_q <= "011011";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011100" => rblookup_q <= "011100";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011101" => rblookup_q <= "011101";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011110" => rblookup_q <= "011110";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "011111" => rblookup_q <= "011111";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "100000" => rblookup_q <= "100000";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "100001" => rblookup_q <= "100001";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "100010" => rblookup_q <= "100010";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "100011" => rblookup_q <= "100011";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN "100100" => rblookup_q <= "100100";
                                 rblookup_h <= "1";
                                 rblookup_e <= rblookup_c;
                WHEN OTHERS => rblookup_q <= (others => '-');
                               rblookup_h <= "0";
                               rblookup_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- rm(DUALMEM,7)@11 + 2
    rm_ia <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
    rm_aa <= rblookup_q;
    rm_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "SINGLE_PORT",
        width_a => 11,
        widthad_a => 6,
        numwords_a => 37,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "NONE",
        clock_enable_input_a => "NORMAL",
        read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
        power_up_uninitialized => "FALSE",
        init_file => "soc_system_v5_dconv_fir_rtl_core_rm.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => bus_clk,
        address_a => rm_aa,
        data_a => rm_ia,
        wren_a => rblookup_e(0),
        q_a => rm_iq
    );
    rm_q <= rm_iq(10 downto 0);

    -- rmPad_sel(BITSELECT,186)@13
    rmPad_sel_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(rm_q(10 downto 0)), 16)));

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_busIn_read_12(DELAY,188)@10 + 2
    d_busIn_read_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_read, xout => d_busIn_read_12_q, clk => bus_clk, aclr => h_areset );

    -- d_rblookup_h_12(DELAY,189)@11 + 1
    d_rblookup_h_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rblookup_h, xout => d_rblookup_h_12_q, clk => bus_clk, aclr => h_areset );

    -- rblookup_read_hit(LOGICAL,5)@12
    rblookup_read_hit_q <= d_rblookup_h_12_q and d_busIn_read_12_q;

    -- rblookup_valid(REG,6)@12 + 1
    rblookup_valid_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_valid_q <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            rblookup_valid_q <= STD_LOGIC_VECTOR(rblookup_read_hit_q);
        END IF;
    END PROCESS;

    -- busOut(BUSOUT,9)@13
    busOut_readdatavalid <= rblookup_valid_q;
    busOut_readdata <= rmPad_sel_b;

    -- u0_m0_wo0_dec36(LOOKUP,174)@10 + 1
    u0_m0_wo0_dec36_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec36_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec36_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "100100" => u0_m0_wo0_dec36_e <= u0_m0_wo0_dec36_c;
                WHEN OTHERS => u0_m0_wo0_dec36_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm36(REG,175)@11 + 1
    u0_m0_wo0_cm36_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm36_q <= "00001001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec36_e = "1") THEN
                u0_m0_wo0_cm36_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr36(DELAY,62)@10
    u0_m0_wo0_wi0_r0_delayr36_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr35_q);

    -- u0_m0_wo0_dec35(LOOKUP,171)@10 + 1
    u0_m0_wo0_dec35_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec35_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec35_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "100011" => u0_m0_wo0_dec35_e <= u0_m0_wo0_dec35_c;
                WHEN OTHERS => u0_m0_wo0_dec35_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm35(REG,172)@11 + 1
    u0_m0_wo0_cm35_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm35_q <= "00000110110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec35_e = "1") THEN
                u0_m0_wo0_cm35_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr35(DELAY,61)@10
    u0_m0_wo0_wi0_r0_delayr35_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr34_q);

    -- u0_m0_wo0_dec34(LOOKUP,168)@10 + 1
    u0_m0_wo0_dec34_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec34_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec34_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "100010" => u0_m0_wo0_dec34_e <= u0_m0_wo0_dec34_c;
                WHEN OTHERS => u0_m0_wo0_dec34_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm34(REG,169)@11 + 1
    u0_m0_wo0_cm34_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm34_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec34_e = "1") THEN
                u0_m0_wo0_cm34_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr34(DELAY,60)@10
    u0_m0_wo0_wi0_r0_delayr34_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr33_q);

    -- u0_m0_wo0_dec33(LOOKUP,165)@10 + 1
    u0_m0_wo0_dec33_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec33_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec33_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "100001" => u0_m0_wo0_dec33_e <= u0_m0_wo0_dec33_c;
                WHEN OTHERS => u0_m0_wo0_dec33_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm33(REG,166)@11 + 1
    u0_m0_wo0_cm33_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm33_q <= "11111000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec33_e = "1") THEN
                u0_m0_wo0_cm33_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr33(DELAY,59)@10
    u0_m0_wo0_wi0_r0_delayr33_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_mem_q);

    -- u0_m0_wo0_dec32(LOOKUP,162)@10 + 1
    u0_m0_wo0_dec32_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec32_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec32_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "100000" => u0_m0_wo0_dec32_e <= u0_m0_wo0_dec32_c;
                WHEN OTHERS => u0_m0_wo0_dec32_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm32(REG,163)@11 + 1
    u0_m0_wo0_cm32_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm32_q <= "11110100011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec32_e = "1") THEN
                u0_m0_wo0_cm32_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_notEnable(LOGICAL,199)@10
    u0_m0_wo0_wi0_r0_delayr32_notEnable_q <= STD_LOGIC_VECTOR(not (xIn_v));

    -- u0_m0_wo0_wi0_r0_delayr32_nor(LOGICAL,200)@10
    u0_m0_wo0_wi0_r0_delayr32_nor_q <= not (u0_m0_wo0_wi0_r0_delayr32_notEnable_q or u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr32_mem_last(CONSTANT,196)
    u0_m0_wo0_wi0_r0_delayr32_mem_last_q <= "011101";

    -- u0_m0_wo0_wi0_r0_delayr32_cmp(LOGICAL,197)@10
    u0_m0_wo0_wi0_r0_delayr32_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_delayr32_rdmux_q);
    u0_m0_wo0_wi0_r0_delayr32_cmp_q <= "1" WHEN u0_m0_wo0_wi0_r0_delayr32_mem_last_q = u0_m0_wo0_wi0_r0_delayr32_cmp_b ELSE "0";

    -- u0_m0_wo0_wi0_r0_delayr32_cmpReg(REG,198)@10 + 1
    u0_m0_wo0_wi0_r0_delayr32_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_r0_delayr32_cmpReg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_sticky_ena(REG,201)@10 + 1
    u0_m0_wo0_wi0_r0_delayr32_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr32_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_enaAnd(LOGICAL,202)@10
    u0_m0_wo0_wi0_r0_delayr32_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q and xIn_v;

    -- u0_m0_wo0_wi0_r0_delayr32_rdcnt(COUNTER,193)@10 + 1
    -- low=0, high=30, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr32_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_rdcnt_i <= TO_UNSIGNED(0, 5);
            u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                IF (u0_m0_wo0_wi0_r0_delayr32_rdcnt_i = TO_UNSIGNED(29, 5)) THEN
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr32_rdcnt_i + 2;
                ELSE
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr32_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr32_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr32_rdcnt_i, 5)));

    -- u0_m0_wo0_wi0_r0_delayr32_rdmux(MUX,194)@10
    u0_m0_wo0_wi0_r0_delayr32_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_r0_delayr32_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr32_rdmux_s, u0_m0_wo0_wi0_r0_delayr32_wraddr_q, u0_m0_wo0_wi0_r0_delayr32_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr32_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr32_rdmux_q <= u0_m0_wo0_wi0_r0_delayr32_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr32_rdmux_q <= u0_m0_wo0_wi0_r0_delayr32_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr32_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_wraddr(REG,195)@10 + 1
    u0_m0_wo0_wi0_r0_delayr32_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_wraddr_q <= "11110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_mem(DUALMEM,192)@10 + 2
    u0_m0_wo0_wi0_r0_delayr32_mem_ia <= STD_LOGIC_VECTOR(xIn_0);
    u0_m0_wo0_wi0_r0_delayr32_mem_aa <= u0_m0_wo0_wi0_r0_delayr32_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr32_mem_ab <= u0_m0_wo0_wi0_r0_delayr32_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr32_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr32_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 15,
        widthad_b => 5,
        numwords_b => 31,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr32_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr32_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr32_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr32_mem_ia,
        wren_a => xIn_v(0),
        address_b => u0_m0_wo0_wi0_r0_delayr32_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr32_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr32_mem_q <= u0_m0_wo0_wi0_r0_delayr32_mem_iq(14 downto 0);

    -- d_u0_m0_wo0_compute_q_11(DELAY,190)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma1(CHAINMULTADD,178)@10 + 2
    u0_m0_wo0_cma1_reset <= areset;
    u0_m0_wo0_cma1_ena0 <= xIn_v(0);
    u0_m0_wo0_cma1_ena1 <= d_u0_m0_wo0_compute_q_11_q(0);
    u0_m0_wo0_cma1_p(0) <= u0_m0_wo0_cma1_a0(0) * u0_m0_wo0_cma1_c0(0);
    u0_m0_wo0_cma1_p(1) <= u0_m0_wo0_cma1_a0(1) * u0_m0_wo0_cma1_c0(1);
    u0_m0_wo0_cma1_p(2) <= u0_m0_wo0_cma1_a0(2) * u0_m0_wo0_cma1_c0(2);
    u0_m0_wo0_cma1_p(3) <= u0_m0_wo0_cma1_a0(3) * u0_m0_wo0_cma1_c0(3);
    u0_m0_wo0_cma1_p(4) <= u0_m0_wo0_cma1_a0(4) * u0_m0_wo0_cma1_c0(4);
    u0_m0_wo0_cma1_p(5) <= u0_m0_wo0_cma1_a0(5) * u0_m0_wo0_cma1_c0(5);
    u0_m0_wo0_cma1_u(0) <= RESIZE(u0_m0_wo0_cma1_p(0),29);
    u0_m0_wo0_cma1_u(1) <= RESIZE(u0_m0_wo0_cma1_p(1),29);
    u0_m0_wo0_cma1_u(2) <= RESIZE(u0_m0_wo0_cma1_p(2),29);
    u0_m0_wo0_cma1_u(3) <= RESIZE(u0_m0_wo0_cma1_p(3),29);
    u0_m0_wo0_cma1_u(4) <= RESIZE(u0_m0_wo0_cma1_p(4),29);
    u0_m0_wo0_cma1_u(5) <= RESIZE(u0_m0_wo0_cma1_p(5),29);
    u0_m0_wo0_cma1_w(0) <= u0_m0_wo0_cma1_u(0);
    u0_m0_wo0_cma1_w(1) <= u0_m0_wo0_cma1_u(1);
    u0_m0_wo0_cma1_w(2) <= u0_m0_wo0_cma1_u(2);
    u0_m0_wo0_cma1_w(3) <= u0_m0_wo0_cma1_u(3);
    u0_m0_wo0_cma1_w(4) <= u0_m0_wo0_cma1_u(4);
    u0_m0_wo0_cma1_w(5) <= u0_m0_wo0_cma1_u(5);
    u0_m0_wo0_cma1_x(0) <= u0_m0_wo0_cma1_w(0);
    u0_m0_wo0_cma1_x(1) <= u0_m0_wo0_cma1_w(1);
    u0_m0_wo0_cma1_x(2) <= u0_m0_wo0_cma1_w(2);
    u0_m0_wo0_cma1_x(3) <= u0_m0_wo0_cma1_w(3);
    u0_m0_wo0_cma1_x(4) <= u0_m0_wo0_cma1_w(4);
    u0_m0_wo0_cma1_x(5) <= u0_m0_wo0_cma1_w(5);
    u0_m0_wo0_cma1_y(0) <= u0_m0_wo0_cma1_s(1) + u0_m0_wo0_cma1_x(0);
    u0_m0_wo0_cma1_y(1) <= u0_m0_wo0_cma1_s(2) + u0_m0_wo0_cma1_x(1);
    u0_m0_wo0_cma1_y(2) <= u0_m0_wo0_cma1_s(3) + u0_m0_wo0_cma1_x(2);
    u0_m0_wo0_cma1_y(3) <= u0_m0_wo0_cma1_s(4) + u0_m0_wo0_cma1_x(3);
    u0_m0_wo0_cma1_y(4) <= u0_m0_wo0_cma1_s(5) + u0_m0_wo0_cma1_x(4);
    u0_m0_wo0_cma1_y(5) <= u0_m0_wo0_cma1_x(5);
    u0_m0_wo0_cma1_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma1_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma1_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma1_ena0 = '1') THEN
                u0_m0_wo0_cma1_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr32_mem_q),15);
                u0_m0_wo0_cma1_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr33_q),15);
                u0_m0_wo0_cma1_a0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr34_q),15);
                u0_m0_wo0_cma1_a0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr35_q),15);
                u0_m0_wo0_cma1_a0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr36_q),15);
                u0_m0_wo0_cma1_a0(5) <= (others => '0');
                u0_m0_wo0_cma1_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm32_q),11);
                u0_m0_wo0_cma1_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm33_q),11);
                u0_m0_wo0_cma1_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm34_q),11);
                u0_m0_wo0_cma1_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm35_q),11);
                u0_m0_wo0_cma1_c0(4) <= RESIZE(SIGNED(u0_m0_wo0_cm36_q),11);
                u0_m0_wo0_cma1_c0(5) <= (others => '0');
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma1_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma1_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma1_ena1 = '1') THEN
                u0_m0_wo0_cma1_s(0) <= u0_m0_wo0_cma1_y(0);
                u0_m0_wo0_cma1_s(1) <= u0_m0_wo0_cma1_y(1);
                u0_m0_wo0_cma1_s(2) <= u0_m0_wo0_cma1_y(2);
                u0_m0_wo0_cma1_s(3) <= u0_m0_wo0_cma1_y(3);
                u0_m0_wo0_cma1_s(4) <= u0_m0_wo0_cma1_y(4);
                u0_m0_wo0_cma1_s(5) <= u0_m0_wo0_cma1_y(5);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma1_delay : dspba_delay
    GENERIC MAP ( width => 29, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma1_s(0)(28 downto 0)), xout => u0_m0_wo0_cma1_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma1_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma1_qq(28 downto 0));

    -- u0_m0_wo0_dec31(LOOKUP,159)@10 + 1
    u0_m0_wo0_dec31_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec31_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec31_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011111" => u0_m0_wo0_dec31_e <= u0_m0_wo0_dec31_c;
                WHEN OTHERS => u0_m0_wo0_dec31_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm31(REG,160)@11 + 1
    u0_m0_wo0_cm31_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm31_q <= "11110111010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec31_e = "1") THEN
                u0_m0_wo0_cm31_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec30(LOOKUP,156)@10 + 1
    u0_m0_wo0_dec30_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec30_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec30_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011110" => u0_m0_wo0_dec30_e <= u0_m0_wo0_dec30_c;
                WHEN OTHERS => u0_m0_wo0_dec30_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm30(REG,157)@11 + 1
    u0_m0_wo0_cm30_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm30_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec30_e = "1") THEN
                u0_m0_wo0_cm30_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec29(LOOKUP,153)@10 + 1
    u0_m0_wo0_dec29_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec29_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec29_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011101" => u0_m0_wo0_dec29_e <= u0_m0_wo0_dec29_c;
                WHEN OTHERS => u0_m0_wo0_dec29_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm29(REG,154)@11 + 1
    u0_m0_wo0_cm29_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm29_q <= "00001010011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec29_e = "1") THEN
                u0_m0_wo0_cm29_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec28(LOOKUP,150)@10 + 1
    u0_m0_wo0_dec28_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec28_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec28_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011100" => u0_m0_wo0_dec28_e <= u0_m0_wo0_dec28_c;
                WHEN OTHERS => u0_m0_wo0_dec28_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm28(REG,151)@11 + 1
    u0_m0_wo0_cm28_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm28_q <= "00010000010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec28_e = "1") THEN
                u0_m0_wo0_cm28_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec27(LOOKUP,147)@10 + 1
    u0_m0_wo0_dec27_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec27_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec27_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011011" => u0_m0_wo0_dec27_e <= u0_m0_wo0_dec27_c;
                WHEN OTHERS => u0_m0_wo0_dec27_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm27(REG,148)@11 + 1
    u0_m0_wo0_cm27_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm27_q <= "00001100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec27_e = "1") THEN
                u0_m0_wo0_cm27_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec26(LOOKUP,144)@10 + 1
    u0_m0_wo0_dec26_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec26_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec26_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011010" => u0_m0_wo0_dec26_e <= u0_m0_wo0_dec26_c;
                WHEN OTHERS => u0_m0_wo0_dec26_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm26(REG,145)@11 + 1
    u0_m0_wo0_cm26_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm26_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec26_e = "1") THEN
                u0_m0_wo0_cm26_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec25(LOOKUP,141)@10 + 1
    u0_m0_wo0_dec25_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec25_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec25_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011001" => u0_m0_wo0_dec25_e <= u0_m0_wo0_dec25_c;
                WHEN OTHERS => u0_m0_wo0_dec25_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm25(REG,142)@11 + 1
    u0_m0_wo0_cm25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm25_q <= "11101111101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec25_e = "1") THEN
                u0_m0_wo0_cm25_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec24(LOOKUP,138)@10 + 1
    u0_m0_wo0_dec24_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec24_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec24_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "011000" => u0_m0_wo0_dec24_e <= u0_m0_wo0_dec24_c;
                WHEN OTHERS => u0_m0_wo0_dec24_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm24(REG,139)@11 + 1
    u0_m0_wo0_cm24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm24_q <= "11100100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec24_e = "1") THEN
                u0_m0_wo0_cm24_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec23(LOOKUP,135)@10 + 1
    u0_m0_wo0_dec23_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec23_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec23_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010111" => u0_m0_wo0_dec23_e <= u0_m0_wo0_dec23_c;
                WHEN OTHERS => u0_m0_wo0_dec23_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm23(REG,136)@11 + 1
    u0_m0_wo0_cm23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm23_q <= "11101001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec23_e = "1") THEN
                u0_m0_wo0_cm23_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec22(LOOKUP,132)@10 + 1
    u0_m0_wo0_dec22_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec22_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec22_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010110" => u0_m0_wo0_dec22_e <= u0_m0_wo0_dec22_c;
                WHEN OTHERS => u0_m0_wo0_dec22_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm22(REG,133)@11 + 1
    u0_m0_wo0_cm22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm22_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec22_e = "1") THEN
                u0_m0_wo0_cm22_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec21(LOOKUP,129)@10 + 1
    u0_m0_wo0_dec21_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec21_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec21_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010101" => u0_m0_wo0_dec21_e <= u0_m0_wo0_dec21_c;
                WHEN OTHERS => u0_m0_wo0_dec21_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm21(REG,130)@11 + 1
    u0_m0_wo0_cm21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm21_q <= "00100110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec21_e = "1") THEN
                u0_m0_wo0_cm21_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec20(LOOKUP,126)@10 + 1
    u0_m0_wo0_dec20_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec20_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec20_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010100" => u0_m0_wo0_dec20_e <= u0_m0_wo0_dec20_c;
                WHEN OTHERS => u0_m0_wo0_dec20_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm20(REG,127)@11 + 1
    u0_m0_wo0_cm20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm20_q <= "01010001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec20_e = "1") THEN
                u0_m0_wo0_cm20_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec19(LOOKUP,123)@10 + 1
    u0_m0_wo0_dec19_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec19_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec19_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010011" => u0_m0_wo0_dec19_e <= u0_m0_wo0_dec19_c;
                WHEN OTHERS => u0_m0_wo0_dec19_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm19(REG,124)@11 + 1
    u0_m0_wo0_cm19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm19_q <= "01110011001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec19_e = "1") THEN
                u0_m0_wo0_cm19_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec18(LOOKUP,120)@10 + 1
    u0_m0_wo0_dec18_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec18_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec18_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010010" => u0_m0_wo0_dec18_e <= u0_m0_wo0_dec18_c;
                WHEN OTHERS => u0_m0_wo0_dec18_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm18(REG,121)@11 + 1
    u0_m0_wo0_cm18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm18_q <= "01111111111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec18_e = "1") THEN
                u0_m0_wo0_cm18_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec17(LOOKUP,117)@10 + 1
    u0_m0_wo0_dec17_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec17_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec17_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010001" => u0_m0_wo0_dec17_e <= u0_m0_wo0_dec17_c;
                WHEN OTHERS => u0_m0_wo0_dec17_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm17(REG,118)@11 + 1
    u0_m0_wo0_cm17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm17_q <= "01110011001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec17_e = "1") THEN
                u0_m0_wo0_cm17_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec16(LOOKUP,114)@10 + 1
    u0_m0_wo0_dec16_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec16_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec16_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "010000" => u0_m0_wo0_dec16_e <= u0_m0_wo0_dec16_c;
                WHEN OTHERS => u0_m0_wo0_dec16_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm16(REG,115)@11 + 1
    u0_m0_wo0_cm16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm16_q <= "01010001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec16_e = "1") THEN
                u0_m0_wo0_cm16_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec15(LOOKUP,111)@10 + 1
    u0_m0_wo0_dec15_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec15_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec15_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001111" => u0_m0_wo0_dec15_e <= u0_m0_wo0_dec15_c;
                WHEN OTHERS => u0_m0_wo0_dec15_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm15(REG,112)@11 + 1
    u0_m0_wo0_cm15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm15_q <= "00100110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec15_e = "1") THEN
                u0_m0_wo0_cm15_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec14(LOOKUP,108)@10 + 1
    u0_m0_wo0_dec14_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec14_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec14_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001110" => u0_m0_wo0_dec14_e <= u0_m0_wo0_dec14_c;
                WHEN OTHERS => u0_m0_wo0_dec14_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm14(REG,109)@11 + 1
    u0_m0_wo0_cm14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm14_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec14_e = "1") THEN
                u0_m0_wo0_cm14_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec13(LOOKUP,105)@10 + 1
    u0_m0_wo0_dec13_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec13_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec13_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001101" => u0_m0_wo0_dec13_e <= u0_m0_wo0_dec13_c;
                WHEN OTHERS => u0_m0_wo0_dec13_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm13(REG,106)@11 + 1
    u0_m0_wo0_cm13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm13_q <= "11101001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec13_e = "1") THEN
                u0_m0_wo0_cm13_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec12(LOOKUP,102)@10 + 1
    u0_m0_wo0_dec12_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec12_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec12_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001100" => u0_m0_wo0_dec12_e <= u0_m0_wo0_dec12_c;
                WHEN OTHERS => u0_m0_wo0_dec12_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm12(REG,103)@11 + 1
    u0_m0_wo0_cm12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm12_q <= "11100100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec12_e = "1") THEN
                u0_m0_wo0_cm12_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec11(LOOKUP,99)@10 + 1
    u0_m0_wo0_dec11_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec11_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec11_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001011" => u0_m0_wo0_dec11_e <= u0_m0_wo0_dec11_c;
                WHEN OTHERS => u0_m0_wo0_dec11_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm11(REG,100)@11 + 1
    u0_m0_wo0_cm11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm11_q <= "11101111101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec11_e = "1") THEN
                u0_m0_wo0_cm11_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec10(LOOKUP,96)@10 + 1
    u0_m0_wo0_dec10_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec10_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec10_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001010" => u0_m0_wo0_dec10_e <= u0_m0_wo0_dec10_c;
                WHEN OTHERS => u0_m0_wo0_dec10_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm10(REG,97)@11 + 1
    u0_m0_wo0_cm10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec10_e = "1") THEN
                u0_m0_wo0_cm10_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec9(LOOKUP,93)@10 + 1
    u0_m0_wo0_dec9_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec9_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec9_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001001" => u0_m0_wo0_dec9_e <= u0_m0_wo0_dec9_c;
                WHEN OTHERS => u0_m0_wo0_dec9_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm9(REG,94)@11 + 1
    u0_m0_wo0_cm9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "00001100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec9_e = "1") THEN
                u0_m0_wo0_cm9_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec8(LOOKUP,90)@10 + 1
    u0_m0_wo0_dec8_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec8_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec8_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "001000" => u0_m0_wo0_dec8_e <= u0_m0_wo0_dec8_c;
                WHEN OTHERS => u0_m0_wo0_dec8_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm8(REG,91)@11 + 1
    u0_m0_wo0_cm8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "00010000010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec8_e = "1") THEN
                u0_m0_wo0_cm8_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec7(LOOKUP,87)@10 + 1
    u0_m0_wo0_dec7_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec7_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec7_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000111" => u0_m0_wo0_dec7_e <= u0_m0_wo0_dec7_c;
                WHEN OTHERS => u0_m0_wo0_dec7_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm7(REG,88)@11 + 1
    u0_m0_wo0_cm7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "00001010011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec7_e = "1") THEN
                u0_m0_wo0_cm7_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec6(LOOKUP,84)@10 + 1
    u0_m0_wo0_dec6_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec6_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec6_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000110" => u0_m0_wo0_dec6_e <= u0_m0_wo0_dec6_c;
                WHEN OTHERS => u0_m0_wo0_dec6_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm6(REG,85)@11 + 1
    u0_m0_wo0_cm6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec6_e = "1") THEN
                u0_m0_wo0_cm6_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec5(LOOKUP,81)@10 + 1
    u0_m0_wo0_dec5_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec5_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec5_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000101" => u0_m0_wo0_dec5_e <= u0_m0_wo0_dec5_c;
                WHEN OTHERS => u0_m0_wo0_dec5_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm5(REG,82)@11 + 1
    u0_m0_wo0_cm5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "11110111010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec5_e = "1") THEN
                u0_m0_wo0_cm5_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec4(LOOKUP,78)@10 + 1
    u0_m0_wo0_dec4_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec4_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec4_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000100" => u0_m0_wo0_dec4_e <= u0_m0_wo0_dec4_c;
                WHEN OTHERS => u0_m0_wo0_dec4_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm4(REG,79)@11 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "11110100011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec4_e = "1") THEN
                u0_m0_wo0_cm4_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec3(LOOKUP,75)@10 + 1
    u0_m0_wo0_dec3_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec3_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec3_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000011" => u0_m0_wo0_dec3_e <= u0_m0_wo0_dec3_c;
                WHEN OTHERS => u0_m0_wo0_dec3_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm3(REG,76)@11 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "11111000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec3_e = "1") THEN
                u0_m0_wo0_cm3_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec2(LOOKUP,72)@10 + 1
    u0_m0_wo0_dec2_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec2_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec2_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000010" => u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                WHEN OTHERS => u0_m0_wo0_dec2_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm2(REG,73)@11 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "00000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec2_e = "1") THEN
                u0_m0_wo0_cm2_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec1(LOOKUP,69)@10 + 1
    u0_m0_wo0_dec1_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec1_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec1_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000001" => u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                WHEN OTHERS => u0_m0_wo0_dec1_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm1(REG,70)@11 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "00000110110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec1_e = "1") THEN
                u0_m0_wo0_cm1_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec0(LOOKUP,66)@10 + 1
    u0_m0_wo0_dec0_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec0_clkproc: PROCESS (bus_clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_address) IS
                WHEN "000000" => u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                WHEN OTHERS => u0_m0_wo0_dec0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm0(REG,67)@11 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "00001001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec0_e = "1") THEN
                u0_m0_wo0_cm0_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(10 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cma0(CHAINMULTADD,177)@10 + 2
    u0_m0_wo0_cma0_reset <= areset;
    u0_m0_wo0_cma0_ena0 <= xIn_v(0);
    u0_m0_wo0_cma0_ena1 <= d_u0_m0_wo0_compute_q_11_q(0);
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_a0(0) * u0_m0_wo0_cma0_c0(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_a0(1) * u0_m0_wo0_cma0_c0(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_a0(2) * u0_m0_wo0_cma0_c0(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_a0(3) * u0_m0_wo0_cma0_c0(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_a0(4) * u0_m0_wo0_cma0_c0(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_a0(5) * u0_m0_wo0_cma0_c0(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_a0(6) * u0_m0_wo0_cma0_c0(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_a0(7) * u0_m0_wo0_cma0_c0(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_a0(8) * u0_m0_wo0_cma0_c0(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_a0(9) * u0_m0_wo0_cma0_c0(9);
    u0_m0_wo0_cma0_p(10) <= u0_m0_wo0_cma0_a0(10) * u0_m0_wo0_cma0_c0(10);
    u0_m0_wo0_cma0_p(11) <= u0_m0_wo0_cma0_a0(11) * u0_m0_wo0_cma0_c0(11);
    u0_m0_wo0_cma0_p(12) <= u0_m0_wo0_cma0_a0(12) * u0_m0_wo0_cma0_c0(12);
    u0_m0_wo0_cma0_p(13) <= u0_m0_wo0_cma0_a0(13) * u0_m0_wo0_cma0_c0(13);
    u0_m0_wo0_cma0_p(14) <= u0_m0_wo0_cma0_a0(14) * u0_m0_wo0_cma0_c0(14);
    u0_m0_wo0_cma0_p(15) <= u0_m0_wo0_cma0_a0(15) * u0_m0_wo0_cma0_c0(15);
    u0_m0_wo0_cma0_p(16) <= u0_m0_wo0_cma0_a0(16) * u0_m0_wo0_cma0_c0(16);
    u0_m0_wo0_cma0_p(17) <= u0_m0_wo0_cma0_a0(17) * u0_m0_wo0_cma0_c0(17);
    u0_m0_wo0_cma0_p(18) <= u0_m0_wo0_cma0_a0(18) * u0_m0_wo0_cma0_c0(18);
    u0_m0_wo0_cma0_p(19) <= u0_m0_wo0_cma0_a0(19) * u0_m0_wo0_cma0_c0(19);
    u0_m0_wo0_cma0_p(20) <= u0_m0_wo0_cma0_a0(20) * u0_m0_wo0_cma0_c0(20);
    u0_m0_wo0_cma0_p(21) <= u0_m0_wo0_cma0_a0(21) * u0_m0_wo0_cma0_c0(21);
    u0_m0_wo0_cma0_p(22) <= u0_m0_wo0_cma0_a0(22) * u0_m0_wo0_cma0_c0(22);
    u0_m0_wo0_cma0_p(23) <= u0_m0_wo0_cma0_a0(23) * u0_m0_wo0_cma0_c0(23);
    u0_m0_wo0_cma0_p(24) <= u0_m0_wo0_cma0_a0(24) * u0_m0_wo0_cma0_c0(24);
    u0_m0_wo0_cma0_p(25) <= u0_m0_wo0_cma0_a0(25) * u0_m0_wo0_cma0_c0(25);
    u0_m0_wo0_cma0_p(26) <= u0_m0_wo0_cma0_a0(26) * u0_m0_wo0_cma0_c0(26);
    u0_m0_wo0_cma0_p(27) <= u0_m0_wo0_cma0_a0(27) * u0_m0_wo0_cma0_c0(27);
    u0_m0_wo0_cma0_p(28) <= u0_m0_wo0_cma0_a0(28) * u0_m0_wo0_cma0_c0(28);
    u0_m0_wo0_cma0_p(29) <= u0_m0_wo0_cma0_a0(29) * u0_m0_wo0_cma0_c0(29);
    u0_m0_wo0_cma0_p(30) <= u0_m0_wo0_cma0_a0(30) * u0_m0_wo0_cma0_c0(30);
    u0_m0_wo0_cma0_p(31) <= u0_m0_wo0_cma0_a0(31) * u0_m0_wo0_cma0_c0(31);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),31);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),31);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),31);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),31);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),31);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),31);
    u0_m0_wo0_cma0_u(6) <= RESIZE(u0_m0_wo0_cma0_p(6),31);
    u0_m0_wo0_cma0_u(7) <= RESIZE(u0_m0_wo0_cma0_p(7),31);
    u0_m0_wo0_cma0_u(8) <= RESIZE(u0_m0_wo0_cma0_p(8),31);
    u0_m0_wo0_cma0_u(9) <= RESIZE(u0_m0_wo0_cma0_p(9),31);
    u0_m0_wo0_cma0_u(10) <= RESIZE(u0_m0_wo0_cma0_p(10),31);
    u0_m0_wo0_cma0_u(11) <= RESIZE(u0_m0_wo0_cma0_p(11),31);
    u0_m0_wo0_cma0_u(12) <= RESIZE(u0_m0_wo0_cma0_p(12),31);
    u0_m0_wo0_cma0_u(13) <= RESIZE(u0_m0_wo0_cma0_p(13),31);
    u0_m0_wo0_cma0_u(14) <= RESIZE(u0_m0_wo0_cma0_p(14),31);
    u0_m0_wo0_cma0_u(15) <= RESIZE(u0_m0_wo0_cma0_p(15),31);
    u0_m0_wo0_cma0_u(16) <= RESIZE(u0_m0_wo0_cma0_p(16),31);
    u0_m0_wo0_cma0_u(17) <= RESIZE(u0_m0_wo0_cma0_p(17),31);
    u0_m0_wo0_cma0_u(18) <= RESIZE(u0_m0_wo0_cma0_p(18),31);
    u0_m0_wo0_cma0_u(19) <= RESIZE(u0_m0_wo0_cma0_p(19),31);
    u0_m0_wo0_cma0_u(20) <= RESIZE(u0_m0_wo0_cma0_p(20),31);
    u0_m0_wo0_cma0_u(21) <= RESIZE(u0_m0_wo0_cma0_p(21),31);
    u0_m0_wo0_cma0_u(22) <= RESIZE(u0_m0_wo0_cma0_p(22),31);
    u0_m0_wo0_cma0_u(23) <= RESIZE(u0_m0_wo0_cma0_p(23),31);
    u0_m0_wo0_cma0_u(24) <= RESIZE(u0_m0_wo0_cma0_p(24),31);
    u0_m0_wo0_cma0_u(25) <= RESIZE(u0_m0_wo0_cma0_p(25),31);
    u0_m0_wo0_cma0_u(26) <= RESIZE(u0_m0_wo0_cma0_p(26),31);
    u0_m0_wo0_cma0_u(27) <= RESIZE(u0_m0_wo0_cma0_p(27),31);
    u0_m0_wo0_cma0_u(28) <= RESIZE(u0_m0_wo0_cma0_p(28),31);
    u0_m0_wo0_cma0_u(29) <= RESIZE(u0_m0_wo0_cma0_p(29),31);
    u0_m0_wo0_cma0_u(30) <= RESIZE(u0_m0_wo0_cma0_p(30),31);
    u0_m0_wo0_cma0_u(31) <= RESIZE(u0_m0_wo0_cma0_p(31),31);
    u0_m0_wo0_cma0_w(0) <= u0_m0_wo0_cma0_u(0);
    u0_m0_wo0_cma0_w(1) <= u0_m0_wo0_cma0_u(1);
    u0_m0_wo0_cma0_w(2) <= u0_m0_wo0_cma0_u(2);
    u0_m0_wo0_cma0_w(3) <= u0_m0_wo0_cma0_u(3);
    u0_m0_wo0_cma0_w(4) <= u0_m0_wo0_cma0_u(4);
    u0_m0_wo0_cma0_w(5) <= u0_m0_wo0_cma0_u(5);
    u0_m0_wo0_cma0_w(6) <= u0_m0_wo0_cma0_u(6);
    u0_m0_wo0_cma0_w(7) <= u0_m0_wo0_cma0_u(7);
    u0_m0_wo0_cma0_w(8) <= u0_m0_wo0_cma0_u(8);
    u0_m0_wo0_cma0_w(9) <= u0_m0_wo0_cma0_u(9);
    u0_m0_wo0_cma0_w(10) <= u0_m0_wo0_cma0_u(10);
    u0_m0_wo0_cma0_w(11) <= u0_m0_wo0_cma0_u(11);
    u0_m0_wo0_cma0_w(12) <= u0_m0_wo0_cma0_u(12);
    u0_m0_wo0_cma0_w(13) <= u0_m0_wo0_cma0_u(13);
    u0_m0_wo0_cma0_w(14) <= u0_m0_wo0_cma0_u(14);
    u0_m0_wo0_cma0_w(15) <= u0_m0_wo0_cma0_u(15);
    u0_m0_wo0_cma0_w(16) <= u0_m0_wo0_cma0_u(16);
    u0_m0_wo0_cma0_w(17) <= u0_m0_wo0_cma0_u(17);
    u0_m0_wo0_cma0_w(18) <= u0_m0_wo0_cma0_u(18);
    u0_m0_wo0_cma0_w(19) <= u0_m0_wo0_cma0_u(19);
    u0_m0_wo0_cma0_w(20) <= u0_m0_wo0_cma0_u(20);
    u0_m0_wo0_cma0_w(21) <= u0_m0_wo0_cma0_u(21);
    u0_m0_wo0_cma0_w(22) <= u0_m0_wo0_cma0_u(22);
    u0_m0_wo0_cma0_w(23) <= u0_m0_wo0_cma0_u(23);
    u0_m0_wo0_cma0_w(24) <= u0_m0_wo0_cma0_u(24);
    u0_m0_wo0_cma0_w(25) <= u0_m0_wo0_cma0_u(25);
    u0_m0_wo0_cma0_w(26) <= u0_m0_wo0_cma0_u(26);
    u0_m0_wo0_cma0_w(27) <= u0_m0_wo0_cma0_u(27);
    u0_m0_wo0_cma0_w(28) <= u0_m0_wo0_cma0_u(28);
    u0_m0_wo0_cma0_w(29) <= u0_m0_wo0_cma0_u(29);
    u0_m0_wo0_cma0_w(30) <= u0_m0_wo0_cma0_u(30);
    u0_m0_wo0_cma0_w(31) <= u0_m0_wo0_cma0_u(31);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_x(4) <= u0_m0_wo0_cma0_w(4);
    u0_m0_wo0_cma0_x(5) <= u0_m0_wo0_cma0_w(5);
    u0_m0_wo0_cma0_x(6) <= u0_m0_wo0_cma0_w(6);
    u0_m0_wo0_cma0_x(7) <= u0_m0_wo0_cma0_w(7);
    u0_m0_wo0_cma0_x(8) <= u0_m0_wo0_cma0_w(8);
    u0_m0_wo0_cma0_x(9) <= u0_m0_wo0_cma0_w(9);
    u0_m0_wo0_cma0_x(10) <= u0_m0_wo0_cma0_w(10);
    u0_m0_wo0_cma0_x(11) <= u0_m0_wo0_cma0_w(11);
    u0_m0_wo0_cma0_x(12) <= u0_m0_wo0_cma0_w(12);
    u0_m0_wo0_cma0_x(13) <= u0_m0_wo0_cma0_w(13);
    u0_m0_wo0_cma0_x(14) <= u0_m0_wo0_cma0_w(14);
    u0_m0_wo0_cma0_x(15) <= u0_m0_wo0_cma0_w(15);
    u0_m0_wo0_cma0_x(16) <= u0_m0_wo0_cma0_w(16);
    u0_m0_wo0_cma0_x(17) <= u0_m0_wo0_cma0_w(17);
    u0_m0_wo0_cma0_x(18) <= u0_m0_wo0_cma0_w(18);
    u0_m0_wo0_cma0_x(19) <= u0_m0_wo0_cma0_w(19);
    u0_m0_wo0_cma0_x(20) <= u0_m0_wo0_cma0_w(20);
    u0_m0_wo0_cma0_x(21) <= u0_m0_wo0_cma0_w(21);
    u0_m0_wo0_cma0_x(22) <= u0_m0_wo0_cma0_w(22);
    u0_m0_wo0_cma0_x(23) <= u0_m0_wo0_cma0_w(23);
    u0_m0_wo0_cma0_x(24) <= u0_m0_wo0_cma0_w(24);
    u0_m0_wo0_cma0_x(25) <= u0_m0_wo0_cma0_w(25);
    u0_m0_wo0_cma0_x(26) <= u0_m0_wo0_cma0_w(26);
    u0_m0_wo0_cma0_x(27) <= u0_m0_wo0_cma0_w(27);
    u0_m0_wo0_cma0_x(28) <= u0_m0_wo0_cma0_w(28);
    u0_m0_wo0_cma0_x(29) <= u0_m0_wo0_cma0_w(29);
    u0_m0_wo0_cma0_x(30) <= u0_m0_wo0_cma0_w(30);
    u0_m0_wo0_cma0_x(31) <= u0_m0_wo0_cma0_w(31);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_s(4) + u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_y(4) <= u0_m0_wo0_cma0_s(5) + u0_m0_wo0_cma0_x(4);
    u0_m0_wo0_cma0_y(5) <= u0_m0_wo0_cma0_s(6) + u0_m0_wo0_cma0_x(5);
    u0_m0_wo0_cma0_y(6) <= u0_m0_wo0_cma0_s(7) + u0_m0_wo0_cma0_x(6);
    u0_m0_wo0_cma0_y(7) <= u0_m0_wo0_cma0_s(8) + u0_m0_wo0_cma0_x(7);
    u0_m0_wo0_cma0_y(8) <= u0_m0_wo0_cma0_s(9) + u0_m0_wo0_cma0_x(8);
    u0_m0_wo0_cma0_y(9) <= u0_m0_wo0_cma0_s(10) + u0_m0_wo0_cma0_x(9);
    u0_m0_wo0_cma0_y(10) <= u0_m0_wo0_cma0_s(11) + u0_m0_wo0_cma0_x(10);
    u0_m0_wo0_cma0_y(11) <= u0_m0_wo0_cma0_s(12) + u0_m0_wo0_cma0_x(11);
    u0_m0_wo0_cma0_y(12) <= u0_m0_wo0_cma0_s(13) + u0_m0_wo0_cma0_x(12);
    u0_m0_wo0_cma0_y(13) <= u0_m0_wo0_cma0_s(14) + u0_m0_wo0_cma0_x(13);
    u0_m0_wo0_cma0_y(14) <= u0_m0_wo0_cma0_s(15) + u0_m0_wo0_cma0_x(14);
    u0_m0_wo0_cma0_y(15) <= u0_m0_wo0_cma0_s(16) + u0_m0_wo0_cma0_x(15);
    u0_m0_wo0_cma0_y(16) <= u0_m0_wo0_cma0_s(17) + u0_m0_wo0_cma0_x(16);
    u0_m0_wo0_cma0_y(17) <= u0_m0_wo0_cma0_s(18) + u0_m0_wo0_cma0_x(17);
    u0_m0_wo0_cma0_y(18) <= u0_m0_wo0_cma0_s(19) + u0_m0_wo0_cma0_x(18);
    u0_m0_wo0_cma0_y(19) <= u0_m0_wo0_cma0_s(20) + u0_m0_wo0_cma0_x(19);
    u0_m0_wo0_cma0_y(20) <= u0_m0_wo0_cma0_s(21) + u0_m0_wo0_cma0_x(20);
    u0_m0_wo0_cma0_y(21) <= u0_m0_wo0_cma0_s(22) + u0_m0_wo0_cma0_x(21);
    u0_m0_wo0_cma0_y(22) <= u0_m0_wo0_cma0_s(23) + u0_m0_wo0_cma0_x(22);
    u0_m0_wo0_cma0_y(23) <= u0_m0_wo0_cma0_s(24) + u0_m0_wo0_cma0_x(23);
    u0_m0_wo0_cma0_y(24) <= u0_m0_wo0_cma0_s(25) + u0_m0_wo0_cma0_x(24);
    u0_m0_wo0_cma0_y(25) <= u0_m0_wo0_cma0_s(26) + u0_m0_wo0_cma0_x(25);
    u0_m0_wo0_cma0_y(26) <= u0_m0_wo0_cma0_s(27) + u0_m0_wo0_cma0_x(26);
    u0_m0_wo0_cma0_y(27) <= u0_m0_wo0_cma0_s(28) + u0_m0_wo0_cma0_x(27);
    u0_m0_wo0_cma0_y(28) <= u0_m0_wo0_cma0_s(29) + u0_m0_wo0_cma0_x(28);
    u0_m0_wo0_cma0_y(29) <= u0_m0_wo0_cma0_s(30) + u0_m0_wo0_cma0_x(29);
    u0_m0_wo0_cma0_y(30) <= u0_m0_wo0_cma0_s(31) + u0_m0_wo0_cma0_x(30);
    u0_m0_wo0_cma0_y(31) <= u0_m0_wo0_cma0_x(31);
    u0_m0_wo0_cma0_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena0 = '1') THEN
                u0_m0_wo0_cma0_a0(0) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(1) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(2) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(3) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(4) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(5) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(6) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(7) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(8) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(9) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(10) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(11) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(12) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(13) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(14) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(15) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(16) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(17) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(18) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(19) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(20) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(21) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(22) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(23) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(24) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(25) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(26) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(27) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(28) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(29) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(30) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_a0(31) <= RESIZE(SIGNED(xIn_0),15);
                u0_m0_wo0_cma0_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm0_q),11);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm1_q),11);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm2_q),11);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm3_q),11);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(SIGNED(u0_m0_wo0_cm4_q),11);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(SIGNED(u0_m0_wo0_cm5_q),11);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(SIGNED(u0_m0_wo0_cm6_q),11);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(SIGNED(u0_m0_wo0_cm7_q),11);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(SIGNED(u0_m0_wo0_cm8_q),11);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(SIGNED(u0_m0_wo0_cm9_q),11);
                u0_m0_wo0_cma0_c0(10) <= RESIZE(SIGNED(u0_m0_wo0_cm10_q),11);
                u0_m0_wo0_cma0_c0(11) <= RESIZE(SIGNED(u0_m0_wo0_cm11_q),11);
                u0_m0_wo0_cma0_c0(12) <= RESIZE(SIGNED(u0_m0_wo0_cm12_q),11);
                u0_m0_wo0_cma0_c0(13) <= RESIZE(SIGNED(u0_m0_wo0_cm13_q),11);
                u0_m0_wo0_cma0_c0(14) <= RESIZE(SIGNED(u0_m0_wo0_cm14_q),11);
                u0_m0_wo0_cma0_c0(15) <= RESIZE(SIGNED(u0_m0_wo0_cm15_q),11);
                u0_m0_wo0_cma0_c0(16) <= RESIZE(SIGNED(u0_m0_wo0_cm16_q),11);
                u0_m0_wo0_cma0_c0(17) <= RESIZE(SIGNED(u0_m0_wo0_cm17_q),11);
                u0_m0_wo0_cma0_c0(18) <= RESIZE(SIGNED(u0_m0_wo0_cm18_q),11);
                u0_m0_wo0_cma0_c0(19) <= RESIZE(SIGNED(u0_m0_wo0_cm19_q),11);
                u0_m0_wo0_cma0_c0(20) <= RESIZE(SIGNED(u0_m0_wo0_cm20_q),11);
                u0_m0_wo0_cma0_c0(21) <= RESIZE(SIGNED(u0_m0_wo0_cm21_q),11);
                u0_m0_wo0_cma0_c0(22) <= RESIZE(SIGNED(u0_m0_wo0_cm22_q),11);
                u0_m0_wo0_cma0_c0(23) <= RESIZE(SIGNED(u0_m0_wo0_cm23_q),11);
                u0_m0_wo0_cma0_c0(24) <= RESIZE(SIGNED(u0_m0_wo0_cm24_q),11);
                u0_m0_wo0_cma0_c0(25) <= RESIZE(SIGNED(u0_m0_wo0_cm25_q),11);
                u0_m0_wo0_cma0_c0(26) <= RESIZE(SIGNED(u0_m0_wo0_cm26_q),11);
                u0_m0_wo0_cma0_c0(27) <= RESIZE(SIGNED(u0_m0_wo0_cm27_q),11);
                u0_m0_wo0_cma0_c0(28) <= RESIZE(SIGNED(u0_m0_wo0_cm28_q),11);
                u0_m0_wo0_cma0_c0(29) <= RESIZE(SIGNED(u0_m0_wo0_cm29_q),11);
                u0_m0_wo0_cma0_c0(30) <= RESIZE(SIGNED(u0_m0_wo0_cm30_q),11);
                u0_m0_wo0_cma0_c0(31) <= RESIZE(SIGNED(u0_m0_wo0_cm31_q),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena1 = '1') THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
                u0_m0_wo0_cma0_s(4) <= u0_m0_wo0_cma0_y(4);
                u0_m0_wo0_cma0_s(5) <= u0_m0_wo0_cma0_y(5);
                u0_m0_wo0_cma0_s(6) <= u0_m0_wo0_cma0_y(6);
                u0_m0_wo0_cma0_s(7) <= u0_m0_wo0_cma0_y(7);
                u0_m0_wo0_cma0_s(8) <= u0_m0_wo0_cma0_y(8);
                u0_m0_wo0_cma0_s(9) <= u0_m0_wo0_cma0_y(9);
                u0_m0_wo0_cma0_s(10) <= u0_m0_wo0_cma0_y(10);
                u0_m0_wo0_cma0_s(11) <= u0_m0_wo0_cma0_y(11);
                u0_m0_wo0_cma0_s(12) <= u0_m0_wo0_cma0_y(12);
                u0_m0_wo0_cma0_s(13) <= u0_m0_wo0_cma0_y(13);
                u0_m0_wo0_cma0_s(14) <= u0_m0_wo0_cma0_y(14);
                u0_m0_wo0_cma0_s(15) <= u0_m0_wo0_cma0_y(15);
                u0_m0_wo0_cma0_s(16) <= u0_m0_wo0_cma0_y(16);
                u0_m0_wo0_cma0_s(17) <= u0_m0_wo0_cma0_y(17);
                u0_m0_wo0_cma0_s(18) <= u0_m0_wo0_cma0_y(18);
                u0_m0_wo0_cma0_s(19) <= u0_m0_wo0_cma0_y(19);
                u0_m0_wo0_cma0_s(20) <= u0_m0_wo0_cma0_y(20);
                u0_m0_wo0_cma0_s(21) <= u0_m0_wo0_cma0_y(21);
                u0_m0_wo0_cma0_s(22) <= u0_m0_wo0_cma0_y(22);
                u0_m0_wo0_cma0_s(23) <= u0_m0_wo0_cma0_y(23);
                u0_m0_wo0_cma0_s(24) <= u0_m0_wo0_cma0_y(24);
                u0_m0_wo0_cma0_s(25) <= u0_m0_wo0_cma0_y(25);
                u0_m0_wo0_cma0_s(26) <= u0_m0_wo0_cma0_y(26);
                u0_m0_wo0_cma0_s(27) <= u0_m0_wo0_cma0_y(27);
                u0_m0_wo0_cma0_s(28) <= u0_m0_wo0_cma0_y(28);
                u0_m0_wo0_cma0_s(29) <= u0_m0_wo0_cma0_y(29);
                u0_m0_wo0_cma0_s(30) <= u0_m0_wo0_cma0_y(30);
                u0_m0_wo0_cma0_s(31) <= u0_m0_wo0_cma0_y(31);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 31, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(30 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(30 downto 0));

    -- u0_m0_wo0_mtree_add0_0(ADD,179)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_cma0_q(30)) & u0_m0_wo0_cma0_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo0_cma1_q(28)) & u0_m0_wo0_cma1_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(31 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_12(DELAY,191)@11 + 1
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_11_q, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,180)@12 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_12_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,182)@13
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,184)@13
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,185)@13 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add0_0_q;

END normal;
