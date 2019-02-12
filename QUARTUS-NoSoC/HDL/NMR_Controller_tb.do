onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /NMR_Controller_tb/T1_PULSE180
add wave -noupdate -radix unsigned /NMR_Controller_tb/T1_DELAY
add wave -noupdate -radix unsigned /NMR_Controller_tb/PULSE90
add wave -noupdate -radix unsigned /NMR_Controller_tb/DELAY_NO_ACQ
add wave -noupdate -radix unsigned /NMR_Controller_tb/PULSE180
add wave -noupdate -radix unsigned /NMR_Controller_tb/DELAY_WITH_ACQ
add wave -noupdate -radix unsigned /NMR_Controller_tb/ECHO_PER_SCAN
add wave -noupdate -radix unsigned /NMR_Controller_tb/SAMPLES_PER_ECHO
add wave -noupdate -radix unsigned /NMR_Controller_tb/ADC_INIT_DELAY
add wave -noupdate /NMR_Controller_tb/START
add wave -noupdate /NMR_Controller_tb/FSMSTAT
add wave -noupdate -color Red /NMR_Controller_tb/RF_OUT_P
add wave -noupdate -color Red /NMR_Controller_tb/RF_OUT_N
add wave -noupdate /NMR_Controller_tb/PHASE_CYCLE
add wave -noupdate -radix hexadecimal /NMR_Controller_tb/Q_IN
add wave -noupdate /NMR_Controller_tb/Q_IN_OV
add wave -noupdate -radix hexadecimal /NMR_Controller_tb/ADC_OUT_DATA
add wave -noupdate /NMR_Controller_tb/ADC_DATA_VALID
add wave -noupdate /NMR_Controller_tb/PULSEPROG_CLK
add wave -noupdate /NMR_Controller_tb/ADC_CLK
add wave -noupdate /NMR_Controller_tb/RESET
add wave -noupdate /NMR_Controller_tb/uut/EN_RX
add wave -noupdate /NMR_Controller_tb/EN_ADC
add wave -noupdate -divider NMR_PULSE_PROGRAM
add wave -noupdate /NMR_Controller_tb/uut/NMR_PULSE_PROGRAM1/START
add wave -noupdate -radix hexadecimal /NMR_Controller_tb/uut/NMR_PULSE_PROGRAM1/State
add wave -noupdate /NMR_Controller_tb/uut/NMR_PULSE_PROGRAM1/OUT_EN
add wave -noupdate /NMR_Controller_tb/uut/NMR_PULSE_PROGRAM1/ACQ_WND
add wave -noupdate /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ACQ_EN
add wave -noupdate -divider ADC
add wave -noupdate /NMR_Controller_tb/uut/ADC_LTC1746_DRV1/acq_en
add wave -noupdate /NMR_Controller_tb/uut/ADC_LTC1746_DRV1/data_ready
add wave -noupdate -divider ADC_delay_generator
add wave -noupdate -radix unsigned /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_DELAY_CNT
add wave -noupdate -radix unsigned -childformat {{{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[31]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[30]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[29]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[28]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[27]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[26]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[25]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[24]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[23]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[22]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[21]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[20]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[19]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[18]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[17]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[16]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[15]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[14]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[13]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[12]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[11]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[10]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[9]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[8]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[7]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[6]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[5]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[4]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[3]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[2]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[1]} -radix unsigned} {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[0]} -radix unsigned}} -subitemconfig {{/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[31]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[30]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[29]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[28]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[27]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[26]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[25]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[24]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[23]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[22]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[21]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[20]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[19]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[18]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[17]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[16]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[15]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[14]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[13]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[12]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[11]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[10]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[9]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[8]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[7]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[6]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[5]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[4]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[3]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[2]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[1]} {-height 15 -radix unsigned} {/NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY[0]} {-height 15 -radix unsigned}} /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ADC_INIT_DELAY
add wave -noupdate -radix unsigned /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/SAMPLES_PER_ECHO
add wave -noupdate /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ACQ_EN
add wave -noupdate /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/ACQ_WND
add wave -noupdate /NMR_Controller_tb/uut/ACQ_WND_PULSED
add wave -noupdate /NMR_Controller_tb/uut/ACQ_WND_DLY
add wave -noupdate /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/CLK
add wave -noupdate /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/RESET
add wave -noupdate -radix hexadecimal /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/State
add wave -noupdate /NMR_Controller_tb/uut/ADC_ACQ_WINGEN1/TOKEN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2637893 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 378
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {686813 ps} {5978590 ps}
