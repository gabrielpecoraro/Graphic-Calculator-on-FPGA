----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2023 21:21:55
-- Design Name: 
-- Module Name: FSM_background - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_background is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           up : in STD_LOGIC;
           down : in STD_LOGIC;
           clk_100 : in std_logic;
           s_back : out STD_LOGIC_VECTOR (3 downto 0));
end FSM_background;

architecture Behavioral of FSM_background is
type state_type is (b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15);
signal state : state_type:=b0;
signal next_state : state_type;

begin

state_register : process(clk)
begin
    if (clk'event and clk='1') then
        if (rst='1') then
            state<=b0;
        elsif clk_100='1' then
            state <= next_state;
        end if;
    end if;
end process;

output : process(state)
begin
    case state is
        when b0 =>
            s_back <= "0000";
        when b1 =>
            s_back <= "0001";
        when b2 =>
            s_back <= "0010";
        when b3 =>
            s_back <= "0011";
        when b4 =>
            s_back <= "0100";
        when b5 =>
            s_back <= "0101";
        when b6 =>
            s_back <= "0110";
        when b7 =>
            s_back <= "0111";
        when b8 =>
            s_back <= "1000";
        when b9 =>
            s_back <= "1001";
        when b10 =>
            s_back <= "1010";
        when b11 =>
            s_back <= "1011";
        when b12 =>
            s_back <= "1100";
        when b13 =>
            s_back <= "1101";
        when b14 =>
            s_back <= "1110";
        when b15 =>
            s_back <= "1111";
    end case;
end process output;

wind_of_change : process(up, down)
begin
    if (state = b0 and up = '1') then
        next_state <= b1;
    elsif (state = b0 and down = '1') then
        next_state <= b15;
    elsif (state = b1 and up = '1') then
        next_state <= b2;
    elsif (state = b1 and down = '1') then
        next_state <= b0;
    elsif (state = b2 and up = '1') then
        next_state <= b3;
    elsif (state = b2 and down = '1') then
        next_state <= b1;
    elsif (state = b3 and up = '1') then
        next_state <= b4;
    elsif (state = b3 and down = '1') then
        next_state <= b2;
    elsif (state = b4 and up = '1') then
        next_state <= b5;
    elsif (state = b4 and down = '1') then
        next_state <= b3;
    elsif (state = b5 and up = '1') then
        next_state <= b6;
    elsif (state = b5 and down = '1') then
        next_state <= b4;
    elsif (state = b6 and up = '1') then
        next_state <= b7;
    elsif (state = b6 and down = '1') then
        next_state <= b5;
    elsif (state = b7 and up = '1') then
        next_state <= b8;
    elsif (state = b7 and down = '1') then
        next_state <= b6;
    elsif (state = b8 and up = '1') then
        next_state <= b9;
    elsif (state = b8 and down = '1') then
        next_state <= b7;
    elsif (state = b9 and up = '1') then
        next_state <= b10;
    elsif (state = b9 and down = '1') then
        next_state <= b8;
    elsif (state = b10 and up = '1') then
        next_state <= b11;
    elsif (state = b10 and down = '1') then
        next_state <= b9;
    elsif (state = b11 and up = '1') then
        next_state <= b12;
    elsif (state = b11 and down = '1') then
        next_state <= b10;
    elsif (state = b12 and up = '1') then
        next_state <= b13;
    elsif (state = b12 and down = '1') then
        next_state <= b11;
    elsif (state = b13 and up = '1') then
        next_state <= b14;
    elsif (state = b13 and down = '1') then
        next_state <= b12;
    elsif (state = b14 and up = '1') then
        next_state <= b15;
    elsif (state = b15 and up = '1') then
        next_state <= b0;
    elsif (state = b15 and down = '1') then
        next_state <= b14;
    end if;
end process;
        
end Behavioral;
