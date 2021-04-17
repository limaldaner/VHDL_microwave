library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL;

entity ctrl_oven is
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end ctrl_oven;
