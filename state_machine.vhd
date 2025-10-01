library ieee;
use ieee.std_logic_1164.all;

entity state_machine is
    port (
        clk           : in std_logic;
        areset        : in std_logic;
        i_a, i_b, i_c : in std_logic;
        o_d, o_e      : out std_logic
    );
end state_machine;

architecture rtl of state_machine is

type Tstate is (idle, step_1, step_2, step_3);
signal state: Tstate;
signal next_state: Tstate;

begin

    process(clk, areset)
    begin
        if(areset = '1') then
            state <= idle;
        elsif(rising_edge(clk)) then
            state <= next_state;
        end if;
    end process;

    process(state, i_a, i_b, i_c)
    begin
        o_d <= '1';o_e <= '0';next_state <= state;
        case state is
            when idle   =>
                if(i_a = '1') then
                    o_e <= i_a;
                    next_state <= step_1;
                end if;
            when step_1 =>
                if(i_b ='0') then
                    next_state <= step_2;
                else
                    next_state <= idle;
                end if;
            when step_2 =>
                o_d <= '0';
                if(i_c ='0') then
                    next_state <= step_1;
                else
                    next_state <= step_3;
                end if;
            when step_3 =>
                if(i_c = '1') then
                    o_e <= '1';
                    next_state <= idle;
                end if; 
        end case;
    end process;



end rtl;