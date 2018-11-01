	system u0 (
		.clk_clk                 (<connected-to-clk_clk>),                 //                 clk.clk
		.dac_preamp_MISO         (<connected-to-dac_preamp_MISO>),         //          dac_preamp.MISO
		.dac_preamp_MOSI         (<connected-to-dac_preamp_MOSI>),         //                    .MOSI
		.dac_preamp_SCLK         (<connected-to-dac_preamp_SCLK>),         //                    .SCLK
		.dac_preamp_SS_n         (<connected-to-dac_preamp_SS_n>),         //                    .SS_n
		.delay_nosig_export      (<connected-to-delay_nosig_export>),      //         delay_nosig.export
		.delay_sig_export        (<connected-to-delay_sig_export>),        //           delay_sig.export
		.delay_t1_export         (<connected-to-delay_t1_export>),         //            delay_t1.export
		.echoes_per_scan_export  (<connected-to-echoes_per_scan_export>),  //     echoes_per_scan.export
		.i2c_ext_sda_in          (<connected-to-i2c_ext_sda_in>),          //             i2c_ext.sda_in
		.i2c_ext_scl_in          (<connected-to-i2c_ext_scl_in>),          //                    .scl_in
		.i2c_ext_sda_oe          (<connected-to-i2c_ext_sda_oe>),          //                    .sda_oe
		.i2c_ext_scl_oe          (<connected-to-i2c_ext_scl_oe>),          //                    .scl_oe
		.i2c_int_sda_in          (<connected-to-i2c_int_sda_in>),          //             i2c_int.sda_in
		.i2c_int_scl_in          (<connected-to-i2c_int_scl_in>),          //                    .scl_in
		.i2c_int_sda_oe          (<connected-to-i2c_int_sda_oe>),          //                    .sda_oe
		.i2c_int_scl_oe          (<connected-to-i2c_int_scl_oe>),          //                    .scl_oe
		.init_delay_export       (<connected-to-init_delay_export>),       //          init_delay.export
		.led_export              (<connected-to-led_export>),              //                 led.export
		.nmr_sys_pll_outclk0_clk (<connected-to-nmr_sys_pll_outclk0_clk>), // nmr_sys_pll_outclk0.clk
		.pulse_180deg_export     (<connected-to-pulse_180deg_export>),     //        pulse_180deg.export
		.pulse_90deg_export      (<connected-to-pulse_90deg_export>),      //         pulse_90deg.export
		.pulse_t1_export         (<connected-to-pulse_t1_export>),         //            pulse_t1.export
		.reset_reset_n           (<connected-to-reset_reset_n>),           //               reset.reset_n
		.samples_per_echo_export (<connected-to-samples_per_echo_export>), //    samples_per_echo.export
		.issp_source             (<connected-to-issp_source>)              //                issp.source
	);

