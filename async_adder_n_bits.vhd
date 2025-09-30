library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity async_adder_n_bits is
    generic(
        g_bits : integer := 10
    );
    port (
        i_A     : in std_logic_vector (g_bits - 1 downto 0);
        i_B     : in std_logic_vector (g_bits - 1 downto 0);
        i_Cin   : in std_logic;
        o_S     : out std_logic_vector(g_bits - 1 downto 0);
        o_Cout  : out std_logic
    );
end async_adder_n_bits;

architecture rtl of async_adder_n_bits is

component async_adder
    port(i_A, i_B, i_Cin : in std_logic; 
         o_S, o_Cout : out std_logic);
end component;

signal s_carry : std_logic_vector(g_bits downto 0) := (others => '0');

begin
    s_carry(0) <= i_Cin;
    adder : for I in 0 to g_bits - 1 generate
        m_async_adder : async_adder port map(i_A(I), i_B(I), s_carry(I), o_S(I), s_carry(I+1));
    end generate;
    o_Cout <= s_carry(g_bits);
end architecture;