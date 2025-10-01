library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.ALL;

entity max_counter is
    generic(
        g_count_max : integer := 100
    );
    port (
        clk     : in std_logic;
        o_max   : out std_logic;
        o_S     : out unsigned(integer(ceil(log2(real(g_count_max)))) - 1 downto 0)
    );
end max_counter;

architecture rtl of max_counter is

signal s_count : unsigned(integer(ceil(log2(real(g_count_max)))) - 1 downto 0) := (others => '0');
signal s_max   : std_logic := '0';

begin

    process(clk)
    begin
        if(rising_edge(clk)) then
            if(s_count = to_unsigned(g_count_max - 2, s_count'length)) then
                s_max <= '1';
                s_count <= s_count + to_unsigned(1,s_count'length);
            elsif (s_count = to_unsigned(g_count_max - 1, s_count'length)) then
                s_count <= (others => '0');
                s_max <= '0';
            else
                s_count <= s_count + to_unsigned(1,s_count'length);
                s_max <= '0';
            end if;
        end if;
    end process;
    
    o_max <= s_max;
    o_S <= s_count;

end rtl;