library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL;

entity counter_oven is
port(
	clk, rst, start, stop, s30, s60, s120 : in std_logic;
	aboveth : out std_logic
);
end entity;

