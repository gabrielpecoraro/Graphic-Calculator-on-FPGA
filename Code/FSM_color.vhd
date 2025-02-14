----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2023 17:37:59
-- Design Name: 
-- Module Name: FSM_color - Behavioral
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

entity FSM_color is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           left : in STD_LOGIC;
           right : in STD_LOGIC;
           clk_100 : in std_logic;
           s_color : out STD_LOGIC_VECTOR (1 downto 0));
end FSM_color;

architecture Behavioral of FSM_color is

type state_type is (c0,c1,c3);
signal state : state_type :=c0;
signal next_state : state_type;

begin

state_register : process(clk)
begin
    if (clk'event and clk='1') then
        if (rst='1') then
            state<=c0;
        elsif clk_100='1' then
            state <= next_state;
        end if;
    end if;
end process;

output : process(state)
begin
    case state is
        when c0 =>
            s_color <= "00";
        when c1 =>
            s_color <= "01";
        when c3 =>
            s_color <= "11";
    end case;
end process;

wind_of_change : process(right, left)
begin
    if ( state = c0 and right = '1' and left='0') then
        next_state <= c1;
    elsif ( state = c0 and left = '1' and right='0') then
        next_state <= c3;            
    elsif ( state = c1 and right = '1' and left='0' ) then
        next_state <= c3;
    elsif ( state = c1 and left = '1' and right='0') then
        next_state <= c0;       
    elsif ( state = c3 and right = '1' and left='0' ) then
        next_state <= c0;
    elsif ( state = c3 and left = '1' and right='0' ) then
        next_state <= c1;
    else
    end if;
end process;
      
end Behavioral;
