library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

architecture dataflow of FlipFlop is

begin
process(RST,D,CLK)
begin
	if RST = '1' then
		Q <= '0';
	elsif CLK = '1' and CLK'event then
		Q <= D;
	end if;
end process;
end dataflow;
