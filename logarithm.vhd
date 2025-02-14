----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2023 12:38:23 PM
-- Design Name: 
-- Module Name: logarithm - Behavioral
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

entity logarithm is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           log : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
end logarithm;

architecture Behavioral of logarithm is
signal i_x6 : signed(5 downto 0):=(others=>'0');-- création du signal sur 6 bits
signal i_x12 : signed (11 downto 0);-- création du signal au carré sur 12 bits
signal i_x18 : signed (17 downto 0);-- création du signal au cube sur 18 bits
signal ilog : signed(6 downto 0) := (others => '0');--valeur de log
signal i : integer range 0 to 5;-- nombre d'itérations dans la série entière
begin
stimulus :process(clk)
begin
if (clk'event and clk = '1') then
        if (rst = '1' or signed(x)/=i_x6) then
                     i_x6<=signed(x);
                     i <= 0;
                     busy <= '0';
                     valid <= '1';
        elsif(rst = '0') then
            i <= 0;
            if(i = 0) then
                i_x6 <= signed(x);
                i <= i + 1;
                busy <= '1';
                valid <= '0';
            elsif(i = 1) then
                i_x12<=i_x6*i_x6;
                i_x18<=i_x6*i_x6*i_x6;
                busy <= '1';
                valid <= '0';
                i <= i+1;
            elsif ( i = 2) then
                ilog(5 downto 0) <= i_x6;
                busy <= '1';
                valid <= '0';
                i <= i + 1;
            elsif (i = 3) then
                ilog <= ilog - i_x12(10 downto 4)/2;
                busy <= '1';
                valid <= '0';
                i <= i + 1;
            elsif ( i = 4) then
                if(signed(x) <= to_signed(-22,6) or signed(x) >= to_signed(-4,6)) then
                    ilog <= ilog + i_x18(15 downto 9)/3-to_signed(10,7);
                elsif ( signed(x) >= to_signed(-3,6) and signed(x) <= to_signed(11,6)) then
                    ilog <= ilog + i_x18(15 downto 9)/3-to_signed(5,7);
                elsif ( signed(x)< to_signed(-22,6) and signed(x) > to_signed(-26,6)) then
                    ilog <= ilog + i_x18(15 downto 9)/3 - to_signed(10,7);
                else
                    ilog <= (others => '0');
                end if;
                busy <= '1';
                valid <= '0';
                i <= i + 1;
            elsif ( i = 5) then
                log <= std_logic_vector(ilog(5 downto 0));           
                busy <= '0';
                valid <= '1';
                i <= 0;
            end if;
        end if;
    end if;
    end process;      
end Behavioral;
