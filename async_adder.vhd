library ieee;
use ieee.std_logic_1164.all;

entity async_adder is
    port (
        i_A     : in std_logic;
        i_B     : in std_logic;
        i_Cin   : in std_logic;
        o_S     : out std_logic;
        o_Cout  : out std_logic
    );
end async_adder;

architecture rtl of async_adder is

signal s_A_XOR_B : std_logic;
signal s_A_AND_B : std_logic;

begin

    s_A_XOR_B <= i_A xor i_B;
    s_A_AND_B <= i_A and i_B;
    o_S <= i_Cin xor s_A_XOR_B;
    o_Cout <= s_A_AND_B or (i_Cin and s_A_XOR_B);

end rtl;