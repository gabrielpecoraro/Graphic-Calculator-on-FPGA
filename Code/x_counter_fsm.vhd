----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 11:32:54 AM
-- Design Name: 
-- Module Name: x_counter_fsm - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity x_counter_fsm is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           e_SW : in STD_LOGIC_VECTOR (3 downto 0);
           tempo : in std_logic;
           x : out STD_LOGIC_VECTOR (5 downto 0));
end x_counter_fsm;

architecture Behavioral of x_counter_fsm is
signal current_switch : std_logic_vector(3 downto 0);
signal x_value : signed(5 downto 0) := "100000";
begin
process(clk)
begin
if (clk'event and clk = '1') then
    if (rst = '1') then
        x_value<= "100000";
        current_switch <= e_SW;
    elsif (rst = '0') then
        if (tempo = '1') then
            if (current_switch  /= e_SW) then
                x_value <= "100000";
                current_switch <= e_SW;
            elsif (current_switch = e_SW) then
                if ( x_value <= to_signed(31,6)) then
                    x_value <= x_value + 1;
                else
                    x_value <= "100000";
                end if;
            end if;
            x <= std_logic_vector(x_value);
        end if;
    end if;
end if;                     
end process;            
end Behavioral;
