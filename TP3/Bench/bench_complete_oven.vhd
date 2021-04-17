library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library LIB_TP3;
use     LIB_TP3.complete_oven;

entity bench_complete_oven is
end bench_complete_oven;

architecture test of bench_complete_oven is

--define component
component complete_oven
port(
	clk, rst, half_power, full_power, start, s30, s60, s120, time_set, door_open : in std_logic;
	full, half, in_light, finished : out std_logic
	);
end component;

-- define signals
signal rst: std_logic := '0';
signal clk, half_power, full_power, start, s30, s60, s120, time_set, door_open, stop_counting: std_logic := '0';
signal full, half, in_light, finished  : std_logic;

begin
-- design uder test 
dut : complete_oven
port map(
	clk, rst, half_power, full_power, start, s30, s60, s120, time_set, door_open,
	full, half, in_light, finished
);

-- Generation des stimulis
-- clk stimuli
stop_counting <=  '1' after 1710 ns;

process(stop_counting,clk)
begin
if stop_counting='0' then
	clk <= not clk after 10 ns;
end if;
end process;

-- inputs stimulis
process
begin
	if stop_counting='0' then
	rst <= '1';
	wait for 1 ns; -- idle
	rst <= '0';
	wait for 29 ns; -- idle
	full_power <= '1';
	half_power <= '1';
	wait for 20 ns; -- full_power
	half_power <= '0';
	wait for 40 ns; -- half_power
	half_power <= '1';
	wait for 40 ns; -- full_power > set_time
	half_power <= '0';
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
	wait for 600 ns; -- operating > complete
	door_open <= '0';
	full_power <= '0';
	wait for 20 ns; -- complete > complete
	door_open <= '0';
	wait for 20 ns; --idle > idle
	door_open <= '1';
	wait for 20 ns; --idle > half_power_on
	half_power <= '1';
	wait for 20 ns; --half_power_on > half_power_on
	s30 <= '0';
	s60 <= '0';
	s120 <= '0';
	wait for 20 ns; --half_power_on > set_timer
	s30 <= '1';
	wait for 20 ns; --set_timer > operation_enabled
	time_set <= '1';
	door_open <= '0';
	wait for 600 ns; -- operating > complete
	door_open <= '1';
	wait for 20 ns; --idle > idle
	else wait;
	end if;
end process;

end architecture;

