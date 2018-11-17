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

-- VHDL created from fir_final_rtl_core
-- VHDL created on Tue Nov 13 16:12:15 2018


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

entity fir_final_rtl_core is
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
end fir_final_rtl_core;

architecture normal of fir_final_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (4 downto 0);
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
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_ca4_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_ca4_i : UNSIGNED (2 downto 0);
    attribute preserve of u0_m0_wo0_ca4_i : signal is true;
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(7 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 5);
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 5);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    type u0_m0_wo0_cma0_rtype is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_rtype(0 to 5);
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 5);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(43 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 5);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 5);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 5);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 5);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-11,11),
        1 => TO_SIGNED(-9,11),
        2 => TO_SIGNED(-6,11),
        3 => TO_SIGNED(-5,11),
        4 => TO_SIGNED(-8,11),
        5 => TO_SIGNED(-12,11),
        6 => TO_SIGNED(-14,11),
        7 => TO_SIGNED(-13,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(22,11),
        1 => TO_SIGNED(9,11),
        2 => TO_SIGNED(-1,11),
        3 => TO_SIGNED(105,11),
        4 => TO_SIGNED(90,11),
        5 => TO_SIGNED(73,11),
        6 => TO_SIGNED(55,11),
        7 => TO_SIGNED(38,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(124,11),
        1 => TO_SIGNED(116,11),
        2 => TO_SIGNED(73,11),
        3 => TO_SIGNED(90,11),
        4 => TO_SIGNED(105,11),
        5 => TO_SIGNED(116,11),
        6 => TO_SIGNED(124,11),
        7 => TO_SIGNED(127,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(55,11),
        1 => TO_SIGNED(-14,11),
        2 => TO_SIGNED(-12,11),
        3 => TO_SIGNED(-8,11),
        4 => TO_SIGNED(-1,11),
        5 => TO_SIGNED(9,11),
        6 => TO_SIGNED(22,11),
        7 => TO_SIGNED(38,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k4 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(0,11),
        2 => TO_SIGNED(0,11),
        3 => TO_SIGNED(-5,11),
        4 => TO_SIGNED(-6,11),
        5 => TO_SIGNED(-9,11),
        6 => TO_SIGNED(-11,11),
        7 => TO_SIGNED(-13,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k5 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        others => (others => '0'));
    signal u0_m0_wo0_cma0_z : u0_m0_wo0_cma0_utype(0 to 0);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 5);
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
    signal u0_m0_wo0_wi0_r0_delayr1_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr1_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr1_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr1_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q : signal is true;
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_c : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_d : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_e : STD_LOGIC_VECTOR (7 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_join1_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- u0_m0_wo0_wi0_r0_delayr1_notEnable(LOGICAL,57)@13
    u0_m0_wo0_wi0_r0_delayr1_notEnable_q <= STD_LOGIC_VECTOR(not (d_u0_m0_wo0_compute_q_13_q));

    -- u0_m0_wo0_wi0_r0_delayr1_nor(LOGICAL,58)@13
    u0_m0_wo0_wi0_r0_delayr1_nor_q <= not (u0_m0_wo0_wi0_r0_delayr1_notEnable_q or u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr1_mem_last(CONSTANT,54)
    u0_m0_wo0_wi0_r0_delayr1_mem_last_q <= "0100";

    -- u0_m0_wo0_wi0_r0_delayr1_cmp(LOGICAL,55)@13
    u0_m0_wo0_wi0_r0_delayr1_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_delayr1_rdmux_q);
    u0_m0_wo0_wi0_r0_delayr1_cmp_q <= "1" WHEN u0_m0_wo0_wi0_r0_delayr1_mem_last_q = u0_m0_wo0_wi0_r0_delayr1_cmp_b ELSE "0";

    -- u0_m0_wo0_wi0_r0_delayr1_cmpReg(REG,56)@13 + 1
    u0_m0_wo0_wi0_r0_delayr1_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1_sticky_ena(REG,59)@13 + 1
    u0_m0_wo0_wi0_r0_delayr1_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr1_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1_enaAnd(LOGICAL,60)@13
    u0_m0_wo0_wi0_r0_delayr1_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_delayr1_rdcnt(COUNTER,51)@13 + 1
    -- low=0, high=5, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr1_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= TO_UNSIGNED(0, 3);
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_delayr1_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                    u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_delayr1_rdcnt_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr1_rdcnt_i + 3;
                ELSE
                    u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr1_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr1_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr1_rdcnt_i, 3)));

    -- u0_m0_wo0_wi0_r0_delayr1_rdmux(MUX,52)@13
    u0_m0_wo0_wi0_r0_delayr1_rdmux_s <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_r0_delayr1_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr1_rdmux_s, u0_m0_wo0_wi0_r0_delayr1_wraddr_q, u0_m0_wo0_wi0_r0_delayr1_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr1_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr1_rdmux_q <= u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr1_rdmux_q <= u0_m0_wo0_wi0_r0_delayr1_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr1_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_wi0_r0_join1(BITJOIN,22)@13
    u0_m0_wo0_wi0_r0_join1_q <= u0_m0_wo0_wi0_r0_split1_d & u0_m0_wo0_wi0_r0_split1_c & u0_m0_wo0_wi0_r0_split1_b & u0_m0_wo0_wi0_r0_memr0_q;

    -- u0_m0_wo0_wi0_r0_delayr1_wraddr(REG,53)@13 + 1
    u0_m0_wo0_wi0_r0_delayr1_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= "101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1_mem(DUALMEM,50)@13 + 2
    u0_m0_wo0_wi0_r0_delayr1_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join1_q);
    u0_m0_wo0_wi0_r0_delayr1_mem_aa <= u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr1_mem_ab <= u0_m0_wo0_wi0_r0_delayr1_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr1_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr1_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => u0_m0_wo0_wi0_r0_delayr1_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr1_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr1_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr1_mem_ia,
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_delayr1_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr1_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr1_mem_q <= u0_m0_wo0_wi0_r0_delayr1_mem_iq(31 downto 0);

    -- u0_m0_wo0_wi0_r0_split1(BITSELECT,23)@13
    u0_m0_wo0_wi0_r0_split1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(7 downto 0));
    u0_m0_wo0_wi0_r0_split1_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(15 downto 8));
    u0_m0_wo0_wi0_r0_split1_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(23 downto 16));
    u0_m0_wo0_wi0_r0_split1_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(31 downto 24));

    -- u0_m0_wo0_ca4(COUNTER,25)@13
    -- low=0, high=7, step=1, init=4
    u0_m0_wo0_ca4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca4_i <= TO_UNSIGNED(4, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_ca4_i <= u0_m0_wo0_ca4_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca4_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca4_i, 3)));

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(3 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(6, 4);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "00000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(3) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-7);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(3 downto 3));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11111";
                WHEN "100" => u0_m0_wo0_run_inc := "00000";
                WHEN "101" => u0_m0_wo0_run_inc := "01000";
                WHEN "110" => u0_m0_wo0_run_inc := "11111";
                WHEN "111" => u0_m0_wo0_run_inc := "00111";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(4 downto 4);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,47)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,19)@13
    -- low=0, high=15, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 4)));

    -- d_xIn_0_13(DELAY,45)@10 + 3
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,46)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,20)@13
    -- low=0, high=15, step=1, init=8
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(8, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 4)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,21)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 16,
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

    -- u0_m0_wo0_aseq(SEQUENCE,35)@12 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 7;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(5 downto 5));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_14(DELAY,49)@13 + 1
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,48)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma0(CHAINMULTADD,34)@13 + 2
    u0_m0_wo0_cma0_reset <= areset;
    u0_m0_wo0_cma0_ena0 <= d_u0_m0_wo0_compute_q_13_q(0);
    u0_m0_wo0_cma0_ena1 <= d_u0_m0_wo0_compute_q_14_q(0);
    -- altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(-11,11),
        1 => TO_SIGNED(-9,11),
        2 => TO_SIGNED(-6,11),
        3 => TO_SIGNED(-5,11),
        4 => TO_SIGNED(-8,11),
        5 => TO_SIGNED(-12,11),
        6 => TO_SIGNED(-14,11),
        7 => TO_SIGNED(-13,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(22,11),
        1 => TO_SIGNED(9,11),
        2 => TO_SIGNED(-1,11),
        3 => TO_SIGNED(105,11),
        4 => TO_SIGNED(90,11),
        5 => TO_SIGNED(73,11),
        6 => TO_SIGNED(55,11),
        7 => TO_SIGNED(38,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(124,11),
        1 => TO_SIGNED(116,11),
        2 => TO_SIGNED(73,11),
        3 => TO_SIGNED(90,11),
        4 => TO_SIGNED(105,11),
        5 => TO_SIGNED(116,11),
        6 => TO_SIGNED(124,11),
        7 => TO_SIGNED(127,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        0 => TO_SIGNED(55,11),
        1 => TO_SIGNED(-14,11),
        2 => TO_SIGNED(-12,11),
        3 => TO_SIGNED(-8,11),
        4 => TO_SIGNED(-1,11),
        5 => TO_SIGNED(9,11),
        6 => TO_SIGNED(22,11),
        7 => TO_SIGNED(38,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k4 <= (
        0 => TO_SIGNED(0,11),
        1 => TO_SIGNED(0,11),
        2 => TO_SIGNED(0,11),
        3 => TO_SIGNED(-5,11),
        4 => TO_SIGNED(-6,11),
        5 => TO_SIGNED(-9,11),
        6 => TO_SIGNED(-11,11),
        7 => TO_SIGNED(-13,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k5 <= (
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma0_r(0) <= u0_m0_wo0_cma0_k0(TO_INTEGER(u0_m0_wo0_cma0_c0(0)));
    u0_m0_wo0_cma0_r(1) <= u0_m0_wo0_cma0_k1(TO_INTEGER(u0_m0_wo0_cma0_c0(1)));
    u0_m0_wo0_cma0_r(2) <= u0_m0_wo0_cma0_k2(TO_INTEGER(u0_m0_wo0_cma0_c0(2)));
    u0_m0_wo0_cma0_r(3) <= u0_m0_wo0_cma0_k3(TO_INTEGER(u0_m0_wo0_cma0_c0(3)));
    u0_m0_wo0_cma0_r(4) <= u0_m0_wo0_cma0_k4(TO_INTEGER(u0_m0_wo0_cma0_c0(4)));
    u0_m0_wo0_cma0_r(5) <= u0_m0_wo0_cma0_k5(TO_INTEGER(u0_m0_wo0_cma0_c0(5)));
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_a0(0) * u0_m0_wo0_cma0_r(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_a0(1) * u0_m0_wo0_cma0_r(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_a0(2) * u0_m0_wo0_cma0_r(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_a0(3) * u0_m0_wo0_cma0_r(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_a0(4) * u0_m0_wo0_cma0_r(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_a0(5) * u0_m0_wo0_cma0_r(5);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),44);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),44);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),44);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),44);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),44);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),44);
    u0_m0_wo0_cma0_w(0) <= u0_m0_wo0_cma0_u(0);
    u0_m0_wo0_cma0_w(1) <= u0_m0_wo0_cma0_u(1);
    u0_m0_wo0_cma0_w(2) <= u0_m0_wo0_cma0_u(2);
    u0_m0_wo0_cma0_w(3) <= u0_m0_wo0_cma0_u(3);
    u0_m0_wo0_cma0_w(4) <= u0_m0_wo0_cma0_u(4);
    u0_m0_wo0_cma0_w(5) <= u0_m0_wo0_cma0_u(5);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_x(4) <= u0_m0_wo0_cma0_w(4);
    u0_m0_wo0_cma0_x(5) <= u0_m0_wo0_cma0_w(5);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_s(4) + u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_y(4) <= u0_m0_wo0_cma0_s(5) + u0_m0_wo0_cma0_x(4);
    u0_m0_wo0_cma0_y(5) <= u0_m0_wo0_cma0_x(5);
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
                u0_m0_wo0_cma0_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_b),8);
                u0_m0_wo0_cma0_a0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_c),8);
                u0_m0_wo0_cma0_a0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_d),8);
                u0_m0_wo0_cma0_a0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_e),8);
                u0_m0_wo0_cma0_a0(5) <= (others => '0');
                u0_m0_wo0_cma0_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_ca4_q),3);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_ca4_q),3);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(UNSIGNED(u0_m0_wo0_ca4_q),3);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(UNSIGNED(u0_m0_wo0_ca4_q),3);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(UNSIGNED(u0_m0_wo0_ca4_q),3);
                u0_m0_wo0_cma0_c0(5) <= (others => '0');
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
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 22, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(21 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(21 downto 0));

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,37)@13 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "000111";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 7;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(5 downto 5));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,38)@14
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_14_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,39)@14 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,41)@15
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,43)@15
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,44)@15 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_cma0_q;

END normal;
