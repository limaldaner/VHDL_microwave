library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL;

entity timer is
generic(N : integer);
port (
    START  : in bit;
    REF    : in std_logic_vector(N-1 downto 0) ;
    CLK    : in bit;
    RST    : in bit;
    OUTPUT : out bit
);
end timer;
