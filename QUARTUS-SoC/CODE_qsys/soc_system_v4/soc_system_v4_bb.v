
module soc_system_v4 (
	adc_fifo_in_data,
	adc_fifo_in_valid,
	adc_fifo_in_ready,
	adc_val_sub_export,
	alt_vip_itc_0_clocked_video_vid_clk,
	alt_vip_itc_0_clocked_video_vid_data,
	alt_vip_itc_0_clocked_video_underflow,
	alt_vip_itc_0_clocked_video_vid_datavalid,
	alt_vip_itc_0_clocked_video_vid_v_sync,
	alt_vip_itc_0_clocked_video_vid_h_sync,
	alt_vip_itc_0_clocked_video_vid_f,
	alt_vip_itc_0_clocked_video_vid_h,
	alt_vip_itc_0_clocked_video_vid_v,
	analyzer_pll_locked_export,
	analyzer_pll_outclk0_clk,
	analyzer_pll_outclk1_clk,
	analyzer_pll_outclk2_clk,
	analyzer_pll_outclk3_clk,
	analyzer_pll_reset_reset,
	aux_cnt_out_export,
	clk_clk,
	ctrl_in_export,
	ctrl_out_export,
	dac_preamp_MISO,
	dac_preamp_MOSI,
	dac_preamp_SCLK,
	dac_preamp_SS_n,
	dconv_fifo_in_data,
	dconv_fifo_in_valid,
	dconv_fifo_in_ready,
	dconv_fifo_q_in_data,
	dconv_fifo_q_in_valid,
	dconv_fifo_q_in_ready,
	dconv_fir_in_data,
	dconv_fir_in_valid,
	dconv_fir_in_error,
	dconv_fir_out_data,
	dconv_fir_out_valid,
	dconv_fir_out_error,
	dconv_fir_q_in_data,
	dconv_fir_q_in_valid,
	dconv_fir_q_in_error,
	dconv_fir_q_out_data,
	dconv_fir_q_out_valid,
	dconv_fir_q_out_error,
	delay_nosig_export,
	delay_sig_export,
	delay_t1_export,
	echoes_per_scan_export,
	fifo_clk_bridge_in_clk,
	fifo_rst_reset,
	hps_0_h2f_reset_reset_n,
	hps_0_hps_io_hps_io_emac1_inst_TX_CLK,
	hps_0_hps_io_hps_io_emac1_inst_TXD0,
	hps_0_hps_io_hps_io_emac1_inst_TXD1,
	hps_0_hps_io_hps_io_emac1_inst_TXD2,
	hps_0_hps_io_hps_io_emac1_inst_TXD3,
	hps_0_hps_io_hps_io_emac1_inst_RXD0,
	hps_0_hps_io_hps_io_emac1_inst_MDIO,
	hps_0_hps_io_hps_io_emac1_inst_MDC,
	hps_0_hps_io_hps_io_emac1_inst_RX_CTL,
	hps_0_hps_io_hps_io_emac1_inst_TX_CTL,
	hps_0_hps_io_hps_io_emac1_inst_RX_CLK,
	hps_0_hps_io_hps_io_emac1_inst_RXD1,
	hps_0_hps_io_hps_io_emac1_inst_RXD2,
	hps_0_hps_io_hps_io_emac1_inst_RXD3,
	hps_0_hps_io_hps_io_qspi_inst_IO0,
	hps_0_hps_io_hps_io_qspi_inst_IO1,
	hps_0_hps_io_hps_io_qspi_inst_IO2,
	hps_0_hps_io_hps_io_qspi_inst_IO3,
	hps_0_hps_io_hps_io_qspi_inst_SS0,
	hps_0_hps_io_hps_io_qspi_inst_CLK,
	hps_0_hps_io_hps_io_sdio_inst_CMD,
	hps_0_hps_io_hps_io_sdio_inst_D0,
	hps_0_hps_io_hps_io_sdio_inst_D1,
	hps_0_hps_io_hps_io_sdio_inst_CLK,
	hps_0_hps_io_hps_io_sdio_inst_D2,
	hps_0_hps_io_hps_io_sdio_inst_D3,
	hps_0_hps_io_hps_io_usb1_inst_D0,
	hps_0_hps_io_hps_io_usb1_inst_D1,
	hps_0_hps_io_hps_io_usb1_inst_D2,
	hps_0_hps_io_hps_io_usb1_inst_D3,
	hps_0_hps_io_hps_io_usb1_inst_D4,
	hps_0_hps_io_hps_io_usb1_inst_D5,
	hps_0_hps_io_hps_io_usb1_inst_D6,
	hps_0_hps_io_hps_io_usb1_inst_D7,
	hps_0_hps_io_hps_io_usb1_inst_CLK,
	hps_0_hps_io_hps_io_usb1_inst_STP,
	hps_0_hps_io_hps_io_usb1_inst_DIR,
	hps_0_hps_io_hps_io_usb1_inst_NXT,
	hps_0_hps_io_hps_io_spim1_inst_CLK,
	hps_0_hps_io_hps_io_spim1_inst_MOSI,
	hps_0_hps_io_hps_io_spim1_inst_MISO,
	hps_0_hps_io_hps_io_spim1_inst_SS0,
	hps_0_hps_io_hps_io_uart0_inst_RX,
	hps_0_hps_io_hps_io_uart0_inst_TX,
	hps_0_hps_io_hps_io_i2c0_inst_SDA,
	hps_0_hps_io_hps_io_i2c0_inst_SCL,
	hps_0_hps_io_hps_io_i2c1_inst_SDA,
	hps_0_hps_io_hps_io_i2c1_inst_SCL,
	hps_0_hps_io_hps_io_gpio_inst_GPIO09,
	hps_0_hps_io_hps_io_gpio_inst_GPIO35,
	hps_0_hps_io_hps_io_gpio_inst_GPIO40,
	hps_0_hps_io_hps_io_gpio_inst_GPIO48,
	hps_0_hps_io_hps_io_gpio_inst_GPIO53,
	hps_0_hps_io_hps_io_gpio_inst_GPIO54,
	hps_0_hps_io_hps_io_gpio_inst_GPIO61,
	i2c_ext_sda_in,
	i2c_ext_scl_in,
	i2c_ext_sda_oe,
	i2c_ext_scl_oe,
	i2c_int_sda_in,
	i2c_int_scl_in,
	i2c_int_sda_oe,
	i2c_int_scl_oe,
	init_delay_export,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	nmr_sys_pll_locked_export,
	nmr_sys_pll_outclk_clk,
	nmr_sys_pll_reset_reset,
	pll_vga_clk65_clk,
	pll_vga_locked_export,
	pulse_180deg_export,
	pulse_90deg_export,
	pulse_t1_export,
	reset_reset_n,
	rx_delay_export,
	samples_per_echo_export,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	spi_mtch_ntwrk_MISO,
	spi_mtch_ntwrk_MOSI,
	spi_mtch_ntwrk_SCLK,
	spi_mtch_ntwrk_SS_n,
	switches_export);	

	input	[15:0]	adc_fifo_in_data;
	input		adc_fifo_in_valid;
	output		adc_fifo_in_ready;
	output	[31:0]	adc_val_sub_export;
	input		alt_vip_itc_0_clocked_video_vid_clk;
	output	[31:0]	alt_vip_itc_0_clocked_video_vid_data;
	output		alt_vip_itc_0_clocked_video_underflow;
	output		alt_vip_itc_0_clocked_video_vid_datavalid;
	output		alt_vip_itc_0_clocked_video_vid_v_sync;
	output		alt_vip_itc_0_clocked_video_vid_h_sync;
	output		alt_vip_itc_0_clocked_video_vid_f;
	output		alt_vip_itc_0_clocked_video_vid_h;
	output		alt_vip_itc_0_clocked_video_vid_v;
	output		analyzer_pll_locked_export;
	output		analyzer_pll_outclk0_clk;
	output		analyzer_pll_outclk1_clk;
	output		analyzer_pll_outclk2_clk;
	output		analyzer_pll_outclk3_clk;
	input		analyzer_pll_reset_reset;
	output	[31:0]	aux_cnt_out_export;
	input		clk_clk;
	input	[7:0]	ctrl_in_export;
	output	[31:0]	ctrl_out_export;
	input		dac_preamp_MISO;
	output		dac_preamp_MOSI;
	output		dac_preamp_SCLK;
	output		dac_preamp_SS_n;
	input	[31:0]	dconv_fifo_in_data;
	input		dconv_fifo_in_valid;
	output		dconv_fifo_in_ready;
	input	[31:0]	dconv_fifo_q_in_data;
	input		dconv_fifo_q_in_valid;
	output		dconv_fifo_q_in_ready;
	input	[14:0]	dconv_fir_in_data;
	input		dconv_fir_in_valid;
	input	[1:0]	dconv_fir_in_error;
	output	[31:0]	dconv_fir_out_data;
	output		dconv_fir_out_valid;
	output	[1:0]	dconv_fir_out_error;
	input	[14:0]	dconv_fir_q_in_data;
	input		dconv_fir_q_in_valid;
	input	[1:0]	dconv_fir_q_in_error;
	output	[31:0]	dconv_fir_q_out_data;
	output		dconv_fir_q_out_valid;
	output	[1:0]	dconv_fir_q_out_error;
	output	[31:0]	delay_nosig_export;
	output	[31:0]	delay_sig_export;
	output	[31:0]	delay_t1_export;
	output	[31:0]	echoes_per_scan_export;
	input		fifo_clk_bridge_in_clk;
	input		fifo_rst_reset;
	output		hps_0_h2f_reset_reset_n;
	output		hps_0_hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD0;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD1;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD2;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD3;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_0_hps_io_hps_io_emac1_inst_MDIO;
	output		hps_0_hps_io_hps_io_emac1_inst_MDC;
	input		hps_0_hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_0_hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_0_hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD1;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD2;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_0_hps_io_hps_io_qspi_inst_IO0;
	inout		hps_0_hps_io_hps_io_qspi_inst_IO1;
	inout		hps_0_hps_io_hps_io_qspi_inst_IO2;
	inout		hps_0_hps_io_hps_io_qspi_inst_IO3;
	output		hps_0_hps_io_hps_io_qspi_inst_SS0;
	output		hps_0_hps_io_hps_io_qspi_inst_CLK;
	inout		hps_0_hps_io_hps_io_sdio_inst_CMD;
	inout		hps_0_hps_io_hps_io_sdio_inst_D0;
	inout		hps_0_hps_io_hps_io_sdio_inst_D1;
	output		hps_0_hps_io_hps_io_sdio_inst_CLK;
	inout		hps_0_hps_io_hps_io_sdio_inst_D2;
	inout		hps_0_hps_io_hps_io_sdio_inst_D3;
	inout		hps_0_hps_io_hps_io_usb1_inst_D0;
	inout		hps_0_hps_io_hps_io_usb1_inst_D1;
	inout		hps_0_hps_io_hps_io_usb1_inst_D2;
	inout		hps_0_hps_io_hps_io_usb1_inst_D3;
	inout		hps_0_hps_io_hps_io_usb1_inst_D4;
	inout		hps_0_hps_io_hps_io_usb1_inst_D5;
	inout		hps_0_hps_io_hps_io_usb1_inst_D6;
	inout		hps_0_hps_io_hps_io_usb1_inst_D7;
	input		hps_0_hps_io_hps_io_usb1_inst_CLK;
	output		hps_0_hps_io_hps_io_usb1_inst_STP;
	input		hps_0_hps_io_hps_io_usb1_inst_DIR;
	input		hps_0_hps_io_hps_io_usb1_inst_NXT;
	output		hps_0_hps_io_hps_io_spim1_inst_CLK;
	output		hps_0_hps_io_hps_io_spim1_inst_MOSI;
	input		hps_0_hps_io_hps_io_spim1_inst_MISO;
	output		hps_0_hps_io_hps_io_spim1_inst_SS0;
	input		hps_0_hps_io_hps_io_uart0_inst_RX;
	output		hps_0_hps_io_hps_io_uart0_inst_TX;
	inout		hps_0_hps_io_hps_io_i2c0_inst_SDA;
	inout		hps_0_hps_io_hps_io_i2c0_inst_SCL;
	inout		hps_0_hps_io_hps_io_i2c1_inst_SDA;
	inout		hps_0_hps_io_hps_io_i2c1_inst_SCL;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO09;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO35;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO40;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO48;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO53;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO54;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO61;
	input		i2c_ext_sda_in;
	input		i2c_ext_scl_in;
	output		i2c_ext_sda_oe;
	output		i2c_ext_scl_oe;
	input		i2c_int_sda_in;
	input		i2c_int_scl_in;
	output		i2c_int_sda_oe;
	output		i2c_int_scl_oe;
	output	[31:0]	init_delay_export;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	output		nmr_sys_pll_locked_export;
	output		nmr_sys_pll_outclk_clk;
	input		nmr_sys_pll_reset_reset;
	output		pll_vga_clk65_clk;
	output		pll_vga_locked_export;
	output	[31:0]	pulse_180deg_export;
	output	[31:0]	pulse_90deg_export;
	output	[31:0]	pulse_t1_export;
	input		reset_reset_n;
	output	[31:0]	rx_delay_export;
	output	[31:0]	samples_per_echo_export;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		spi_mtch_ntwrk_MISO;
	output		spi_mtch_ntwrk_MOSI;
	output		spi_mtch_ntwrk_SCLK;
	output		spi_mtch_ntwrk_SS_n;
	input	[9:0]	switches_export;
endmodule
