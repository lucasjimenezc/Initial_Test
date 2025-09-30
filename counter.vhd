library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    generic(
        g_bits : integer := 10
    );
    port (
        clk     : in std_logic;
        reset     : in  std_logic;
        areset     : in  std_logic;
        o_S     : out unsigned(g_bits - 1 downto 0)
    );
end counter;

architecture rtl of counter is

signal s_count : unsigned(g_bits - 1 downto 0) := (others => '0');

begin

    process(clk, areset)
    begin
        if(areset = '1') then
            s_count <= (others => '0');
        elsif(rising_edge(clk)) then
            if(reset = '1') then
                s_count <= (others => '0');
            else
                s_count <= s_count + to_unsigned(1,g_bits);
            end if;
        end if;
    end process;

    o_S <= s_count;

end rtl;