----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 09:47:22 AM
-- Design Name: 
-- Module Name: absolute - Behavioral
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

entity absolute is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           absol : out std_logic_vector( 5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
end absolute;

architecture Behavioral of absolute is
signal x_line : signed( 6 downto 0);
signal x_int : signed ( 5 downto 0) := (others => '0');
signal x_int2 : signed( 5 downto 0); 
signal i : integer range 0 to 4;
begin
process(clk)
begin
if (clk'event and clk = '1') then
    if (rst ='1' or signed(x) /= x_int) then
        x_int <= signed(x);
        i <= 0;
        valid <= '1';
        busy <= '0';
    elsif (rst ='0') then
        if (i = 0) then
            x_int <= signed(x);
            i <= i + 1;
        elsif (i = 1) then
            if ( signed(x) >= to_signed(0,6)) then
                x_line <= x_int + to_signed(0,7);
            elsif ( signed(x) < to_signed(0,6)) then
                x_line <= to_signed(0,7) - x_int;
            end if;
            busy <= '1';
            valid <= '0';
            i <= i + 1;
        elsif ( i = 2) then
            absol <= std_logic_vector(x_line( 5 downto 0));
            i<=0;
        end if;
    end if;
end if;
end process;     
end Behavioral;