 library IEEE;
 use IEEE.std_logic_1164.all;

 entity FSM_select is
    Port( clk : in std_logic;
          rst : in std_logic;
          SW0 : in std_logic;
          SW1 : in std_logic;
          SW2 : in std_logic;
          SW3 : in std_logic;
          SW4 : in std_logic;
          SW5 : in std_logic;
          SW6 : in std_logic;
          SW7 : in std_logic;
          choice : out std_logic_vector(3 downto 0)
          );
 end FSM_select;

 architecture Behavioral of FSM_select is
    type state_type is (Center,S0, S1, S2, S3, S4, S5, S6, S7);
    signal state : state_type:=Center;
    signal next_state : state_type;
    begin
        state_register: process(clk)
        begin
            if (clk'event and clk='1') then
                if (rst='1') then
                    state <= Center;
                else
                    state <= next_state;
                end if;
            end if;
        end process;
        
        output: process(state)
        begin
            if (state = Center) then
                choice <= "0000";
            elsif (state = S0) then
                choice <= "0001";
            elsif (state = S1) then
                choice <= "0010";
            elsif (state = S2) then
                choice <= "0011";
            elsif (state = S3) then
                choice <= "0100";
            elsif (state = S4) then
                choice <= "0101";
            elsif (state = S5) then
                choice <= "0111";
            elsif (state = S6) then
                choice <= "1000";
            elsif (state = S7) then
                choice <= "1001";
            end if;
        end process;

        wind_of_change : process(SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7)
        begin
            case state is
                when Center =>
                    if (SW0 = '1') then
                        next_state <= S0;
                    elsif ( SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW2 = '1' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;                      
                    end if;
                when S0 =>
                    if (SW0 = '1') then
                        next_state <= S0;
                    elsif ( SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW2 = '1' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;                    
                    end if;
                when S1 =>
                    if (SW1 = '1') then
                        next_state <= S1;
                    elsif ( SW0 = '1' and SW1 = '0') then
                        next_state <= S0;
                    elsif ( SW2 = '1' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;                      
                    end if;
                when S2 =>
                    if (SW2 = '1') then
                        next_state <= S2;
                    elsif ( SW2 = '0' and SW0 = '1') then
                        next_state <= S0;
                    elsif ( SW2 = '0' and SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;                     
                    end if;
                when S3 =>
                    if (SW3 = '1') then
                        next_state <= S3;
                    elsif ( SW0 = '1' and SW3 = '0') then
                        next_state <= S0;
                    elsif ( SW3 = '0' and SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW3 = '0' and SW2 = '1' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;                                   
                    end if;
                when S4 =>
                    if (SW4 = '1') then
                        next_state <= S4;
                    elsif ( SW0 = '1' and SW4 = '0') then
                        next_state <= S0;
                    elsif ( SW4 = '0' and SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW2 = '1' and SW4 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW4 = '0' and SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;
                    end if;
                when S5 =>          
                    if (SW5 = '1') then
                        next_state <= S5;
                    elsif ( SW0 = '1' and SW5 = '0') then
                        next_state <= S0;
                    elsif ( SW5 = '0' and SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW2 = '1' and SW5 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW5 = '0' and SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW5 = '0' and SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;
                    end if;
                when S6 =>          
                    if (SW6 = '1') then
                        next_state <= S6;
                    elsif ( SW0 = '1' and SW6 = '0') then
                        next_state <= S0;
                    elsif ( SW6 = '0' and SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW2 = '1' and SW6 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW6 = '0' and SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW6 = '0' and SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW6 = '0' and SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif (SW7 = '1' and SW6 = '0' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S7;
                    end if;
                when S7 =>          
                    if (SW7 = '1') then
                        next_state <= S7;
                    elsif ( SW0 = '1' and SW7 = '0') then
                        next_state <= S0;
                    elsif ( SW7 = '0' and SW1 = '1' and SW0 = '0') then
                        next_state <= S1;
                    elsif ( SW2 = '1' and SW7 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S2;
                    elsif ( SW7 = '0' and SW3 = '1' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S3;
                    elsif ( SW7 = '0' and SW4 = '1' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S4;
                    elsif ( SW7 = '0' and SW5 = '1' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S5;
                    elsif (SW7 = '0' and SW6 = '1' and SW5 = '0' and SW4 = '0' and SW3 = '0' and SW2 = '0' and SW1 = '0' and SW0 = '0') then
                        next_state <= S6;
                    end if;   
                end case;                         
--            if (state=Center and SW0='1') then
--                next_state <= S0;
--            elsif (state=Center and SW1='1') then
--                next_state <= S1;
--            elsif (state=Center and SW2='1') then
--                next_state <= S2;
--            elsif (state=Center and SW3='1') then
--                next_state <= S3;
--            elsif (state=Center and SW4='1') then
--                next_state <= S4;
--            elsif (state=Center and SW5='1') then
--                next_state <= S5;
--            elsif (state=Center and SW6='1') then
--                next_state <= S6;
--            elsif (state=Center and SW7='1') then
--                next_state <= S7;
--            elsif (state=S0 and SW0='0') then
--                next_state <= Center;
--            elsif (state=S1 and SW1='0') then
--                next_state <= Center;
--            elsif (state=S2 and SW2='0') then
--                next_state <= Center;
--            elsif (state=S3 and SW3='0') then
--                next_state <= Center;
--            elsif (state=S4 and SW4='0') then
--                next_state <= Center;
--            elsif (state=S5 and SW5='0') then
--                next_state <= Center;
--            elsif (state=S6 and SW6='0') then
--                next_state <= Center;
--            elsif (state=S7 and SW7='0') then
--                next_state <= Center;
--            end if;
        end process;
    end Behavioral;
