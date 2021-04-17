library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

architecture dataflow of timer is

component counter
generic(N: integer);
port (
    RST  : in bit;
	CTRL : in bit;
	CLK  : in bit;
    R    : out std_logic_vector(N-1 downto 0)
);
end component;

signal R_S: std_logic_vector(N-1 downto 0);
begin

dut_counter : counter
generic map(N)
port map (
	RST    => RST_S, 
	CTRL   => CTRL_S,
	CLK  => CLK,
	R    => R_S
);

process 
begin
if START = '1' and CLK =  then
	
else
	
end if;
end process
end dataflow;


