library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

architecture behavioral of complete_oven is

component ctrl_oven
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end component;

component counter_oven
port(
	clk, rst, start, stop, s30, s60, s120 : in std_logic;
	aboveth : out std_logic
);
end component;

signal timeout_S, start_count_S, stop_count_s: std_logic;

begin

dut_counter : counter_oven
port map(
	clk, rst, start_count_S, stop_count_S, s30, s60, s120,
	timeout_S
);

dut_ctrl : ctrl_oven
port map(
	clk, rst, half_power,full_power, start, s30, s60, s120,time_set, door_open, timeout_S,
	full, half, in_light, finished, start_count_S, stop_count_S
);

end behavioral;
