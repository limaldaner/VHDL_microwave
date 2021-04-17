library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL; 

entity counter is 
generic(N: integer);
port (
    RST  : in bit;
	CTRL : in bit;
	CLK  : in bit;
    R    : out std_logic_vector(N-1 downto 0)
);
end counter;
