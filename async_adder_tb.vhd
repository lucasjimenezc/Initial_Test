library IEEE;
use IEEE.std_logic_1164.all;

entity async_adder_tb is
end entity;

architecture rtl of async_adder_tb is
    component async_adder is
        port (
            i_A, i_B, i_Cin : in std_logic;
            o_S, o_Cout : out std_logic
        );
    end component;
    
    signal testInVector : std_logic_vector(2 downto 0);
    signal o_S, o_Cout  : std_logic;

begin
    uut: async_adder port map(
        i_A     => testInVector(0),
        i_B     => testInVector(1),
        i_Cin   => testInVector(2),
        o_S     => o_S,
        o_Cout  => o_Cout
    );

    generate_signals: process
    begin
        testInVector <= "000"; wait for 10 ns;
        testInVector <= "001"; wait for 10 ns;
        testInVector <= "010"; wait for 10 ns;
        testInVector <= "011"; wait for 10 ns;
        testInVector <= "100"; wait for 10 ns;
        testInVector <= "101"; wait for 10 ns;
        testInVector <= "110"; wait for 10 ns;
        testInVector <= "111"; wait for 10 ns;
        wait;
    end process;

end architecture;