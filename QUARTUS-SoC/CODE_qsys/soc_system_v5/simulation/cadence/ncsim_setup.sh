
# (C) 2001-2019 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 17.1 590 win32 2019.08.30.09:41:08

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     soc_system_v5
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "ncsim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# ncvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If soc_system_v5 is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 17.1 590 win32 2019.08.30.09:41:08
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="soc_system_v5"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/intelfpga/17.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/altera_common_sv_packages/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/border/
mkdir -p ./libraries/timing_adapter_0/
mkdir -p ./libraries/data_format_adapter_0/
mkdir -p ./libraries/avalon_st_adapter_008/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/rsp_mux_009/
mkdir -p ./libraries/rsp_mux_007/
mkdir -p ./libraries/rsp_mux_006/
mkdir -p ./libraries/rsp_mux_002/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux_014/
mkdir -p ./libraries/rsp_demux_012/
mkdir -p ./libraries/rsp_demux_009/
mkdir -p ./libraries/rsp_demux_008/
mkdir -p ./libraries/rsp_demux_005/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux_012/
mkdir -p ./libraries/cmd_mux_009/
mkdir -p ./libraries/cmd_mux_008/
mkdir -p ./libraries/cmd_mux_005/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_009/
mkdir -p ./libraries/cmd_demux_007/
mkdir -p ./libraries/cmd_demux_006/
mkdir -p ./libraries/cmd_demux_002/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_054/
mkdir -p ./libraries/router_042/
mkdir -p ./libraries/router_041/
mkdir -p ./libraries/router_025/
mkdir -p ./libraries/router_023/
mkdir -p ./libraries/router_022/
mkdir -p ./libraries/router_021/
mkdir -p ./libraries/router_020/
mkdir -p ./libraries/router_018/
mkdir -p ./libraries/router_013/
mkdir -p ./libraries/router_012/
mkdir -p ./libraries/router_011/
mkdir -p ./libraries/router_010/
mkdir -p ./libraries/router_009/
mkdir -p ./libraries/router_007/
mkdir -p ./libraries/router_006/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router/
mkdir -p ./libraries/fifo_dummy64_in_in_agent/
mkdir -p ./libraries/hps_0_h2f_axi_master_agent/
mkdir -p ./libraries/fifo_dummy64_in_in_translator/
mkdir -p ./libraries/master_secure_master_cmd_width_adapter/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/hps_0_f2h_axi_slave_wr_burst_adapter/
mkdir -p ./libraries/alt_vip_vfr_vga_avalon_master_limiter/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/hps_0_f2h_axi_slave_agent/
mkdir -p ./libraries/alt_vip_vfr_vga_avalon_master_agent/
mkdir -p ./libraries/alt_vip_vfr_vga_avalon_master_translator/
mkdir -p ./libraries/samples_per_echo/
mkdir -p ./libraries/delay_t1/
mkdir -p ./libraries/delay_nosig/
mkdir -p ./libraries/adc_val_sub/
mkdir -p ./libraries/p2b_adapter/
mkdir -p ./libraries/b2p_adapter/
mkdir -p ./libraries/transacto/
mkdir -p ./libraries/p2b/
mkdir -p ./libraries/b2p/
mkdir -p ./libraries/fifo/
mkdir -p ./libraries/timing_adt/
mkdir -p ./libraries/jtag_phy_embedded_in_jtag_master/
mkdir -p ./libraries/hps_io/
mkdir -p ./libraries/fpga_interfaces/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/avalon_st_adapter_001/
mkdir -p ./libraries/irq_mapper_001/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/sysid_qsys/
mkdir -p ./libraries/switches/
mkdir -p ./libraries/spi_afe_relays/
mkdir -p ./libraries/sdram/
mkdir -p ./libraries/nmr_sys_pll/
mkdir -p ./libraries/nmr_parameters/
mkdir -p ./libraries/master_non_sec/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/i2c_ext/
mkdir -p ./libraries/hps_0/
mkdir -p ./libraries/gp_pll/
mkdir -p ./libraries/fifo_dummy64_out/
mkdir -p ./libraries/fifo_dummy64_in/
mkdir -p ./libraries/fifo_dummy/
mkdir -p ./libraries/dma_fifo/
mkdir -p ./libraries/dma_dummy/
mkdir -p ./libraries/dma_dconvq/
mkdir -p ./libraries/dma_dconvi/
mkdir -p ./libraries/dconv_fir/
mkdir -p ./libraries/dconv_fifo_mem/
mkdir -p ./libraries/dac_grad/
mkdir -p ./libraries/ctrl_in/
mkdir -p ./libraries/aux_cnt_out/
mkdir -p ./libraries/analyzer_pll_reconfig/
mkdir -p ./libraries/analyzer_pll/
mkdir -p ./libraries/alt_vip_vfr_vga/
mkdir -p ./libraries/alt_vip_itc_0/
mkdir -p ./libraries/adc_fifo_mem/
mkdir -p ./libraries/adc_fifo_dc/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/cyclonev_ver/
mkdir -p ./libraries/cyclonev_hssi_ver/
mkdir -p ./libraries/cyclonev_pcie_hip_ver/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/cyclonev/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/soc_system_v5_dconv_fir_rtl_core_rm.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                      -work altera_ver           
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                               -work lpm_ver              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                  -work sgate_ver            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                              -work altera_mf_ver        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                         -work cyclonev_ver         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                    -work cyclonev_hssi_ver    
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"                -work cyclonev_pcie_hip_ver
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"                -work altera               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"            -work altera               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"               -work altera               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"            -work altera               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"         -work altera               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"                    -work altera               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                              -work lpm                  
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                             -work lpm                  
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                           -work sgate                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                                -work sgate                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"                 -work altera_mf            
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                            -work altera_mf            
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                          -work altera_lnsim         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"              -work altera_lnsim         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/cyclonev_atoms_ncrypt.v"          -work cyclonev             
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.vhd"                       -work cyclonev             
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_components.vhd"                  -work cyclonev             
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/verbosity_pkg.sv"                                                         -work altera_common_sv_packages                -cdslib ./cds_libs/altera_common_sv_packages.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_utilities_pkg.sv"                                                  -work altera_common_sv_packages                -cdslib ./cds_libs/altera_common_sv_packages.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_pkg.sv"                                                         -work altera_common_sv_packages                -cdslib ./cds_libs/altera_common_sv_packages.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_avalon_st_adapter_008_error_adapter_0.sv" -work error_adapter_0                          -cdslib ./cds_libs/error_adapter_0.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                          -cdslib ./cds_libs/error_adapter_0.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_mm_slave_bfm.sv"                                            -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_interrupt_sink.sv"                                          -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_clock_source.sv"                                            -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_reset_source.sv"                                            -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_hps_0_hps_io_border_memory.sv"                              -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_hps_0_hps_io_border_hps_io.sv"                              -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_hps_0_hps_io_border.sv"                                     -work border                                   -cdslib ./cds_libs/border.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter_001_timing_adapter_0.sv"                  -work timing_adapter_0                         -cdslib ./cds_libs/timing_adapter_0.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter_timing_adapter_0.sv"                      -work timing_adapter_0                         -cdslib ./cds_libs/timing_adapter_0.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter_data_format_adapter_0.sv"                 -work data_format_adapter_0                    -cdslib ./cds_libs/data_format_adapter_0.cds.lib                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter_data_format_adapter_0_state_ram.sv"       -work data_format_adapter_0                    -cdslib ./cds_libs/data_format_adapter_0.cds.lib                   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter_data_format_adapter_0_data_ram.sv"        -work data_format_adapter_0                    -cdslib ./cds_libs/data_format_adapter_0.cds.lib                   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_avalon_st_adapter_008.vhd"                -work avalon_st_adapter_008                    -cdslib ./cds_libs/avalon_st_adapter_008.cds.lib                   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_avalon_st_adapter.vhd"                    -work avalon_st_adapter                        -cdslib ./cds_libs/avalon_st_adapter.cds.lib                       
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                               -work crosser                                  -cdslib ./cds_libs/crosser.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                         -work crosser                                  -cdslib ./cds_libs/crosser.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                         -work crosser                                  -cdslib ./cds_libs/crosser.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                          -work crosser                                  -cdslib ./cds_libs/crosser.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_mux_009.sv"                           -work rsp_mux_009                              -cdslib ./cds_libs/rsp_mux_009.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux_009                              -cdslib ./cds_libs/rsp_mux_009.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_mux_007.sv"                           -work rsp_mux_007                              -cdslib ./cds_libs/rsp_mux_007.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux_007                              -cdslib ./cds_libs/rsp_mux_007.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_mux_006.sv"                           -work rsp_mux_006                              -cdslib ./cds_libs/rsp_mux_006.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux_006                              -cdslib ./cds_libs/rsp_mux_006.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_mux_002.sv"                           -work rsp_mux_002                              -cdslib ./cds_libs/rsp_mux_002.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux_002                              -cdslib ./cds_libs/rsp_mux_002.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_mux.sv"                               -work rsp_mux                                  -cdslib ./cds_libs/rsp_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux                                  -cdslib ./cds_libs/rsp_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_demux_014.sv"                         -work rsp_demux_014                            -cdslib ./cds_libs/rsp_demux_014.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_demux_012.sv"                         -work rsp_demux_012                            -cdslib ./cds_libs/rsp_demux_012.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_demux_009.sv"                         -work rsp_demux_009                            -cdslib ./cds_libs/rsp_demux_009.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_demux_008.sv"                         -work rsp_demux_008                            -cdslib ./cds_libs/rsp_demux_008.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_demux_005.sv"                         -work rsp_demux_005                            -cdslib ./cds_libs/rsp_demux_005.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_rsp_demux.sv"                             -work rsp_demux                                -cdslib ./cds_libs/rsp_demux.cds.lib                               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_mux_012.sv"                           -work cmd_mux_012                              -cdslib ./cds_libs/cmd_mux_012.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_012                              -cdslib ./cds_libs/cmd_mux_012.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_mux_009.sv"                           -work cmd_mux_009                              -cdslib ./cds_libs/cmd_mux_009.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_009                              -cdslib ./cds_libs/cmd_mux_009.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_mux_008.sv"                           -work cmd_mux_008                              -cdslib ./cds_libs/cmd_mux_008.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_008                              -cdslib ./cds_libs/cmd_mux_008.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_mux_005.sv"                           -work cmd_mux_005                              -cdslib ./cds_libs/cmd_mux_005.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux_005                              -cdslib ./cds_libs/cmd_mux_005.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_mux.sv"                               -work cmd_mux                                  -cdslib ./cds_libs/cmd_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux                                  -cdslib ./cds_libs/cmd_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_demux_009.sv"                         -work cmd_demux_009                            -cdslib ./cds_libs/cmd_demux_009.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_demux_007.sv"                         -work cmd_demux_007                            -cdslib ./cds_libs/cmd_demux_007.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_demux_006.sv"                         -work cmd_demux_006                            -cdslib ./cds_libs/cmd_demux_006.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_demux_002.sv"                         -work cmd_demux_002                            -cdslib ./cds_libs/cmd_demux_002.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_cmd_demux.sv"                             -work cmd_demux                                -cdslib ./cds_libs/cmd_demux.cds.lib                               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_054.sv"                            -work router_054                               -cdslib ./cds_libs/router_054.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_042.sv"                            -work router_042                               -cdslib ./cds_libs/router_042.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_041.sv"                            -work router_041                               -cdslib ./cds_libs/router_041.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_025.sv"                            -work router_025                               -cdslib ./cds_libs/router_025.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_023.sv"                            -work router_023                               -cdslib ./cds_libs/router_023.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_022.sv"                            -work router_022                               -cdslib ./cds_libs/router_022.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_021.sv"                            -work router_021                               -cdslib ./cds_libs/router_021.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_020.sv"                            -work router_020                               -cdslib ./cds_libs/router_020.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_018.sv"                            -work router_018                               -cdslib ./cds_libs/router_018.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_013.sv"                            -work router_013                               -cdslib ./cds_libs/router_013.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_012.sv"                            -work router_012                               -cdslib ./cds_libs/router_012.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_011.sv"                            -work router_011                               -cdslib ./cds_libs/router_011.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_010.sv"                            -work router_010                               -cdslib ./cds_libs/router_010.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_009.sv"                            -work router_009                               -cdslib ./cds_libs/router_009.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_007.sv"                            -work router_007                               -cdslib ./cds_libs/router_007.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_006.sv"                            -work router_006                               -cdslib ./cds_libs/router_006.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router_002.sv"                            -work router_002                               -cdslib ./cds_libs/router_002.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1_router.sv"                                -work router                                   -cdslib ./cds_libs/router.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                             -work fifo_dummy64_in_in_agent                 -cdslib ./cds_libs/fifo_dummy64_in_in_agent.cds.lib                
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                      -work fifo_dummy64_in_in_agent                 -cdslib ./cds_libs/fifo_dummy64_in_in_agent.cds.lib                
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_axi_master_ni.sv"                                           -work hps_0_h2f_axi_master_agent               -cdslib ./cds_libs/hps_0_h2f_axi_master_agent.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                       -work hps_0_h2f_axi_master_agent               -cdslib ./cds_libs/hps_0_h2f_axi_master_agent.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                        -work fifo_dummy64_in_in_translator            -cdslib ./cds_libs/fifo_dummy64_in_in_translator.cds.lib           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                           -work master_secure_master_cmd_width_adapter   -cdslib ./cds_libs/master_secure_master_cmd_width_adapter.cds.lib  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                       -work master_secure_master_cmd_width_adapter   -cdslib ./cds_libs/master_secure_master_cmd_width_adapter.cds.lib  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                      -work master_secure_master_cmd_width_adapter   -cdslib ./cds_libs/master_secure_master_cmd_width_adapter.cds.lib  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                  -cdslib ./cds_libs/rsp_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work rsp_mux                                  -cdslib ./cds_libs/rsp_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                  -cdslib ./cds_libs/cmd_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                              -work cmd_mux                                  -cdslib ./cds_libs/cmd_mux.cds.lib                                 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                            -cdslib ./cds_libs/cmd_demux_001.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                -cdslib ./cds_libs/cmd_demux.cds.lib                               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                           -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                    -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                      -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                       -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                           -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                           -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                        -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                       -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                       -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                         -work hps_0_f2h_axi_slave_wr_burst_adapter     -cdslib ./cds_libs/hps_0_f2h_axi_slave_wr_burst_adapter.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                         -work alt_vip_vfr_vga_avalon_master_limiter    -cdslib ./cds_libs/alt_vip_vfr_vga_avalon_master_limiter.cds.lib   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                          -work alt_vip_vfr_vga_avalon_master_limiter    -cdslib ./cds_libs/alt_vip_vfr_vga_avalon_master_limiter.cds.lib   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                  -work alt_vip_vfr_vga_avalon_master_limiter    -cdslib ./cds_libs/alt_vip_vfr_vga_avalon_master_limiter.cds.lib   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                         -work alt_vip_vfr_vga_avalon_master_limiter    -cdslib ./cds_libs/alt_vip_vfr_vga_avalon_master_limiter.cds.lib   
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_router_002.sv"                            -work router_002                               -cdslib ./cds_libs/router_002.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_router_001.sv"                            -work router_001                               -cdslib ./cds_libs/router_001.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0_router.sv"                                -work router                                   -cdslib ./cds_libs/router.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_axi_slave_ni.sv"                                            -work hps_0_f2h_axi_slave_agent                -cdslib ./cds_libs/hps_0_f2h_axi_slave_agent.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                      -work hps_0_f2h_axi_slave_agent                -cdslib ./cds_libs/hps_0_f2h_axi_slave_agent.cds.lib               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                  -work hps_0_f2h_axi_slave_agent                -cdslib ./cds_libs/hps_0_f2h_axi_slave_agent.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                       -work hps_0_f2h_axi_slave_agent                -cdslib ./cds_libs/hps_0_f2h_axi_slave_agent.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                            -work alt_vip_vfr_vga_avalon_master_agent      -cdslib ./cds_libs/alt_vip_vfr_vga_avalon_master_agent.cds.lib     
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                       -work alt_vip_vfr_vga_avalon_master_translator -cdslib ./cds_libs/alt_vip_vfr_vga_avalon_master_translator.cds.lib
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_nmr_parameters_samples_per_echo.v"                          -work samples_per_echo                         -cdslib ./cds_libs/samples_per_echo.cds.lib                        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_nmr_parameters_delay_t1.v"                                  -work delay_t1                                 -cdslib ./cds_libs/delay_t1.cds.lib                                
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_nmr_parameters_delay_nosig.v"                               -work delay_nosig                              -cdslib ./cds_libs/delay_nosig.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_nmr_parameters_adc_val_sub.v"                               -work adc_val_sub                              -cdslib ./cds_libs/adc_val_sub.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_master_non_sec_p2b_adapter.sv"                              -work p2b_adapter                              -cdslib ./cds_libs/p2b_adapter.cds.lib                             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_master_non_sec_b2p_adapter.sv"                              -work b2p_adapter                              -cdslib ./cds_libs/b2p_adapter.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master.v"                                        -work transacto                                -cdslib ./cds_libs/transacto.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"                                      -work p2b                                      -cdslib ./cds_libs/p2b.cds.lib                                     
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets.v"                                      -work b2p                                      -cdslib ./cds_libs/b2p.cds.lib                                     
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                  -work fifo                                     -cdslib ./cds_libs/fifo.cds.lib                                    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_master_non_sec_timing_adt.sv"                               -work timing_adt                               -cdslib ./cds_libs/timing_adt.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_jtag_interface.v"                                        -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_jtag_dc_streaming.v"                                               -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_jtag_sld_node.v"                                                   -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_jtag_streaming.v"                                                  -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                         -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                          -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                         -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_remover.v"                                          -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_inserter.v"                                         -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                       -work jtag_phy_embedded_in_jtag_master         -cdslib ./cds_libs/jtag_phy_embedded_in_jtag_master.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_hps_0_hps_io.v"                                             -work hps_io                                   -cdslib ./cds_libs/hps_io.cds.lib                                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_mm_slave_bfm.sv"                                            -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/questa_mvc_svapi.svh"                                                     -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/mgc_common_axi.sv"                                                        -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/mgc_axi_master.sv"                                                        -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/mgc_axi_slave.sv"                                                         -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_interrupt_sink.sv"                                          -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_clock_source.sv"                                            -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_reset_source.sv"                                            -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_hps_0_fpga_interfaces.sv"                                   -work fpga_interfaces                          -cdslib ./cds_libs/fpga_interfaces.cds.lib                         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                -work rst_controller                           -cdslib ./cds_libs/rst_controller.cds.lib                          
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                              -work rst_controller                           -cdslib ./cds_libs/rst_controller.cds.lib                          
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter_001.vhd"                                  -work avalon_st_adapter_001                    -cdslib ./cds_libs/avalon_st_adapter_001.cds.lib                   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_avalon_st_adapter.vhd"                                      -work avalon_st_adapter                        -cdslib ./cds_libs/avalon_st_adapter.cds.lib                       
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_irq_mapper_001.sv"                                          -work irq_mapper_001                           -cdslib ./cds_libs/irq_mapper_001.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/soc_system_v5_irq_mapper.sv"                                              -work irq_mapper                               -cdslib ./cds_libs/irq_mapper.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_1.v"                                        -work mm_interconnect_1                        -cdslib ./cds_libs/mm_interconnect_1.cds.lib                       
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_mm_interconnect_0.v"                                        -work mm_interconnect_0                        -cdslib ./cds_libs/mm_interconnect_0.cds.lib                       
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_sysid_qsys.v"                                               -work sysid_qsys                               -cdslib ./cds_libs/sysid_qsys.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_switches.v"                                                 -work switches                                 -cdslib ./cds_libs/switches.cds.lib                                
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_spi_afe_relays.v"                                           -work spi_afe_relays                           -cdslib ./cds_libs/spi_afe_relays.cds.lib                          
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_sdram.v"                                                    -work sdram                                    -cdslib ./cds_libs/sdram.cds.lib                                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_sdram_test_component.v"                                     -work sdram                                    -cdslib ./cds_libs/sdram.cds.lib                                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_nmr_sys_pll.vo"                                             -work nmr_sys_pll                              -cdslib ./cds_libs/nmr_sys_pll.cds.lib                             
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_nmr_parameters.vhd"                                         -work nmr_parameters                           -cdslib ./cds_libs/nmr_parameters.cds.lib                          
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_master_non_sec.vhd"                                         -work master_non_sec                           -cdslib ./cds_libs/master_non_sec.cds.lib                          
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_jtag_uart.v"                                                -work jtag_uart                                -cdslib ./cds_libs/jtag_uart.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c.v"                                                      -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_csr.v"                                                  -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_clk_cnt.v"                                              -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_condt_det.v"                                            -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_condt_gen.v"                                            -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_fifo.v"                                                 -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_mstfsm.v"                                               -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_rxshifter.v"                                            -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_txshifter.v"                                            -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_spksupp.v"                                              -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_i2c_txout.v"                                                -work i2c_ext                                  -cdslib ./cds_libs/i2c_ext.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_hps_0.v"                                                    -work hps_0                                    -cdslib ./cds_libs/hps_0.cds.lib                                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_gp_pll.vo"                                                  -work gp_pll                                   -cdslib ./cds_libs/gp_pll.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_fifo_dummy64_out.v"                                         -work fifo_dummy64_out                         -cdslib ./cds_libs/fifo_dummy64_out.cds.lib                        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_fifo_dummy64_in.v"                                          -work fifo_dummy64_in                          -cdslib ./cds_libs/fifo_dummy64_in.cds.lib                         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_fifo_dummy.v"                                               -work fifo_dummy                               -cdslib ./cds_libs/fifo_dummy.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_dma_fifo.v"                                                 -work dma_fifo                                 -cdslib ./cds_libs/dma_fifo.cds.lib                                
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_dma_dummy.v"                                                -work dma_dummy                                -cdslib ./cds_libs/dma_dummy.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_dma_dconvq.v"                                               -work dma_dconvq                               -cdslib ./cds_libs/dma_dconvq.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_dma_dconvi.v"                                               -work dma_dconvi                               -cdslib ./cds_libs/dma_dconvi.cds.lib                              
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/dspba_library_package.vhd"                                                -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/dspba_library.vhd"                                                        -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_math_pkg_hpfir.vhd"                                             -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_lib_pkg_hpfir.vhd"                                              -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_avalon_streaming_controller_hpfir.vhd"                          -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_avalon_streaming_sink_hpfir.vhd"                                -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_avalon_streaming_source_hpfir.vhd"                              -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_roundsat_hpfir.vhd"                                             -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                  -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_dconv_fir_rtl_core.vhd"                                     -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_dconv_fir_ast.vhd"                                          -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_dconv_fir.vhd"                                              -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_dconv_fir_tb.vhd"                                           -work dconv_fir                                -cdslib ./cds_libs/dconv_fir.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_dconv_fifo_mem.v"                                           -work dconv_fifo_mem                           -cdslib ./cds_libs/dconv_fifo_mem.cds.lib                          
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_dac_grad.v"                                                 -work dac_grad                                 -cdslib ./cds_libs/dac_grad.cds.lib                                
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_ctrl_in.v"                                                  -work ctrl_in                                  -cdslib ./cds_libs/ctrl_in.cds.lib                                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_aux_cnt_out.v"                                              -work aux_cnt_out                              -cdslib ./cds_libs/aux_cnt_out.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_pll_reconfig_top.v"                                                -work analyzer_pll_reconfig                    -cdslib ./cds_libs/analyzer_pll_reconfig.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_pll_reconfig_core.v"                                               -work analyzer_pll_reconfig                    -cdslib ./cds_libs/analyzer_pll_reconfig.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_std_synchronizer.v"                                                -work analyzer_pll_reconfig                    -cdslib ./cds_libs/analyzer_pll_reconfig.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_analyzer_pll.vo"                                            -work analyzer_pll                             -cdslib ./cds_libs/analyzer_pll.cds.lib                            
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_alt_vip_vfr_vga.vho"                                        -work alt_vip_vfr_vga                          -cdslib ./cds_libs/alt_vip_vfr_vga.cds.lib                         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/soc_system_v5_alt_vip_itc_0.vho"                                          -work alt_vip_itc_0                            -cdslib ./cds_libs/alt_vip_itc_0.cds.lib                           
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/soc_system_v5_adc_fifo_mem.v"                                             -work adc_fifo_mem                             -cdslib ./cds_libs/adc_fifo_mem.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                                                  -work adc_fifo_dc                              -cdslib ./cds_libs/adc_fifo_dc.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"                                      -work adc_fifo_dc                              -cdslib ./cds_libs/adc_fifo_dc.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                          -work adc_fifo_dc                              -cdslib ./cds_libs/adc_fifo_dc.cds.lib                             
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/soc_system_v5.vhd"                                                                                                                                                                                     
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/soc_system_v5_rst_controller.vhd"                                                                                                                                                                      
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/soc_system_v5_rst_controller_002.vhd"                                                                                                                                                                  
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/soc_system_v5_adc_fifo_dc.vhd"                                                                                                                                                                         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/soc_system_v5_dconv_fifo_dc.vhd"                                                                                                                                                                       
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  export GENERIC_PARAM_COMPAT_CHECK=1
  ncelab -access +w+r+c -namemap_mixgen -relax $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
