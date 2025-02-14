----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2023 09:33:20 AM
-- Design Name: 
-- Module Name: projet - Behavioral
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

entity projet is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           SW0 : in STD_LOGIC;
           SW1 : in STD_LOGIC;
           SW2 : in STD_LOGIC;
           SW3 : in STD_LOGIC;
           SW4 : in STD_LOGIC;
           SW5 : in STD_LOGIC;
           SW6 : in STD_LOGIC;
           SW7 : in STD_LOGIC;
           tempo : in std_logic;
           function_value : out STD_LOGIC_VECTOR (5 downto 0);
           valid : out STD_LOGIC;
           busy : out STD_LOGIC);
end projet;

architecture Behavioral of projet is
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
 
component calculus is
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
end component;

component multiplexeur_function is
    Port ( x1 : in STD_LOGIC_VECTOR (5 downto 0);
           x2 : in STD_LOGIC_VECTOR (5 downto 0);
           x3 : in STD_LOGIC_VECTOR (5 downto 0);
           x4 : in STD_LOGIC_VECTOR (5 downto 0);
           x5 : in STD_LOGIC_VECTOR (5 downto 0);
           x6 : in STD_LOGIC_VECTOR (5 downto 0);
           x7 : in STD_LOGIC_VECTOR (5 downto 0);
           x8 : in std_logic_vector (5 downto 0);
           adress : in STD_LOGIC_VECTOR (3 downto 0);
           x : out STD_LOGIC_VECTOR (5 downto 0));
end component;
           
component multiplexeur_output is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           x5 : in STD_LOGIC;
           x6 : in STD_LOGIC;
           x7 : in STD_LOGIC;
           x8 : in std_logic;
           adress : in STD_LOGIC_VECTOR(3 downto 0);
           x : out STD_LOGIC);
end component;

signal s_choice : std_logic_vector(3 downto 0);
signal xlinear    : std_logic_vector (5 downto 0);
signal xpoly      : std_logic_vector (5 downto 0);
signal xabsol     : std_logic_vector (5 downto 0);
signal xarcsin    : std_logic_vector (5 downto 0);
signal xexp       : std_logic_vector (5 downto 0);
signal xlogarithm : std_logic_vector (5 downto 0);
signal xcosinepp  : std_logic_vector (5 downto 0);
signal valid1     : std_logic;
signal busy1      : std_logic;
signal valid2     : std_logic;
signal busy2      : std_logic;
signal valid3     : std_logic;
signal busy3      : std_logic;
signal valid4     : std_logic;
signal busy4      : std_logic;
signal valid5     : std_logic;
signal busy5      : std_logic;
signal valid6     : std_logic;
signal busy6      : std_logic;
signal valid7     : std_logic;
signal busy7      : std_logic;

begin
adressage : FSM_select
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
          
functions : calculus
    port map(clk        => clk,
              rst        => rst,
              SW0 => SW0,
              SW1 => SW1,
              SW2 => SW2,
              SW3 => SW3,
              SW4 => SW4,
              SW5 => SW5,
              SW6 => SW6,
              SW7 => SW7,
              tempo => tempo,
              xlinear    => xlinear,
              xpoly      => xpoly,
              xabsol     => xabsol,
              xarcsin    => xarcsin,
              xexp       => xexp,
              xlogarithm => xlogarithm,
              xcosinepp  => xcosinepp,
              valid1     => valid1,
              busy1      => busy1,
              valid2     => valid2,
              busy2      => busy2,
              valid3     => valid3,
              busy3      => busy3,
              valid4     => valid4,
              busy4      => busy4,
              valid5     => valid5,
              busy5      => busy5,
              valid6     => valid6,
              busy6      => busy6,
              valid7     => valid7,
              busy7      => busy7);
              
              
value_assignement : multiplexeur_function
    port map(x1 => xlinear,
             x2 => xpoly,
             x3 => xabsol,
             x4 => xarcsin,
             x5 => xexp,
             x6 => xcosinepp,
             x7 => xlogarithm,
             x8 => "111111",
             adress => s_choice,
             x => function_value);

valid_assignement : multiplexeur_output
    port map(x1 => valid1,
             x2 => valid2,
             x3 => valid3,
             x4 => valid4,
             x5 => valid5,
             x6 => valid6,
             x7 => valid7,
             x8 => '1',
             adress => s_choice,
             x => valid);
             
             
busy_assignement : multiplexeur_output
    port map(x1 => busy1,
             x2 => busy2,
             x3 => busy3,
             x4 => busy4,
             x5 => busy5,
             x6 => busy6,
             x7 => busy7,
             x8 => '1',
             adress => s_choice,
             x => busy);
end Behavioral;
