library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.ALL;

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

component FlipFlop
port (
    D      : in std_logic;
    RST    : in bit;
    CLK    : in bit;
    Q      : out std_logic
);
end component;

signal R_S   : std_logic_vector(N-1 downto 0);
signal RST_S : bit := '0'; --count
signal CTRL_S: bit := '0'; --reset
signal QREF_S: std_logic_vector(N-1 downto 0);
signal OUTPUT_S: bit;

begin

dut_counter : counter
generic map(N)
port map (
    RST    => RST_S, --assynch
    CTRL   => CTRL_S,
    CLK    => CLK,
    R      => R_S
);

dut_FlipFlop: for I in 0 to N-1
generate
    for all: FlipFlop
        use entity work.FlipFlop(dataflow);
    begin
    FF : FlipFlop
    port map (
        D      => REF(I),
        RST    => RST_S, --assynch
        CLK    => CLK,
        Q      => QREF_S(I)
    );

end generate dut_FlipFlop;

process(START,RST,REF)
begin
    if START = '1' then -- verrouiller REF et recommence comptage
        RST_S <= '1';
        OUTPUT_S <= '0';
    else -- continuer comptage
        RST_S <= RST;
        if R_S = REF then
            OUTPUT_S <= '1';
        else
            OUTPUT_S <= '0';
        end if;
    end if;
end process;

process
begin
    wait until clk'event and clk ='1';
    OUTPUT <= OUTPUT_S;
end process;

end dataflow;
