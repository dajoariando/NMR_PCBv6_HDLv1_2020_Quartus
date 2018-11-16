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


vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/dspba_library_package.vhd"                      
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/dspba_library.vhd"                              
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/auk_dspip_math_pkg_hpfir.vhd"                   
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/auk_dspip_lib_pkg_hpfir.vhd"                    
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"      
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"    
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/auk_dspip_roundsat_hpfir.vhd"                   
vlog "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/altera_avalon_sc_fifo.v"                        
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/FIR_rtl_core.vhd"                               
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/FIR_ast.vhd"                                    
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/FIR.vhd"                                        
vcom "D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/FIR_tb.vhd"                                     

vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_PULSE_PROGRAM.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_Controller.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/CDC_Input_Synchronizer.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ADC_LTC1746_DRV.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ADC_ACQ_WINGEN.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ALTERA_IPs {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ALTERA_IPs/altiobuf.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/top.v}

vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_Controller_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  NMR_Controller_tb

do D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_Controller_tb.do
