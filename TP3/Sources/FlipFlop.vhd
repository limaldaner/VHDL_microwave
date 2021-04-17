library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL; 

entity FlipFlop is 
port (
    D      : in std_logic;    
    RST    : in bit;
	CLK    : in bit;
    Q      : out std_logic
);
end FlipFlop;
