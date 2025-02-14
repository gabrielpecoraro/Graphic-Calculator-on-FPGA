----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2023 22:32:53
-- Design Name: 
-- Module Name: Waiting_in_vain - Behavioral
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

entity Waiting_in_vain is
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
end Waiting_in_vain;

architecture Behavioral of Waiting_in_vain is
signal n_ena : std_logic_vector (5 downto 0):=(others=>'0');
signal i : std_logic :='0'; --Pemet d'envoyer les fichiers que sur une p?riode d'horloge
signal mem : integer range 0 to 210;-- nombre d'itérations dans la série entière
signal j : std_logic :='0';
signal mem_back : std_logic_vector (3 downto 0):=s_background;
signal mem_color : std_logic_vector (1 downto 0):=s_color;
begin
process(clk)
    begin
        if (clk'event and clk='1') then
            if ((rst='1' or mem_back/=s_background or mem_color/=s_color)) then
                sample<="000000";
                sample_en<='0';
                sample_num<=s_color;
                disp_shift<='0';
                mem_back<=s_background;
                back_grad<=s_background;
                mem_color<=s_color;
                i<='0';
                mem<=0;
            elsif(mem=85) then
                sample<="000000";
                sample_en<='0';
                sample_num<=s_color;
                disp_shift<='0';
                back_grad<=s_background;
                i<='0';
            elsif(ready='1' and i='0') then
                sample_en<='1';
                sample<=x;
                disp_shift<='1';
                sample_num<=s_color;
                back_grad<=s_background;
                i<='1';
                mem<=mem+1;
           elsif(ready='0') then
                sample_en<='0';
                sample<=x;
                disp_shift<='0';
                sample_num<=s_color;
                back_grad<=s_background;
                i<='0';
            elsif(i='1') then
                sample_en<='0';
                sample<=x;
                disp_shift<='0';
                sample_num<=s_color;
                back_grad<=s_background;
                end if;
         end if;
    end process;
end Behavioral;


