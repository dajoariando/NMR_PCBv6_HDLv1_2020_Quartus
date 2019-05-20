transcript on
if ![file isdirectory top_iputf_libs] {
	file mkdir top_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/dspba_library_package.vhd"                      
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/dspba_library.vhd"                              
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/auk_dspip_math_pkg_hpfir.vhd"                   
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/auk_dspip_lib_pkg_hpfir.vhd"                    
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"      
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"    
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/auk_dspip_roundsat_hpfir.vhd"                   
vlog "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/altera_avalon_sc_fifo.v"                        
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/firtestx_rtl_core.vhd"                          
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/firtestx_ast.vhd"                               
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/firtestx.vhd"                                   
vcom "D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/firtestx_tb.vhd"                                

vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/GNRL_delayed_pulser.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/NMR_PULSE_PROGRAM.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/NMR_Controller.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/CDC_Input_Synchronizer.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ADC_LTC1746_DRV.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ADC_ACQ_WINGEN.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/altiobuf.v}
vlog -vlog01compat -work work +incdir+D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/top.v}

vcom -93 -work work {D:/NMR_PCBv2_HDLv1_2018_FPGA/QUARTUS-NoSoC/HDL/ALTERA_IPs/DELETEME/firtestx_sim/firtestx_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  work.firtestx_tb

add wave *
view structure
view signals
run -all
