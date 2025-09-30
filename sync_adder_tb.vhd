library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_adder_tb is
end entity;

architecture rtl of sync_adder_tb is

    constant c_bits : integer := 10;
    component sync_adder is
        generic(
            g_bits : integer := 10
        );
        port (
            clk     : in std_logic;
            i_A, i_B: in signed(g_bits - 1 downto 0);
            o_S:      out signed(g_bits - 1 downto 0)
        );
    end component;
    
    signal s_A           : signed(c_bits - 1 downto 0);
    signal s_B           : signed(c_bits - 1 downto 0);
    signal s_S           : signed(c_bits - 1 downto 0);
    signal s_clk         : std_logic := '0';

begin
    uut: sync_adder 
    generic map (
        g_bits => c_bits
    )
    port map(
        clk     => s_clk,
        i_A     => s_A,
        i_B     => s_B,
        o_S     => s_S
    );

    s_clk <= not s_clk after 5 ns;
    
    generate_signals: process
    begin
        s_A <= to_signed(36, c_bits); s_B <= to_signed(45, c_bits); wait for 10 ns;
        s_A <= to_signed(-36, c_bits); s_B <= to_signed(45, c_bits); wait for 10 ns;
        s_A <= to_signed(-76, c_bits); s_B <= to_signed(45, c_bits); wait for 10 ns;
        wait;
    end process;

end architecture;