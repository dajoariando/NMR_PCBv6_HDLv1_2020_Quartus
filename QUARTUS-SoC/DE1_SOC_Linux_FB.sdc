# Clock constraints

create_clock -name "clock_50_0" -period 20.000ns [get_ports {CLOCK_50}]
create_clock -name "clock_50_1" -period 20.000ns [get_ports {CLOCK2_50}]
create_clock -name "clock_50_2" -period 20.000ns [get_ports {CLOCK3_50}]
create_clock -name "clock_50_3" -period 20.000ns [get_ports {CLOCK4_50}]
create_clock -name "clock_27_1" -period 37.000ns [get_ports {TD_CLK27}]

# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty


create_clock -name "VGA_CLK" -period "65.0 MHz" [get_ports {VGA_CLK}]

set_output_delay -max -clock clk_vga 0.220 [get_ports VGA_R*]
set_output_delay -min -clock clk_vga -1.506 [get_ports VGA_R*]
set_output_delay -max -clock clk_vga 0.212 [get_ports VGA_G*]
set_output_delay -min -clock clk_vga -1.519 [get_ports VGA_G*]
set_output_delay -max -clock clk_vga 0.264 [get_ports VGA_B*]
set_output_delay -min -clock clk_vga -1.519 [get_ports VGA_B*]
set_output_delay -max -clock clk_vga 0.215 [get_ports VGA_BLANK]
set_output_delay -min -clock clk_vga -1.485 [get_ports VGA_BLANK]

# DAC preamp 
create_clock -name dac_preamp_clk_ext -period 1000
set_output_delay -clock { dac_preamp_clk_ext } -min 0 [get_ports {GPIO_1[2]}]
set_output_delay -clock { dac_preamp_clk_ext } -max 0 [get_ports {GPIO_1[2]}]
set_output_delay -clock { dac_preamp_clk_ext } -min 0 [get_ports {GPIO_1[5]}]
set_output_delay -clock { dac_preamp_clk_ext } -max 0 [get_ports {GPIO_1[5]}]
set_output_delay -clock { dac_preamp_clk_ext } -min 0 [get_ports {GPIO_1[3]}]
set_output_delay -clock { dac_preamp_clk_ext } -max 0 [get_ports {GPIO_1[3]}]


# DAC gradient driver 
create_clock -name dac_grad_clk_ext -period 1000
set_output_delay -clock { dac_grad_clk_ext } -min 0 [get_ports {GPIO_1[17]}]
set_output_delay -clock { dac_grad_clk_ext } -max 0 [get_ports {GPIO_1[17]}]
set_output_delay -clock { dac_grad_clk_ext } -min 0 [get_ports {GPIO_1[14]}]
set_output_delay -clock { dac_grad_clk_ext } -max 0 [get_ports {GPIO_1[14]}]
set_output_delay -clock { dac_grad_clk_ext } -min 0 [get_ports {GPIO_1[16]}]
set_output_delay -clock { dac_grad_clk_ext } -max 0 [get_ports {GPIO_1[16]}]
set_input_delay -clock { dac_grad_clk_ext } -min 0 [get_ports {GPIO_1[19]}]
set_input_delay -clock { dac_grad_clk_ext } -max 0 [get_ports {GPIO_1[19]}]


# ADC
create_clock -name ADC_CLK -period 40.000 -waveform {0 20} [get_nets {NMR_Controller1|NMR_PULSE_PROGRAM1|NMR_MAIN_TIMER_CNT[1]}]
create_clock -name adc_clk_ext -period 40.000
set_output_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[25]}]
set_output_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[25]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[20]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[20]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[21]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[21]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[22]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[22]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[23]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[23]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[24]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[24]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[25]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[25]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[26]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[26]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[27]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[27]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[28]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[28]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[29]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[29]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[30]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[30]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[31]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[31]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[32]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[32]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[33]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[33]}]
set_input_delay -clock { adc_clk_ext } -min 0 [get_ports {GPIO_1[34]}]
set_input_delay -clock { adc_clk_ext } -max 0 [get_ports {GPIO_1[34]}]


# I2C int
create_clock -name i2c_int_clk_ext -period 1000
set_output_delay -clock { i2c_int_clk_ext } -min 0 [get_ports {GPIO_1[15]}]
set_output_delay -clock { i2c_int_clk_ext } -max 0 [get_ports {GPIO_1[15]}]
set_output_delay -clock { i2c_int_clk_ext } -min 0 [get_ports {GPIO_1[12]}]
set_output_delay -clock { i2c_int_clk_ext } -max 0 [get_ports {GPIO_1[12]}]


# SPI matching network
create_clock -name spi_mtch_ntwrk_clk_ext -period 100
set_output_delay -clock { spi_mtch_ntwrk_clk_ext } -min 0 [get_ports {GPIO_1[13]}]
set_output_delay -clock { spi_mtch_ntwrk_clk_ext } -max 0 [get_ports {GPIO_1[13]}]
set_output_delay -clock { spi_mtch_ntwrk_clk_ext } -min 0 [get_ports {GPIO_1[10]}]
set_output_delay -clock { spi_mtch_ntwrk_clk_ext } -max 0 [get_ports {GPIO_1[10]}]
set_output_delay -clock { spi_mtch_ntwrk_clk_ext } -min 0 [get_ports {GPIO_1[11]}]
set_output_delay -clock { spi_mtch_ntwrk_clk_ext } -max 0 [get_ports {GPIO_1[11]}]


# SPI afe relays
create_clock -name spi_afe_relays_clk_ext -period 100
set_output_delay -clock { spi_afe_relays_clk_ext } -min 0 [get_ports {GPIO_1[4]}]
set_output_delay -clock { spi_afe_relays_clk_ext } -max 0 [get_ports {GPIO_1[4]}]
set_output_delay -clock { spi_afe_relays_clk_ext } -min 0 [get_ports {GPIO_1[7]}]
set_output_delay -clock { spi_afe_relays_clk_ext } -max 0 [get_ports {GPIO_1[7]}]
set_output_delay -clock { spi_afe_relays_clk_ext } -min 0 [get_ports {GPIO_1[6]}]
set_output_delay -clock { spi_afe_relays_clk_ext } -max 0 [get_ports {GPIO_1[6]}]


# the pll analyzer clock constraints
set_false_path -from [get_clocks {u0|analyzer_pll|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk u0|analyzer_pll|altera_pll_i|cyclonev_pll|counter[2].output_counter|divclk}] -to tx_en_clk_ext


# misc control output
create_clock -name dup_en_clk_ext -period 1000
set_output_delay -clock { dup_en_clk_ext } -min 0 [get_ports {GPIO_1[8]}]
set_output_delay -clock { dup_en_clk_ext } -max 0 [get_ports {GPIO_1[8]}]

create_clock -name qsw_en_clk_ext -period 1000
set_output_delay -clock { qsw_en_clk_ext } -min 0 [get_ports {GPIO_1[9]}]
set_output_delay -clock { qsw_en_clk_ext } -max 0 [get_ports {GPIO_1[9]}]

create_clock -name en_rx_clk_ext -period 1000
set_output_delay -clock { en_rx_clk_ext } -min 0 [get_ports {GPIO_1[29]}]
set_output_delay -clock { en_rx_clk_ext } -max 0 [get_ports {GPIO_1[29]}]

create_clock -name tx_en_clk_ext -period 8.333
set_output_delay -clock { tx_en_clk_ext } -min 0 [get_ports {GPIO_0[0]}]
set_output_delay -clock { tx_en_clk_ext } -max 0 [get_ports {GPIO_0[0]}]
set_false_path -from [get_clocks {u0|analyzer_pll|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk u0|analyzer_pll|altera_pll_i|cyclonev_pll|counter[2].output_counter|divclk}] -to [get_clocks {tx_en_clk_ext}]


# TX_SD output can be delayed a bit
set_false_path -from [get_cells {NMR_Controller1|NMR_TX_SD_WINGEN1|TX_SD}] -to [get_ports {GPIO_0[0]}]

# the control data to tx_en from the SoC can be delayed a bit
set_false_path -from {soc_system:u0|soc_system_ctrl_out:ctrl_out|data_out[12]} -to {GPIO_0[0]}
set_false_path -from {soc_system:u0|soc_system_ctrl_out:ctrl_out|data_out[13]} -to {GPIO_0[0]}

# set multicycle path for the ADC clock path
set_false_path -from [get_pins {NMR_Controller1|NMR_PULSE_PROGRAM1|NMR_MAIN_TIMER_CNT[1]|q}] -to [get_registers {NMR_Controller:NMR_Controller1|NMR_PULSE_PROGRAM:NMR_PULSE_PROGRAM1|NMR_MAIN_TIMER_CNT[*]}]

# clock domain crossing
set_clock_groups -asynchronous -group {clock_50_0 } 				-group { u0|nmr_sys_pll|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk } 
set_clock_groups -asynchronous -group [get_clocks {ADC_CLK}]	-group [get_clocks {u0|nmr_sys_pll|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk}] 