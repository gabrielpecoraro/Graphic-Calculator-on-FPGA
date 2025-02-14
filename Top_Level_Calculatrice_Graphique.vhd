----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2023 11:50:16
-- Design Name: 
-- Module Name: Top_Level_Calculatrice_Graphique - Behavioral
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

entity Top_Level_Calculatrice_Graphique is
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
           right : in std_logic;
           left : in std_logic;
           down : in std_logic;
           up : in std_logic;
           PMOD_CS      : out STD_LOGIC;
           PMOD_MOSI    : out STD_LOGIC;
           PMOD_SCK     : out STD_LOGIC;
           PMOD_DC      : out STD_LOGIC;
           PMOD_RES     : out STD_LOGIC;
           PMOD_VCCEN   : out STD_LOGIC;
           PMOD_EN      : out STD_LOGIC);
end Top_Level_Calculatrice_Graphique;

architecture Behavioral of Top_Level_Calculatrice_Graphique is

component projet is
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
end component;

component Waiting_in_vain is
    Port (  clk : in std_logic ;
            rst : in std_logic ;
            x : in  STD_LOGIC_VECTOR(5 downto 0);
            s_background : in std_logic_vector (3 downto 0);
            s_color : in std_logic_vector (1 downto 0);
            ready : in std_logic:='0';
            sample :out STD_LOGIC_VECTOR(5 downto 0);
            sample_en  : out  STD_LOGIC;
            sample_num   : out  STD_LOGIC_VECTOR(1 downto 0);
            disp_shift   : out  STD_LOGIC;                    -- enables the display shift
            back_grad    : out  STD_LOGIC_vector(3 downto 0)
           );
end component ;

component PmodOLEDrgb_sigplot is
    Generic (CLK_FREQ_HZ : integer := 100000000;        -- by default, we run at 100MHz
             PARAM_BUFF  : boolean := False;            -- should parameters be bufferized
             MAX_ON_TOP  : boolean := False;             -- max value is on top of the screen, min value is below.
             LEFT_SIDE   : boolean := False);           -- True if the Pmod is on the left side of the board
    Port (clk          : in  STD_LOGIC;
          reset        : in  STD_LOGIC;

          sample       : in  STD_LOGIC_VECTOR(5 downto 0); -- the value of the new sample
          sample_en    : in  STD_LOGIC;                    -- enable bit for the new sample
          sample_num   : in  STD_LOGIC_VECTOR(1 downto 0); -- the curve considered
          
          disp_shift   : in  STD_LOGIC;                    -- enables the display shift
          back_grad    : in  STD_LOGIC_vector(3 downto 0):="0000"; -- a grey level to eventually provide graduation
          
          ready        : out STD_LOGIC;                    -- commands can only be sent if ready = '1'.
          
          PMOD_CS      : out STD_LOGIC;
          PMOD_MOSI    : out STD_LOGIC;
          PMOD_SCK     : out STD_LOGIC;
          PMOD_DC      : out STD_LOGIC;
          PMOD_RES     : out STD_LOGIC;
          PMOD_VCCEN   : out STD_LOGIC;
          PMOD_EN      : out STD_LOGIC);
end component;

component tb_color is
    Port (clk : in std_logic;
          rst : in std_logic;
          left : in std_logic;
          right : in std_logic;
          clk_100 : in std_logic;
          s_color : out std_logic_vector(1 downto 0));
end component;

component clock_100 is
    generic (
        DIV_FACTOR : natural := 10  -- The factor by which to slow down the clock
    );
    port (
        clk : in STD_LOGIC;  -- The input clock
        rst : in STD_LOGIC;  -- The reset signal
        clk_out : out STD_LOGIC  -- The output (slowed down) clock
    );
end component;

component tl_background is
    Port (clk : in std_logic;
          rst : in std_logic;
          up : in std_logic;
          down : in std_logic;
          clk_100 : in std_logic;
          s_back : out std_logic_vector(3 downto 0));
end component;


signal s_function_value : std_logic_vector (5 downto 0);
signal s_valid : std_logic;
signal s_busy : std_logic;
signal s_ready : std_logic;
signal s_sample : std_logic_vector (5 downto 0);
signal s_sample_en :std_logic;
signal s_sample_num :std_logic_vector (1 downto 0);
signal s_disp_shift : std_logic;
signal s_back_ground : std_logic_vector (3 downto 0);
signal s_color : std_logic_vector (1 downto 0);
signal s_clk_grandma : std_logic;
signal s_back : std_logic_vector(3 downto 0);
begin

dut : projet
    port map (clk            => clk,
              rst            => rst,
              SW0            => SW0,
              SW1            => SW1,
              SW2            => SW2,
              SW3            => SW3,
              SW4            => SW4,
              SW5            => SW5,
              SW6            => SW6,
              SW7            => SW7,
              tempo          => s_sample_en,
              function_value => s_function_value,
              valid          => s_valid,
              busy           => s_busy);

display : PmodOLEDrgb_sigplot
generic map(CLK_FREQ_HZ => 100000000,        -- by default, we run at 100MHz
             PARAM_BUFF => True,             -- should parameters be bufferized
             MAX_ON_TOP => True)             -- max value is on top of the screen, min value is below.
    
    port map( clk => clk,
              reset => rst,
              
              sample => s_sample,
              sample_en => s_sample_en,
              sample_num => s_sample_num,
              
              disp_shift => s_disp_shift,
              back_grad => "0000",
              
              ready => s_ready,
              
              PMOD_CS => PMOD_CS,
              PMOD_MOSI => PMOD_MOSI,
              PMOD_SCK => PMOD_SCK,
              PMOD_DC => PMOD_DC,
              PMOD_RES => PMOD_RES,
              PMOD_VCCEN => PMOD_VCCEN,
              PMOD_EN => PMOD_EN);      
   
waiti : Waiting_in_vain
    port map( clk => clk,
              rst => rst,
              x => s_function_value,
              s_background => s_back,
              s_color => s_color,
              ready => s_ready,
              sample => s_sample,
              sample_en => s_sample_en,
              sample_num => s_sample_num,
              disp_shift => s_disp_shift,
              back_grad => s_back_ground);

top_level_color : tb_color
    port map(clk => clk,
             rst => rst,
             left => left,
             right => right,
             clk_100 => s_clk_grandma,
             s_color => s_color);
             
othe_clk : clock_100
    generic map(DIV_FACTOR => 10)
    port map(clk => clk,
             rst => rst,
             clk_out => s_clk_grandma);
             
top_level : tl_background
    port map( clk => clk,
              rst => rst,
               up => up,
              down => down,
              clk_100 => s_clk_grandma,
              s_back => s_back);
          
end Behavioral;
