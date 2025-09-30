library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_adder is
    generic(
        g_bits : integer := 10
    );
    port (
        clk     : in std_logic;
        i_A     : in  signed(g_bits - 1 downto 0);
        i_B     : in  signed(g_bits - 1 downto 0);
        o_S     : out signed(g_bits - 1 downto 0)
    );
end sync_adder;

architecture rtl of sync_adder is

begin

    process(clk)
    begin
        if(rising_edge(clk)) then
            o_S <= i_A + i_B;
        end if;
    end process;

end rtl;