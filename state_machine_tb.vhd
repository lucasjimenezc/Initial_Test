library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_machine_tb is
end entity;

architecture rtl of state_machine_tb is
    component state_machine is
        port (
            clk           : in std_logic;
            areset        : in std_logic;
            i_a, i_b, i_c : in std_logic;
            o_d, o_e      : out std_logic
        );
    end component;
    
    signal s_clk            : std_logic := '0';
    signal s_areset          : std_logic := '0';
    signal s_testInVector   : std_logic_vector(2 downto 0) := (others => '0');
    signal s_d, s_e         : std_logic;

begin
    uut: state_machine port map(
        clk    => s_clk,
        areset => s_areset,
        i_a    => s_testInVector(0),
        i_b    => s_testInVector(1),
        i_c    => s_testInVector(2),
        o_d    => s_d,
        o_e    => s_e
    );

    s_areset <= '1', '0' after 20 ns;
    s_clk <= not s_clk after 5 ns;

    generate_signals: process
    begin
        for i in 0 to 7 loop
            s_testInVector <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        wait;
    end process;

end architecture;