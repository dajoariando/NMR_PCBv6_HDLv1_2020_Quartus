
module system (
	clk_clk,
	dac_preamp_MISO,
	dac_preamp_MOSI,
	dac_preamp_SCLK,
	dac_preamp_SS_n,
	delay_nosig_export,
	delay_sig_export,
	delay_t1_export,
	echoes_per_scan_export,
	i2c_ext_sda_in,
	i2c_ext_scl_in,
	i2c_ext_sda_oe,
	i2c_ext_scl_oe,
	i2c_int_sda_in,
	i2c_int_scl_in,
	i2c_int_sda_oe,
	i2c_int_scl_oe,
	init_delay_export,
	led_export,
	nmr_sys_pll_outclk0_clk,
	pulse_180deg_export,
	pulse_90deg_export,
	pulse_t1_export,
	reset_reset_n,
	samples_per_echo_export,
	issp_source);	

	input		clk_clk;
	input		dac_preamp_MISO;
	output		dac_preamp_MOSI;
	output		dac_preamp_SCLK;
	output		dac_preamp_SS_n;
	output	[31:0]	delay_nosig_export;
	output	[31:0]	delay_sig_export;
	output	[31:0]	delay_t1_export;
	output	[31:0]	echoes_per_scan_export;
	input		i2c_ext_sda_in;
	input		i2c_ext_scl_in;
	output		i2c_ext_sda_oe;
	output		i2c_ext_scl_oe;
	input		i2c_int_sda_in;
	input		i2c_int_scl_in;
	output		i2c_int_sda_oe;
	output		i2c_int_scl_oe;
	output	[31:0]	init_delay_export;
	output	[9:0]	led_export;
	output		nmr_sys_pll_outclk0_clk;
	output	[31:0]	pulse_180deg_export;
	output	[31:0]	pulse_90deg_export;
	output	[31:0]	pulse_t1_export;
	input		reset_reset_n;
	output	[31:0]	samples_per_echo_export;
	output	[0:0]	issp_source;
endmodule
