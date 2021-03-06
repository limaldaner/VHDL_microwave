library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library LIB_TP3;
use     LIB_TP3.counter_oven;

entity bench_counter_oven is
end bench_counter_oven;

architecture test of bench_counter_oven is

--define component
component counter_oven
port(
	clk, rst, start, stop, s30, s60, s120 : in std_logic;
	aboveth : out std_logic
);
end component;

-- define signals
signal rst: std_logic := '0';
signal clk, start, stop, stop_counting, s30, s60, s120  : std_logic := '0';
signal aboveth : std_logic;

begin
-- design uder test 
dut : counter_oven
port map(
	clk, rst, start, stop, s30, s60, s120,
	aboveth
);

-- Generation des stimulis
-- clk stimuli
stop_counting <=  '1' after 700 ns;

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
	wait for 9 ns; -- idle
	start <= '0';
	s30 <= '1';
	wait for 30 ns; -- counting
	start <= '1';
	wait for 40 ns; -- stopped
	stop <= '1';
	wait for 20 ns; -- stopped
	start <= '0';
	wait for 40 ns; -- counting
	stop <= '0';
	start <= '1';
	wait for 600 ns; -- counting until idle
	else wait;
	end if;
end process;

end architecture;

