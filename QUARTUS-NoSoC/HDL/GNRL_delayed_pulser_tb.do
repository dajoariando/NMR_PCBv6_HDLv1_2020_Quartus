onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider system
add wave -noupdate /GNRL_delayed_pulser_tb/CLK
add wave -noupdate /GNRL_delayed_pulser_tb/RESET
add wave -noupdate -radix hexadecimal /GNRL_delayed_pulser_tb/uut/State
add wave -noupdate -divider signals
add wave -noupdate /GNRL_delayed_pulser_tb/SIG_IN
add wave -noupdate /GNRL_delayed_pulser_tb/SIG_OUT
add wave -noupdate -divider parameters
add wave -noupdate -radix decimal /GNRL_delayed_pulser_tb/DELAY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13146593 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
configure wave -valuecolwidth 40
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
WaveRestoreZoom {11600567 ps} {17698300 ps}
