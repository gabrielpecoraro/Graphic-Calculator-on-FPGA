----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 10:35:21 AM
-- Design Name: 
-- Module Name: counter_manager - Behavioral
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

entity counter_manager is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           tempo : out STD_LOGIC);
end counter_manager;

architecture Behavioral of counter_manager is
signal tempo_value : unsigned(2 downto 0) := "000";
begin
process(clk)
begin
    if (clk'event and clk = '1') then
        if (rst = '1') then
            tempo_value <= "000";
        else
            if (tempo_value <= "101") then
                tempo_value <= tempo_value + 1;
                tempo <= '0';
            elsif ( tempo_value = "110" ) then
                tempo <= '1';
                tempo_value <= "000";
            end if;
        end if;
    end if;
end process;
end Behavioral;
