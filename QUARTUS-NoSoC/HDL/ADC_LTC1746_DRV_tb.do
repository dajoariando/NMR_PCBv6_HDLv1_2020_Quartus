onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /ADC_LTC1746_DRV_tb/Q_IN
add wave -noupdate /ADC_LTC1746_DRV_tb/Q_IN_OV
add wave -noupdate -radix hexadecimal /ADC_LTC1746_DRV_tb/Q_OUT
add wave -noupdate /ADC_LTC1746_DRV_tb/Q_OUT_OV
add wave -noupdate /ADC_LTC1746_DRV_tb/acq_en
add wave -noupdate /ADC_LTC1746_DRV_tb/data_ready
add wave -noupdate /ADC_LTC1746_DRV_tb/out_en
add wave -noupdate /ADC_LTC1746_DRV_tb/SYS_CLK
add wave -noupdate /ADC_LTC1746_DRV_tb/CLKOUT
add wave -noupdate /ADC_LTC1746_DRV_tb/RESET
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {77463 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 267
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
WaveRestoreZoom {0 ps} {2791908 ps}
