library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

architecture dataflow of alu_seq is

component FlipFlop
port (
    D      : in std_logic;    
    RST    : in bit;
	CLK    : in bit;
    Q      : out std_logic
);
end component;

component alu_comb
generic(N: integer);
port (
    A    : in  std_logic_vector(N-1 downto 0);
    B    : in  std_logic_vector(N-1 downto 0);
	SEL  : in  bit;
    R    : out std_logic_vector(N-1 downto 0)
);
end component;

signal QA_S: std_logic_vector(N-1 downto 0);
signal QB_S: std_logic_vector(N-1 downto 0);
signal R_ALU_S: std_logic_vector(N-1 downto 0);
begin

dut_FlipFlop: for I in 0 to N-1
generate
	for all: FlipFlop
		use entity work.FlipFlop(dataflow);
	begin
	FF : FlipFlop
	port map (
		D      => A(I),
		RST    => RST,
		CLK    => CLK,
		Q      => QA_S(I)
	);

	FF0 : FlipFlop
	port map (
		D      => B(I),
		RST    => RST,
		CLK    => CLK,
		Q      => QB_S(I)
	);
	
	FF1 : FlipFlop
	port map (
		D      => R_ALU_S(I),
		RST    => RST,
		CLK    => CLK,
		Q      => R(I)
	);
end generate dut_FlipFlop;


dut_alu_comb :alu_comb
generic map(N)
port map (
	A    => QA_S, 
	B    => QB_S,
	SEL  => SEL,
	R    => R_ALU_S
);

end dataflow;
