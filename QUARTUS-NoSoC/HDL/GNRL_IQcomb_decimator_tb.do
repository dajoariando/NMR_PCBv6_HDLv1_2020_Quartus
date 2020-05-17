onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /GNRL_IQcomb_decimator_tb/RESET
add wave -noupdate /GNRL_IQcomb_decimator_tb/CLK
add wave -noupdate -divider Parameter
add wave -noupdate -divider Data
add wave -noupdate -radix decimal /GNRL_IQcomb_decimator_tb/dataI
add wave -noupdate -radix decimal /GNRL_IQcomb_decimator_tb/dataQ
add wave -noupdate -radix decimal /GNRL_IQcomb_decimator_tb/dataout
add wave -noupdate -divider Control
add wave -noupdate /GNRL_IQcomb_decimator_tb/in_valid
add wave -noupdate /GNRL_IQcomb_decimator_tb/out_valid
add wave -noupdate -divider Additional
add wave -noupdate -radix hexadecimal /GNRL_IQcomb_decimator_tb/GNRL_IQcomb_decimator1/DEC_CNT
add wave -noupdate /GNRL_IQcomb_decimator_tb/GNRL_IQcomb_decimator1/bit_sel
add wave -noupdate -radix hexadecimal /GNRL_IQcomb_decimator_tb/GNRL_IQcomb_decimator1/SState
add wave -noupdate -divider sum_data
add wave -noupdate -radix decimal /GNRL_IQcomb_decimator_tb/GNRL_IQcomb_decimator1/dataI_sum
add wave -noupdate -radix decimal /GNRL_IQcomb_decimator_tb/GNRL_IQcomb_decimator1/dataQ_sum
add wave -noupdate -radix decimal /GNRL_IQcomb_decimator_tb/GNRL_IQcomb_decimator1/dataQ_sum_dly
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8141754 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 406
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {7855783 ps} {8662884 ps}
