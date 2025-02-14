----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2023 01:18:32 PM
-- Design Name: 
-- Module Name: calculus - Behavioral
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

entity calculus is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           SW0 : in std_logic;
           SW1 : in std_logic;  
           SW2 : in std_logic;
           SW3 : in std_logic;
           SW4 : in std_logic;
           SW5 : in std_logic;
           SW6 : in std_logic;
           SW7 : in std_logic;
           tempo : in std_logic;
           xlinear : out STD_LOGIC_VECTOR (5 downto 0);
           xpoly : out STD_LOGIC_VECTOR (5 downto 0);
           xabsol : out STD_LOGIC_VECTOR (5 downto 0);
           xarcsin : out STD_LOGIC_VECTOR (5 downto 0);
           xexp : out STD_LOGIC_VECTOR (5 downto 0);
           xlogarithm : out STD_LOGIC_VECTOR (5 downto 0);
           xcosinepp : out STD_LOGIC_VECTOR (5 downto 0);
           valid1 : out STD_LOGIC;
           busy1 : out STD_LOGIC;
           valid2 : out STD_LOGIC;
           busy2 : out STD_LOGIC;
           valid3 : out STD_LOGIC;
           busy3 : out STD_LOGIC;
           valid4 : out STD_LOGIC;
           busy4 : out STD_LOGIC;
           valid5 : out STD_LOGIC;
           busy5 : out STD_LOGIC;
           valid6 : out STD_LOGIC;
           busy6 : out STD_LOGIC;
           valid7 : out STD_LOGIC;
           busy7 : out STD_LOGIC);
end calculus;

architecture Behavioral of calculus is
component FSM_select is
    Port( clk : in std_logic;
          rst : in std_logic;
          SW0 : in std_logic;
          SW1 : in std_logic;
          SW2 : in std_logic;
          SW3 : in std_logic;
          SW4 : in std_logic;
          SW5 : in std_logic;
          SW6 : in std_logic;
          SW7 : in std_logic;
          choice : out std_logic_vector(3 downto 0)
          );
 end component;
 
component counter_manager is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           tempo : out STD_LOGIC);
end component;

component x_counter_fsm is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           e_SW : in std_logic_vector(3 downto 0);
           tempo : in std_logic;
           x : out STD_LOGIC_VECTOR (5 downto 0));
end component;


component linear is
Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           x_out : out std_logic_vector ( 5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);          
end component;

component polynomial is
Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
        x : in STD_LOGIC_VECTOR (5 downto 0);
        poly : out std_logic_vector ( 5 downto 0);
        valid : out STD_LOGIC;
        busy : out STD_LOGIC);          
end component;

component absolute is
Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           absol : out std_logic_vector ( 5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
           
end component;

component arcsin is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (5 downto 0);
           arcsine : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC; -- Quand on a fini
           busy : out STD_LOGIC); -- Quand on est en train de calculer
end component;

component expo is
    Port ( x : in STD_LOGIC_VECTOR (5 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           exp : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC; -- Quand on a fini
           busy : out STD_LOGIC); -- Quand on est en train de calculer
end component;

component logarithm is
Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
        x : in STD_LOGIC_VECTOR (5 downto 0);
        log : out std_logic_vector ( 5 downto 0);
        valid : out STD_LOGIC;
        busy : out STD_LOGIC);          
end component;

component cosinepp is
    Port ( x : in STD_LOGIC_VECTOR (5 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cosine : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC; -- Quand on a fini
           busy : out STD_LOGIC); -- Quand on est en train de calculer
end component;

signal s_x : std_logic_vector ( 5 downto 0);
signal s_tempo : std_logic;
signal s_choice : std_logic_vector(3 downto 0); 
begin

manage1 : FSM_select
    port map(clk => clk,
             rst => rst,
             SW0 => SW0,
             SW1 => SW1,
             SW2 => SW2,
             SW3 => SW3,
             SW4 => SW4,
             SW5 => SW5,
             SW6 => SW6,
             SW7 => SW7,
             choice => s_choice);

manage2 : counter_manager
    port map(clk => clk,
             rst => rst,
             tempo => s_tempo);
                          
count : x_counter_fsm
    port map ( clk => clk,
               rst => rst,
               e_SW => s_choice,
               tempo => tempo,
               x => s_x);       
uut : linear
    port map(clk => clk,
             rst => rst,
             x => s_x,
             x_out => xlinear,
             valid => valid1,
             busy => busy1);

square : polynomial
    port map(x => s_x,
             clk => clk,
             rst => rst,
             poly => xpoly,
             valid => valid2,
             busy => busy2);
             
absoluty : absolute
    port map(clk => clk,
             rst => rst,
             x => s_x,
             absol => xabsol,
             valid => valid3,
             busy => busy3);
             
bijection : arcsin
    port map(clk => clk,
             rst => rst,
             x => s_x,
             arcsine => xarcsin,
             valid => valid4,
             busy => busy4); 
             
trigo : cosinepp
    port map(x => s_x,
             clk => clk,
             rst => rst,
             cosine => xcosinepp,
             valid => valid5,
             busy => busy5);
             
exponetial : expo
    port map(x => s_x,
             clk => clk,
             rst => rst,
             exp => xexp,
             valid => valid6,
             busy => busy6); 
             
             
neperian : logarithm
    port map(x => s_x,
             clk => clk,
             rst => rst,
             log => xlogarithm,
             valid => valid7,
             busy => busy7);
end Behavioral;
