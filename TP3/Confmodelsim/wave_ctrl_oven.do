onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bench_ctrl_oven/rst
add wave -noupdate /bench_ctrl_oven/clk
add wave -noupdate /bench_ctrl_oven/full_power
add wave -noupdate /bench_ctrl_oven/half_power
add wave -noupdate /bench_ctrl_oven/door_open
add wave -noupdate /bench_ctrl_oven/s120
add wave -noupdate /bench_ctrl_oven/s60
add wave -noupdate /bench_ctrl_oven/s30
add wave -noupdate /bench_ctrl_oven/start
add wave -noupdate /bench_ctrl_oven/time_set
add wave -noupdate /bench_ctrl_oven/full
add wave -noupdate /bench_ctrl_oven/half
add wave -noupdate /bench_ctrl_oven/in_light
add wave -noupdate /bench_ctrl_oven/finished
add wave -noupdate /bench_ctrl_oven/start_count
add wave -noupdate /bench_ctrl_oven/stop
add wave -noupdate /bench_ctrl_oven/stop_count
add wave -noupdate /bench_ctrl_oven/timeout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {430 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 262
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {473 ns}
