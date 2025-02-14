----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 04:49:13 PM
-- Design Name: 
-- Module Name: cosinepp - Behavioral
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

entity cosinepp is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           cosine : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
end cosinepp;

architecture Behavioral of cosinepp is
signal i_x : signed(5 downto 0);
signal icos : unsigned(5 downto 0) := "000000";
signal i : integer range 0 to 2;
begin
process(clk)
begin
if (clk'event and clk ='1') then
    if (rst = '1') then
        icos <= to_unsigned(31,6);
        i_x <= signed(x);
        i <= 0;
    elsif (rst = '0') then
        if ( i = 0) then
            i_x <= signed(x);
            valid <= '0';
            busy <= '1';
            i <= i + 1;
        elsif ( i = 1) then
            if (i_x = to_signed(-32,6) or i_x = to_signed(0,6)) then
                icos <= to_unsigned(31,6);
            elsif (i_x = to_signed(-31,6) or i_x = to_signed(-1,6)) then
                icos <= to_unsigned(37,6);
            elsif (i_x= to_signed(-30,6) or i_x = to_signed(-2,6)) then
                icos <= to_unsigned(39,6);
            elsif (i_x= to_signed(-29,6) or i_x = to_signed(-3,6)) then
                icos <= to_unsigned(43,6);
            elsif (i_x= to_signed(-28,6) or i_x= to_signed(-4,6)) then
                icos <= to_unsigned(45,6);
            elsif (i_x= to_signed(-27,6) or i_x= to_signed(-5,6)) then
                icos <= to_unsigned(49,6);
            elsif (i_x= to_signed(-26,6) or i_x= to_signed(-6,6)) then
                icos <= to_unsigned(52,6);
            elsif (i_x= to_signed(-25,6) or i_x= to_signed(-7,6)) then
                icos <= to_unsigned(54,6);
            elsif (i_x= to_signed(-24,6) or i_x= to_signed(-8,6)) then
                icos <= to_unsigned(56,6);
            elsif (i_x = to_signed(-23,6) or i_x = to_signed(-9,6)) then
                icos <= to_unsigned(58,6);
            elsif (i_x = to_signed(-22,6) or i_x = to_signed(-10,6)) then
                icos <= to_unsigned(59,6);
            elsif (i_x = to_signed(-21,6) or i_x = to_signed(-11,6)) then
                icos <= to_unsigned(60,6);
            elsif (i_x = to_signed (-20,6) or i_x = to_signed(-12,6)) then
                icos <= to_unsigned(61,6);
            elsif (i_x = to_signed(-19,6) or i_x = to_signed(-13,6)) then
                icos <= to_unsigned(62,6);
            elsif (i_x = to_signed(-18,6) or i_x = to_signed(-14,6)) then
                icos <= to_unsigned(63,6);
            elsif (i_x = to_signed(-17,6) or i_x = to_signed(-15,6)) then
                icos <= to_unsigned(63,6);
            elsif (i_x = to_signed(-16,6)) then
                icos <= to_unsigned(63,6);
            elsif (i_x = to_signed(31,6) or i_x = to_signed(1,6)) then
                icos <= to_unsigned(25,6);
            elsif (i_x= to_signed(30,6) or i_x = to_signed(2,6)) then
                icos <= to_unsigned(23,6);
            elsif (i_x= to_signed(29,6) or i_x = to_signed(3,6)) then
                icos <= to_unsigned(19,6);
            elsif (i_x= to_signed(28,6) or i_x= to_signed(4,6)) then
                icos <= to_unsigned(15,6);
            elsif (i_x= to_signed(27,6) or i_x= to_signed(5,6)) then
                icos <= to_unsigned(12,6);
            elsif (i_x= to_signed(26,6) or i_x= to_signed(6,6)) then
                icos <= to_unsigned(10,6);
            elsif (i_x= to_signed(25,6) or i_x= to_signed(7,6)) then
                icos <= to_unsigned(8,6);
            elsif (i_x= to_signed(24,6) or i_x= to_signed(8,6)) then
                icos <= to_unsigned(7,6);
            elsif (i_x = to_signed(23,6) or i_x = to_signed(9,6)) then
                icos <= to_unsigned(6,6);
            elsif (i_x = to_signed(22,6) or i_x = to_signed(10,6)) then
                icos <= to_unsigned(6,6);
            elsif (i_x = to_signed(21,6) or i_x = to_signed(11,6)) then
                icos <= to_unsigned(5,6);
            elsif (i_x = to_signed (20,6) or i_x = to_signed(12,6)) then
                icos <= to_unsigned(3,6);
            elsif (i_x = to_signed(19,6) or i_x = to_signed(13,6)) then
                icos <= to_unsigned(2,6);
            elsif (i_x = to_signed(18,6) or i_x = to_signed(14,6)) then
                icos <= to_unsigned(1,6);
            elsif (i_x = to_signed(17,6) or i_x = to_signed(15,6)) then
                icos <= to_unsigned(0,6);
            elsif (i_x = to_signed(16,6)) then
                icos <= to_unsigned(0,6);
            else 
                icos <= to_unsigned(31,6);
            end if;
            valid <= '0';
            busy <= '1';
            i <= i + 1;
        elsif ( i = 2) then      
            cosine <= std_logic_vector(icos);
            valid <= '1';
            busy <= '0';
            i <= 0;
        end if;
    end if;
end if;
end process; 
end Behavioral;
