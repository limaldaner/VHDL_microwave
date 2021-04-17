library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library LIB_TP3;
use     LIB_TP3.ctrl_oven;

entity bench_ctrl_oven is
end bench_ctrl_oven;

architecture test of bench_ctrl_oven is

--define component
component ctrl_oven
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end component;

component ctrl_oven_binary
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end component;

component ctrl_oven_gray
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end component;

component ctrl_oven_onehot
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end component;

-- define signals
signal rst: std_logic := '0';
signal clk, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout, stop : std_logic := '0';
signal full, half, in_light, finished, start_count, stop_count : std_logic;
signal fullB, halfB, in_lightB, finishedB, start_countB, stop_countB : std_logic;
signal fullOH, halfOH, in_lightOH, finishedOH, start_countOH, stop_countOH : std_logic;
signal fullG, halfG, in_lightG, finishedG, start_countG, stop_countG : std_logic;

begin
-- design uder test 
dut : ctrl_oven
port map(
	clk, rst, half_power,full_power, start, s30, s60, s120,time_set, door_open, timeout,
	full, half, in_light, finished, start_count, stop_count
);
dutB : ctrl_oven_binary
port map(
	clk, rst, half_power,full_power, start, s30, s60, s120,time_set, door_open, timeout,
	fullB, halfB, in_lightB, finishedB, start_countB, stop_countB
);

dutG : ctrl_oven_gray
port map(
	clk, rst, half_power,full_power, start, s30, s60, s120,time_set, door_open, timeout,
	fullG, halfG, in_lightG, finishedG, start_countG, stop_countG
);

dutOH : ctrl_oven_onehot
port map(
	clk, rst, half_power,full_power, start, s30, s60, s120,time_set, door_open, timeout,
	fullOH, halfOH, in_lightOH, finishedOH, start_countOH, stop_countOH
);




-- Generation des stimulis
-- clk stimuli
stop <= '0', '1' after 450 ns;

process(stop,clk)
begin
if stop='0' then
	clk <= not clk after 10 ns;
end if;
end process;

-- inputs stimulis
process
begin
	if stop='0' then
	rst <= '1';
	wait for 10 ns; -- idle
	rst <= '0';
	wait for 40 ns; -- idle
	full_power <= '0';
	half_power <= '0';
	wait for 20 ns; -- full_power
	full_power <= '1';
	wait for 40 ns; -- half_power
	full_power <= '0';
	half_power <= '1';
	wait for 20 ns; -- full_power
	full_power <= '1';
	half_power <= '0';
	wait for 20 ns; -- full_power > set_time
	s30 <= '1';
	wait for 40 ns; -- operation_disabled
	time_set <= '1';
	door_open <= '1';
	wait for 40 ns; -- operation_enabled
	door_open <= '0';
	wait for 40 ns; -- operation_disabled
	door_open <= '1';
	wait for 20 ns; -- operation_enabled
	door_open <= '0';
	wait for 20 ns; -- operating
	start <= '1'; 
	wait for 40 ns; -- operation_disabled
	door_open <= '1';
	wait for 20 ns; -- operation_enabled
	door_open <= '0';
	wait for 40 ns; -- operating
	timeout <= '1';
	wait for 40 ns; -- complete
	door_open <= '1';
	wait for 20 ns; --idle
	else wait;
	end if;
end process;

end architecture;
