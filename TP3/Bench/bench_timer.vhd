library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library LIB_TP2;
use     LIB_TP2.timer;

entity bench_timer is
end bench_timer;

architecture test of bench_timer is

component timer
generic(N : integer)
port (
    START  : in bit;
    REF    : in std_logic_vector(N-1 downto 0) ;
    CLK    : in bit;
    RST    : in bit;
    OUTPUT : out std_logic_vector(N-1 downto 0)
);
end component;

constant N      : integer := 8;
signal CLK_S    :  bit := '0';
signal START_S  :  bit := '0';
signal RST_S    :  bit := '1';
signal REF_S    : std_logic_vector(N-1 downto 0) := "00000011"; --3
signal OUTPUT_S : std_logic_vector(N-1 downto 0);
signal stop     : std_logic := '0';

begin
    dut : timer
    generic map(N)
    port map (
        START  => START_S,
        REF    => REF_S,
        CLK    => CLK_S,
        RST    => RST_S,
        OUTPUT => OUTPUT_S
    );

    process(RST_S,CTRL_S,CLK_S,stop)
        begin
        if stop = '0' then
            CLK_S   <= not CLK_S   after 10 ns;
        end if;
    end process;
    stop    <= '1' after 160 ns;
    RST_S   <= '0' after 1 ns;
    START_S <= '1' after 1 ns;

end architecture;
