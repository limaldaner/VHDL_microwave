library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL; 

entity alu_comb is 
generic(N: integer);
port (
    A    : in  std_logic_vector(N-1 downto 0);
    B    : in  std_logic_vector(N-1 downto 0);
	SEL  : in  bit;
    R    : out std_logic_vector(N-1 downto 0)
);
end alu_comb;
