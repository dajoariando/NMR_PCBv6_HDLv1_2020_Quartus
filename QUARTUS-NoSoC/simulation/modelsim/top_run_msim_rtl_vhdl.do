transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_PULSE_PROGRAM.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_Controller.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/CDC_Input_Synchronizer.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ADC_LTC1746_DRV.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ADC_ACQ_WINGEN.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ALTERA_IPs {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/ALTERA_IPs/altiobuf.v}
vlog -vlog01compat -work work +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/top.v}
vlib system
vmap system system
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/system.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_monitor_system_console_master.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_monitor_system_console_master_mm_interconnect_2.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_monitor_system_console_master_mm_interconnect_1.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_monitor_system_console_master_mm_interconnect_0.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_monitor_system_console_master_pm.v}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_throughput_tap_xlate.sv}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_throughput_monitor.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_pmon_count_csr.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_pmon_counters.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_system_console.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_packets_to_master.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_packets_to_bytes.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_bytes_to_packets.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_jtag_interface.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_jtag_dc_streaming.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_jtag_sld_node.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_jtag_streaming.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_std_synchronizer_nocut.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_idle_remover.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_idle_inserter.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_pll_reconfig_top.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_pll_reconfig_core.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_parameters_0.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_parameters_0_samples_per_echo.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_parameters_0_delay_t1.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_parameters_0_delay_nosig.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_nmr_sys_pll.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_led.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altsource_probe_top.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_dac_preamp.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_csr.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_clk_cnt.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_condt_det.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_condt_gen.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_fifo.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_mstfsm.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_rxshifter.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_txshifter.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_spksupp.v}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_i2c_txout.v}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_trace_monitor_endpoint_wrapper.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_traffic_limiter.sv}
vlog -vlog01compat -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_avalon_st_pipeline_base.v}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_router_001.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_router.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_system_console_p2b_adapter.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_system_console_b2p_adapter.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_system_console_timing_adt.sv}
vlog -sv -work system +incdir+D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/QSYS/system/synthesis/submodules/system_mm_interconnect_0_monitor_system_console_master_gatherer.sv}

vcom -93 -work work {D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/DELETEME/FIR_sim/FIR_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -L system -voptargs="+acc"  work.FIR_tb

do D:/NMR_Thesis_PCBv2_hdl_v1_2018/QUARTUS-NoSoC/HDL/NMR_Controller_tb.do
