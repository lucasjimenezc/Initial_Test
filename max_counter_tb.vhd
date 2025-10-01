library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.ALL;

entity max_counter_tb is
end entity;

architecture rtl of max_counter_tb is
    constant c_count_max : integer := 100;
    component max_counter is
        generic(
            g_count_max : integer := 100
        );
        port (
            clk   : in std_logic;
            o_S   : out unsigned(integer(ceil(log2(real(g_count_max)))) - 1 downto 0);
            o_max : out std_logic
        );
    end component;
    
    signal s_clk   : std_logic := '0';
    signal s_S     : unsigned(integer(ceil(log2(real(c_count_max)))) - 1 downto 0);
    signal s_max  : std_logic := '0';

begin
    uut: max_counter port map(
        clk   => s_clk,
        o_S   => s_S,
        o_max => s_max
    );

    s_clk <= not s_clk after 5 ns;

    generate_signals: process
    begin
        wait for 300 ns;
        wait;
    end process;

end architecture;