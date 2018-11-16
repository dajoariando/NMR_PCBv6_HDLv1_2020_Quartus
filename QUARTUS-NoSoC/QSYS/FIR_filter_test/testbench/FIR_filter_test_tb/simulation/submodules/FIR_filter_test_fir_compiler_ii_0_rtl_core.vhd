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

-- VHDL created from FIR_filter_test_fir_compiler_ii_0_rtl_core
-- VHDL created on Tue Nov 13 14:10:21 2018


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

entity FIR_filter_test_fir_compiler_ii_0_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(7 downto 0);  -- sfix8
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(21 downto 0);  -- sfix22
        clk : in std_logic;
        areset : in std_logic
    );
end FIR_filter_test_fir_compiler_ii_0_rtl_core;

architecture normal of FIR_filter_test_fir_compiler_ii_0_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_ca18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca18_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_ca18_i : signal is true;
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(7 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 19);
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 19);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    type u0_m0_wo0_cma0_rtype is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_rtype(0 to 19);
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 19);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(43 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 19);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 19);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 19);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 19);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(6,11),
        1 => TO_SIGNED(8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-7,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-8,11),
        1 => TO_SIGNED(-11,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(10,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k4 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(12,11),
        1 => TO_SIGNED(16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k5 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k6 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-22,11),
        1 => TO_SIGNED(-26,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k7 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(38,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k8 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(114,11),
        1 => TO_SIGNED(80,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k9 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(127,11),
        1 => TO_SIGNED(114,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k10 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(38,11),
        1 => TO_SIGNED(80,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k11 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-22,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k12 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-16,11),
        1 => TO_SIGNED(-26,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k13 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(12,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k14 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(10,11),
        1 => TO_SIGNED(16,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k15 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k16 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-7,11),
        1 => TO_SIGNED(-11,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k17 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(6,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k18 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k19 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        others => (others => '0'));
    signal u0_m0_wo0_cma0_z : u0_m0_wo0_cma0_utype(0 to 0);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 19);
    signal u0_m0_wo0_cma0_anl : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cma0_ena0 : std_logic;
    signal u0_m0_wo0_cma0_ena1 : std_logic;
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(0 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(0, 1);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(0) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-1);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(0 downto 0));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "111";
                WHEN "100" => u0_m0_wo0_run_inc := "000";
                WHEN "101" => u0_m0_wo0_run_inc := "010";
                WHEN "110" => u0_m0_wo0_run_inc := "111";
                WHEN "111" => u0_m0_wo0_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(2 downto 2);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,76)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,39)@13
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,38)@13
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,37)@13
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,36)@13
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,35)@13
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,34)@13
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,33)@13
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,32)@13
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,31)@13
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,30)@13
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,29)@13
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,28)@13
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,27)@13
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,26)@13
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,25)@13
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,24)@13
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,23)@13
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,22)@13
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_ca18(COUNTER,40)@13
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_ca18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca18_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_ca18_i <= u0_m0_wo0_ca18_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca18_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca18_i, 1)));

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,19)@13
    -- low=0, high=3, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 2)));

    -- d_xIn_0_13(DELAY,74)@10 + 3
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,75)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,20)@13
    -- low=0, high=3, step=1, init=2
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(2, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 2)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,21)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 8,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(7 downto 0);

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,64)@12 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "0000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "0000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 1;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_14(DELAY,78)@13 + 1
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,77)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma0(CHAINMULTADD,63)@13 + 2
    u0_m0_wo0_cma0_reset <= areset;
    u0_m0_wo0_cma0_ena0 <= d_u0_m0_wo0_compute_q_13_q(0);
    u0_m0_wo0_cma0_ena1 <= d_u0_m0_wo0_compute_q_14_q(0);
    -- altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(6,11),
        1 => TO_SIGNED(8,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-7,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(-8,11),
        1 => TO_SIGNED(-11,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(10,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k4 <= (
        0 => TO_SIGNED(12,11),
        1 => TO_SIGNED(16,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k5 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-16,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k6 <= (
        0 => TO_SIGNED(-22,11),
        1 => TO_SIGNED(-26,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k7 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(38,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k8 <= (
        0 => TO_SIGNED(114,11),
        1 => TO_SIGNED(80,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k9 <= (
        0 => TO_SIGNED(127,11),
        1 => TO_SIGNED(114,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k10 <= (
        0 => TO_SIGNED(38,11),
        1 => TO_SIGNED(80,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k11 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-22,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k12 <= (
        0 => TO_SIGNED(-16,11),
        1 => TO_SIGNED(-26,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k13 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(12,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k14 <= (
        0 => TO_SIGNED(10,11),
        1 => TO_SIGNED(16,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k15 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(-8,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k16 <= (
        0 => TO_SIGNED(-7,11),
        1 => TO_SIGNED(-11,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k17 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(6,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k18 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(8,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k19 <= (
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma0_r(0) <= u0_m0_wo0_cma0_k0(TO_INTEGER(u0_m0_wo0_cma0_c0(0)));
    u0_m0_wo0_cma0_r(1) <= u0_m0_wo0_cma0_k1(TO_INTEGER(u0_m0_wo0_cma0_c0(1)));
    u0_m0_wo0_cma0_r(2) <= u0_m0_wo0_cma0_k2(TO_INTEGER(u0_m0_wo0_cma0_c0(2)));
    u0_m0_wo0_cma0_r(3) <= u0_m0_wo0_cma0_k3(TO_INTEGER(u0_m0_wo0_cma0_c0(3)));
    u0_m0_wo0_cma0_r(4) <= u0_m0_wo0_cma0_k4(TO_INTEGER(u0_m0_wo0_cma0_c0(4)));
    u0_m0_wo0_cma0_r(5) <= u0_m0_wo0_cma0_k5(TO_INTEGER(u0_m0_wo0_cma0_c0(5)));
    u0_m0_wo0_cma0_r(6) <= u0_m0_wo0_cma0_k6(TO_INTEGER(u0_m0_wo0_cma0_c0(6)));
    u0_m0_wo0_cma0_r(7) <= u0_m0_wo0_cma0_k7(TO_INTEGER(u0_m0_wo0_cma0_c0(7)));
    u0_m0_wo0_cma0_r(8) <= u0_m0_wo0_cma0_k8(TO_INTEGER(u0_m0_wo0_cma0_c0(8)));
    u0_m0_wo0_cma0_r(9) <= u0_m0_wo0_cma0_k9(TO_INTEGER(u0_m0_wo0_cma0_c0(9)));
    u0_m0_wo0_cma0_r(10) <= u0_m0_wo0_cma0_k10(TO_INTEGER(u0_m0_wo0_cma0_c0(10)));
    u0_m0_wo0_cma0_r(11) <= u0_m0_wo0_cma0_k11(TO_INTEGER(u0_m0_wo0_cma0_c0(11)));
    u0_m0_wo0_cma0_r(12) <= u0_m0_wo0_cma0_k12(TO_INTEGER(u0_m0_wo0_cma0_c0(12)));
    u0_m0_wo0_cma0_r(13) <= u0_m0_wo0_cma0_k13(TO_INTEGER(u0_m0_wo0_cma0_c0(13)));
    u0_m0_wo0_cma0_r(14) <= u0_m0_wo0_cma0_k14(TO_INTEGER(u0_m0_wo0_cma0_c0(14)));
    u0_m0_wo0_cma0_r(15) <= u0_m0_wo0_cma0_k15(TO_INTEGER(u0_m0_wo0_cma0_c0(15)));
    u0_m0_wo0_cma0_r(16) <= u0_m0_wo0_cma0_k16(TO_INTEGER(u0_m0_wo0_cma0_c0(16)));
    u0_m0_wo0_cma0_r(17) <= u0_m0_wo0_cma0_k17(TO_INTEGER(u0_m0_wo0_cma0_c0(17)));
    u0_m0_wo0_cma0_r(18) <= u0_m0_wo0_cma0_k18(TO_INTEGER(u0_m0_wo0_cma0_c0(18)));
    u0_m0_wo0_cma0_r(19) <= u0_m0_wo0_cma0_k19(TO_INTEGER(u0_m0_wo0_cma0_c0(19)));
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_a0(0) * u0_m0_wo0_cma0_r(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_a0(1) * u0_m0_wo0_cma0_r(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_a0(2) * u0_m0_wo0_cma0_r(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_a0(3) * u0_m0_wo0_cma0_r(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_a0(4) * u0_m0_wo0_cma0_r(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_a0(5) * u0_m0_wo0_cma0_r(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_a0(6) * u0_m0_wo0_cma0_r(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_a0(7) * u0_m0_wo0_cma0_r(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_a0(8) * u0_m0_wo0_cma0_r(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_a0(9) * u0_m0_wo0_cma0_r(9);
    u0_m0_wo0_cma0_p(10) <= u0_m0_wo0_cma0_a0(10) * u0_m0_wo0_cma0_r(10);
    u0_m0_wo0_cma0_p(11) <= u0_m0_wo0_cma0_a0(11) * u0_m0_wo0_cma0_r(11);
    u0_m0_wo0_cma0_p(12) <= u0_m0_wo0_cma0_a0(12) * u0_m0_wo0_cma0_r(12);
    u0_m0_wo0_cma0_p(13) <= u0_m0_wo0_cma0_a0(13) * u0_m0_wo0_cma0_r(13);
    u0_m0_wo0_cma0_p(14) <= u0_m0_wo0_cma0_a0(14) * u0_m0_wo0_cma0_r(14);
    u0_m0_wo0_cma0_p(15) <= u0_m0_wo0_cma0_a0(15) * u0_m0_wo0_cma0_r(15);
    u0_m0_wo0_cma0_p(16) <= u0_m0_wo0_cma0_a0(16) * u0_m0_wo0_cma0_r(16);
    u0_m0_wo0_cma0_p(17) <= u0_m0_wo0_cma0_a0(17) * u0_m0_wo0_cma0_r(17);
    u0_m0_wo0_cma0_p(18) <= u0_m0_wo0_cma0_a0(18) * u0_m0_wo0_cma0_r(18);
    u0_m0_wo0_cma0_p(19) <= u0_m0_wo0_cma0_a0(19) * u0_m0_wo0_cma0_r(19);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),44);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),44);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),44);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),44);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),44);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),44);
    u0_m0_wo0_cma0_u(6) <= RESIZE(u0_m0_wo0_cma0_p(6),44);
    u0_m0_wo0_cma0_u(7) <= RESIZE(u0_m0_wo0_cma0_p(7),44);
    u0_m0_wo0_cma0_u(8) <= RESIZE(u0_m0_wo0_cma0_p(8),44);
    u0_m0_wo0_cma0_u(9) <= RESIZE(u0_m0_wo0_cma0_p(9),44);
    u0_m0_wo0_cma0_u(10) <= RESIZE(u0_m0_wo0_cma0_p(10),44);
    u0_m0_wo0_cma0_u(11) <= RESIZE(u0_m0_wo0_cma0_p(11),44);
    u0_m0_wo0_cma0_u(12) <= RESIZE(u0_m0_wo0_cma0_p(12),44);
    u0_m0_wo0_cma0_u(13) <= RESIZE(u0_m0_wo0_cma0_p(13),44);
    u0_m0_wo0_cma0_u(14) <= RESIZE(u0_m0_wo0_cma0_p(14),44);
    u0_m0_wo0_cma0_u(15) <= RESIZE(u0_m0_wo0_cma0_p(15),44);
    u0_m0_wo0_cma0_u(16) <= RESIZE(u0_m0_wo0_cma0_p(16),44);
    u0_m0_wo0_cma0_u(17) <= RESIZE(u0_m0_wo0_cma0_p(17),44);
    u0_m0_wo0_cma0_u(18) <= RESIZE(u0_m0_wo0_cma0_p(18),44);
    u0_m0_wo0_cma0_u(19) <= RESIZE(u0_m0_wo0_cma0_p(19),44);
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
    u0_m0_wo0_cma0_y(19) <= u0_m0_wo0_cma0_x(19);
    u0_m0_wo0_cma0_z(0) <= u0_m0_wo0_cma0_s(0) WHEN u0_m0_wo0_cma0_anl(0) = '1' ELSE "00000000000000000000000000000000000000000000";
    u0_m0_wo0_cma0_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_anl(0) <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena0 = '1') THEN
                u0_m0_wo0_cma0_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_memr0_q),8);
                u0_m0_wo0_cma0_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr1_q),8);
                u0_m0_wo0_cma0_a0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr2_q),8);
                u0_m0_wo0_cma0_a0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr3_q),8);
                u0_m0_wo0_cma0_a0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr4_q),8);
                u0_m0_wo0_cma0_a0(5) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr5_q),8);
                u0_m0_wo0_cma0_a0(6) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr6_q),8);
                u0_m0_wo0_cma0_a0(7) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr7_q),8);
                u0_m0_wo0_cma0_a0(8) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr8_q),8);
                u0_m0_wo0_cma0_a0(9) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr9_q),8);
                u0_m0_wo0_cma0_a0(10) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr10_q),8);
                u0_m0_wo0_cma0_a0(11) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr11_q),8);
                u0_m0_wo0_cma0_a0(12) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr12_q),8);
                u0_m0_wo0_cma0_a0(13) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr13_q),8);
                u0_m0_wo0_cma0_a0(14) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr14_q),8);
                u0_m0_wo0_cma0_a0(15) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr15_q),8);
                u0_m0_wo0_cma0_a0(16) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr16_q),8);
                u0_m0_wo0_cma0_a0(17) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr17_q),8);
                u0_m0_wo0_cma0_a0(18) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr18_q),8);
                u0_m0_wo0_cma0_a0(19) <= (others => '0');
                u0_m0_wo0_cma0_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(10) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(11) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(12) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(13) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(14) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(15) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(16) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(17) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(18) <= RESIZE(UNSIGNED(u0_m0_wo0_ca18_q),3);
                u0_m0_wo0_cma0_c0(19) <= (others => '0');
                u0_m0_wo0_cma0_anl(0) <= not(u0_m0_wo0_aseq_q(0));
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena1 = '1') THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_z(0) + u0_m0_wo0_cma0_y(0);
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
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 22, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(21 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(21 downto 0));

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,66)@13 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "0001";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "0000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 1;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,67)@14
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_14_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,68)@14 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,70)@15
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,72)@15
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,73)@15 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_cma0_q;

END normal;
