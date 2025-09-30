library IEEE;
use IEEE.std_logic_1164.all;

entity async_adder_n_bits_tb is
end entity;

architecture rtl of async_adder_n_bits_tb is

    constant c_bits : integer := 10;
    component async_adder_n_bits is
        generic(
            g_bits : integer := 10
        );
        port (
            i_A, i_B : in std_logic_vector(g_bits - 1 downto 0);
            i_Cin    : in std_logic;
            o_S      : out std_logic_vector(g_bits - 1 downto 0);
            o_Cout   : out std_logic
        );
    end component;
    
    signal s_A           : std_logic_vector(c_bits - 1 downto 0);
    signal s_B           : std_logic_vector(c_bits - 1 downto 0);
    signal s_S           : std_logic_vector(c_bits - 1 downto 0);
    signal s_Cin, s_Cout : std_logic;

begin
    uut: async_adder_n_bits 
    generic map (
        g_bits => c_bits
    )
    port map(
        i_A     => s_A,
        i_B     => s_B,
        i_Cin   => s_Cin,
        o_S     => s_S,
        o_Cout  => s_Cout
    );

    generate_signals: process
    begin
        s_A <= "0001001010";s_B <= "0001100101"; s_Cin <= '0';  wait for 10 ns;
        s_A <= "1101010010";s_B <= "0011011111"; s_Cin <= '1';  wait for 10 ns;
        s_A <= "0110100001";s_B <= "1011111110"; s_Cin <= '1';  wait for 10 ns;
        wait;
    end process;

end architecture;