onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /GNRL_dconv_nofilter_tb/RESET
add wave -noupdate /GNRL_dconv_nofilter_tb/CLK
add wave -noupdate -radix decimal /GNRL_dconv_nofilter_tb/adc_data_in
add wave -noupdate -radix decimal /GNRL_dconv_nofilter_tb/GNRL_dconv_nofilter1/adc_data_ac
add wave -noupdate -radix decimal /GNRL_dconv_nofilter_tb/data_i
add wave -noupdate -radix decimal /GNRL_dconv_nofilter_tb/data_q
add wave -noupdate /GNRL_dconv_nofilter_tb/conv_en
add wave -noupdate /GNRL_dconv_nofilter_tb/GNRL_dconv_nofilter1/counter
add wave -noupdate -radix unsigned /GNRL_dconv_nofilter_tb/adc_dcval_subtractor
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {497697 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 334
configure wave -valuecolwidth 82
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
WaveRestoreZoom {0 ps} {656250 ps}
