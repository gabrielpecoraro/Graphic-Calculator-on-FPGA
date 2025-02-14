----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2023 14:58:43
-- Design Name: 
-- Module Name: grand_ma_clock - Behavioral
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

entity clock_100 is
    generic (
        DIV_FACTOR : natural := 10  -- The factor by which to slow down the clock
    );
    port (
        clk : in STD_LOGIC;  -- The input clock
        rst : in STD_LOGIC;  -- The reset signal
        clk_out : out STD_LOGIC  -- The output (slowed down) clock
    );
end clock_100;

architecture Behavioral of clock_100 is
    signal counter : natural := 0;
    signal s_clk_out : std_logic :='0';
begin
    process(clk)
    begin
        if (clk'event and clk='0') then
            if rst = '1' then
                counter <= 0;
                clk_out <= '0';
                s_clk_out <='0';
            elsif s_clk_out = '1' then
                s_clk_out <= not s_clk_out;
            elsif counter = DIV_FACTOR - 1 then
                counter <= 0;
                s_clk_out <= not s_clk_out;  -- Toggle the output clock
            else
                counter <= counter + 1;
            end if;
        end if;
    clk_out<=s_clk_out;
    end process;
end Behavioral;