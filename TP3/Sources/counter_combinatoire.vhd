library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

architecture dataflow of counter is

component alu_seq
generic(N: integer);
port (
    A    : in  std_logic_vector(N-1 downto 0);
    B    : in  std_logic_vector(N-1 downto 0);
    RST  : in bit;
	SEL  : in  bit;
	CLK  : in bit;
    R    : out std_logic_vector(N-1 downto 0)
);
end component;

signal QA_S: std_logic_vector(N-1 downto 0);
signal QB_S: std_logic_vector(N-1 downto 0) := std_logic_vector(TO_UNSIGNED(1, N));
signal R_S: std_logic_vector(N-1 downto 0);
begin

dut_alu_seq : alu_seq
generic map(N)
port map (
	A    => QA_S, 
	B    => QB_S,
	RST  => RST,
	SEL  => CTRL,
	CLK  => CLK,
	R    => R_S
);
QA_S <= R_S;

end dataflow;
