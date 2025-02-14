----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2023 14:17:13
-- Design Name: 
-- Module Name: tb_color - Behavioral
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

entity tb_color is
    Port (clk : in std_logic;
          rst : in std_logic;
          left : in std_logic;
          right : in std_logic;
          clk_100 : in std_logic;
          s_color : out std_logic_vector(1 downto 0));
end tb_color;

architecture Behavioral of tb_color is

component reg_right is
    Port(clk : in std_logic;
         rst : in std_logic;
         right : in std_logic;
         clk_100 : in std_logic;
         s_right : out std_logic);
end component;

component reg_left is
    Port(clk : in std_logic;
         rst : in std_logic;
         left : in std_logic;
         clk_100 : in std_logic;
         s_left : out std_logic);
end component;

component FSM_color
    Port( clk : in std_logic;
          rst : in std_logic;
          left : in std_logic;
          right : in std_logic;
          clk_100 : in std_logic;
          s_color : out std_logic_vector (1 downto 0));
end component;

signal s_right : std_logic;
signal s_left : std_logic;

begin

register_right : reg_right
    port map (clk => clk,
              rst => rst,
              right => right,
              clk_100 => clk_100,
              s_right => s_right);
    

register_left : reg_left
    port map (clk => clk,
              rst => rst,
              left => left,
              clk_100 => clk_100, 
              s_left => s_left);
              
FSM_colorus : fsm_color
    port map (clk => clk,
              rst => rst,
              left => s_left,
              right => s_right,
              clk_100 => clk_100,
              s_color => s_color);

end Behavioral;
