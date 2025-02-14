----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2023 11:05:52 AM
-- Design Name: 
-- Module Name: multiplexeur_output - Behavioral
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

entity multiplexeur_output is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           x5 : in STD_LOGIC;
           x6 : in STD_LOGIC;
           x7 : in STD_LOGIC;
           x8 : in std_logic;
           adress : in STD_LOGIC_VECTOR(3 downto 0);
           x : out STD_LOGIC);
end multiplexeur_output;

architecture Behavioral of multiplexeur_output is
begin
process(x1,x2,x3,x4,x5,x6,x7,x8,adress) is
begin
if(adress = "0001") then
	x <= x1;
elsif(adress = "0010") then
	x <= x2;
elsif(adress = "0011") then
	x <= x3;
elsif(adress = "0100") then
	x <= x4;
elsif(adress = "0101") then
	x <= x5;
elsif(adress = "0111") then
	x <= x6;
elsif(adress = "1000") then
	x <= x7;
elsif ( adress = "1001") then
    x <= x8;
else
    x <= '0';
end if;
end process;
end Behavioral;
