-- Company:
-- Engineer:
-- 
-- Create Date: 11/06/2023 10:43:26 AM
-- Design Name:
-- Module Name: compteur_test - Behavioral
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

entity expo is
     Port ( x : in STD_LOGIC_VECTOR (5 downto 0);
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            exp : out STD_LOGIC_VECTOR (5 downto 0);
            valid : out STD_LOGIC; -- Quand on a fini
            busy : out STD_LOGIC); -- Quand on est en train de calculer
end expo;

architecture Behavioral of expo is
signal i_x6 : signed(5 downto 0):=(others=>'0');-- création du signal sur 6 bits
signal i_x12 : signed (11 downto 0);-- création du signal au carré sur 12 bits
signal i_x18 : signed (17 downto 0);-- création du signal au cube sur 18 bits
signal iexp : signed(6 downto 0);--valeur de exp
signal i : integer range 0 to 5;-- nombre d'itérations dans la série entière
begin
counter:process(clk)
         begin
         if (clk'event and clk = '1') then
                if ( signed(x) <= 26) then
                    if (rst = '1' or signed(x)/=i_x6) then
                         i_x6<=signed(x);
                         i <= 0;
                         busy <= '0';
                         valid <= '1';
                     elsif(rst = '0') then
                             if(i = 0) then
                                 i_x12<=i_x6*i_x6;
                                 i_x18<=i_x6*i_x6*i_x6;
                                 i <= i+1;
                             elsif(i = 1) then
                                 iexp <= TO_SIGNED(32,7);-- affectation de 1 = 32
                                 busy <= '1';
                                 valid <= '0';
                                 i <= i + 1;
                             elsif (i = 2) then
                                 iexp <= iexp + i_x6;--Premier terme
                                 busy <= '1';
                                 valid <= '0';
                                 i <= i + 1;
                             elsif ( i = 3 ) then
                                 iexp <= iexp + i_x12(10 downto 4)/2;--Deuxième terme avec troncage i.e. i_x12/32
                                 busy <= '1';
                                 valid <= '0';
                                 i <= i + 1;
                             elsif ( i = 4 ) then
                                 iexp <= iexp + i_x18(15 downto 9)/6;--Troisième terme avec troncage par 1024 i.e. i_x18/1024
                                 busy <= '1';
                                 valid <= '1';
                                 i<=i+1;
                             elsif ( i = 5 ) then
                                 exp <= std_logic_vector(iexp(5 downto 0)-to_signed(20,6));
                                 i<=0;
                             end if;
                         end if;
                      else
                        exp <= "000000";  
                      end if;
                    end if;
           end process;
end Behavioral;
