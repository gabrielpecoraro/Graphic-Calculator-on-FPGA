----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2023 07:06:08 PM
-- Design Name: 
-- Module Name: polynomial - Behavioral
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

entity polynomial is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           poly : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
end polynomial;

architecture Behavioral of polynomial is
signal x1 : signed( 5 downto 0) := (others => '0');
signal x2 : signed(11 downto 0);
signal ipoly : signed ( 6 downto 0);
signal i : integer range 0 to 3;
begin
calcul : process(clk)
    begin
        if (clk'event and clk = '1') then
            if (rst = '1' or signed(x)/=x1) then
                x1 <= signed(x);
                i <= 0;          
                valid <= '1';
                busy <= '0';
            elsif (rst = '0') then
                i <= 0;
                if ( i = 0) then
                    x1 <= signed(x);
                    valid <= '0';
                    busy <= '1';
                    i <= i + 1;
                elsif ( i = 1) then
                    x2 <= x1*x1;
                    valid <= '0';
                    busy <= '1';
                    i <= i + 1;
                elsif ( i = 2) then
                    ipoly <= x2(10 downto 4);
                    valid <= '0';
                    busy <= '1';
                    i <= i + 1;
                elsif (i = 3) then
                    if ( ipoly /= "1000000") then
                    poly <= std_logic_vector(ipoly(5 downto 0));
                    else
                    poly <= "111111";
                    i <= 0;
                    end if;
                end if;
            end if;
      end if;
end process;                                
end Behavioral;
