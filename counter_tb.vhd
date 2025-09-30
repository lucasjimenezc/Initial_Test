library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;

architecture rtl of counter_tb is

    constant c_bits : integer := 10;
    component counter is
        generic(
            g_bits : integer := 10
        );
        port (
            clk, reset, areset     : in std_logic;
            o_S                    : out unsigned(g_bits - 1 downto 0)
        );
    end component;
    
    signal s_S          : unsigned(c_bits - 1 downto 0);
    signal s_reset      : std_logic := '0';
    signal s_areset     : std_logic := '0';
    signal s_clk        : std_logic := '0';

begin
    uut: counter 
    generic map (
        g_bits => c_bits
    )
    port map(
        clk     => s_clk,
        reset     => s_reset,
        areset     => s_areset,
        o_S     => s_S
    );

    s_clk <= not s_clk after 5 ns;
    
    generate_signals: process
    begin
        wait for 100 ns;
        s_reset <= '1'; wait for 10 ns; s_reset <= '0'; wait for 10 ns;
        wait for 100 ns;
        s_areset <= '1'; wait for 10 ns; s_areset <= '1';
        wait;
    end process;

end architecture;