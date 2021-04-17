onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bench_complete_oven/rst
add wave -noupdate /bench_complete_oven/dut/dut_ctrl/current_state
add wave -noupdate /bench_complete_oven/clk
add wave -noupdate /bench_complete_oven/full_power
add wave -noupdate /bench_complete_oven/half_power
add wave -noupdate /bench_complete_oven/door_open
add wave -noupdate /bench_complete_oven/s30
add wave -noupdate /bench_complete_oven/s60
add wave -noupdate /bench_complete_oven/s120
add wave -noupdate /bench_complete_oven/time_set
add wave -noupdate /bench_complete_oven/start
add wave -noupdate /bench_complete_oven/dut/dut_ctrl/timeout
add wave -noupdate /bench_complete_oven/finished
add wave -noupdate /bench_complete_oven/full
add wave -noupdate /bench_complete_oven/half
add wave -noupdate /bench_complete_oven/in_light
add wave -noupdate /bench_complete_oven/stop_counting
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {950 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 317
configure wave -valuecolwidth 55
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1050 ns}
