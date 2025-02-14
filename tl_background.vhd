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

entity tl_background is
    Port (clk : in std_logic;
          rst : in std_logic;
          up : in std_logic;
          down : in std_logic;
          clk_100 : in std_logic;
          s_back : out std_logic_vector(3 downto 0));
end tl_background;

architecture Behavioral of tl_background is

component reg_down is
    Port(clk : in std_logic;
         rst : in std_logic;
         down : in std_logic;
         clk_100 : in std_logic;
         s_down : out std_logic);
end component;

component reg_up is
    Port(clk : in std_logic;
         rst : in std_logic;
         up : in std_logic;
         clk_100 : in std_logic;
         s_up : out std_logic);
end component;

component FSM_background
    Port( clk : in std_logic;
          rst : in std_logic;
          up : in std_logic;
          down : in std_logic;
          clk_100 : in std_logic;
          s_back : out std_logic_vector (3 downto 0));
end component;

signal s_down : std_logic;
signal s_up : std_logic;

begin

register_down : reg_down
    port map (clk => clk,
              rst => rst,
              down => down,
              clk_100 => clk_100,
              s_down => s_down);
    

register_up : reg_up
    port map (clk => clk,
              rst => rst,
              up => up,
              clk_100 => clk_100, 
              s_up => s_up);
              
FSM_colorus : fsm_background
    port map (clk => clk,
              rst => rst,
              up => s_up,
              down => s_down,
              clk_100 => clk_100,
              s_back => s_back);

end Behavioral;