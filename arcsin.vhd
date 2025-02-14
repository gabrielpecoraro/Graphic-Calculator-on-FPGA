----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 06:45:09 PM
-- Design Name: 
-- Module Name: arcsin - Behavioral
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

entity arcsin is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           arcsine : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
end arcsin;

architecture Behavioral of arcsin is
signal i_x6 : signed(5 downto 0);
signal i_x18 : signed(17 downto 0);
signal i_x30 : signed(29 downto 0);
signal iarcsin : signed(6 downto 0);
signal i : integer range 0 to 4; 
begin
process(clk)
begin
if (clk'event and clk = '1') then
    if (rst = '1' or signed(x)/=i_x6) then
        i_x6 <= signed(x);
        i <= 0;
        valid <= '1';
        busy <= '0';
    else if (rst = '0') then
        if (i = 0) then
            i_x6 <= signed(x);
            i_x18 <= i_x6*i_x6*i_x6;
            i_x30 <= i_x18*i_x6*i_x6;
            valid <= '0';
            busy <= '1';
            i <= i + 1;
        elsif ( i = 1) then
            if (i_x6 >= to_signed(-25,6) and i_x6 <= to_signed(24,6)) then
                iarcsin(5 downto 0) <= i_x6;
            else
                iarcsin <= (others => '0');
            end if;
            valid <= '0';
            busy <= '1';
            i <= i + 1;
        elsif ( i = 2) then
            if (i_x6 >= to_signed(-25,6) and i_x6 <= to_signed(24,6)) then
                iarcsin <= iarcsin + i_x18(15 downto 9)/6;
            else
                iarcsin <= (others => '0');
            end if;
            valid <= '0';
            busy <= '1';
            i <= i + 1;
        elsif ( i = 3) then
            if (i_x6 >= to_signed(-20,6) and i_x6 <= to_signed(10,6)) then
                iarcsin <= iarcsin + i_x30(26 downto 20)/40-to_signed(22,7);
            elsif ( i_x6 = to_signed(-21,6))then
                iarcsin <= to_signed(19,7);
            elsif (i_x6 = to_signed(-22,6)) then
                iarcsin <= to_signed(18,7);
            elsif ( i_x6 = to_signed(-23,6)) then
                iarcsin <= to_signed(16,7);
            elsif (i_x6 = to_signed(-24,6)) then
                iarcsin <= to_signed(13,7);
            elsif (i_x6 = to_signed(-25,6)) then
                iarcsin <= to_signed(9,7);
            elsif (i_x6 = to_signed(-26,6)) then
                iarcsin <= to_signed(1,7);
            elsif ( i_x6 = to_signed(11,6)) then
                iarcsin <= to_signed(53,7);
            elsif ( i_x6 = to_signed(12,6)) then
                iarcsin <= to_signed(55,7);
            elsif (i_x6 = to_signed(13,6)) then
                iarcsin <= to_signed(58,7);
            elsif (i_x6 = to_signed(14,6)) then
                iarcsin <= to_signed(62,7);
            else      
                iarcsin <= (others => '0');
            end if;
            valid <= '0';
            busy <= '1';
            i <= i + 1;
       elsif ( i = 4) then
            arcsine <= std_logic_vector(iarcsin(5 downto 0));
            valid <= '1';
            busy <= '0';
            i <= 0;
       end if;
    end if;
    end if;
end if;
end process;
end Behavioral;
