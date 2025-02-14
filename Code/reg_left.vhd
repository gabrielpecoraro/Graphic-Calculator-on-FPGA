library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_left is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           left : in STD_LOGIC;
           clk_100 : in std_logic;
           s_left : out STD_LOGIC);
end reg_left;

architecture Behavioral of reg_left is
signal temp : std_logic;
begin
process(clk)
    begin
    if rising_edge(clk) then
        if(rst ='1') then
            s_left <= '0';
            temp <= '0';
        elsif(clk_100 ='1') then
            temp <= left;
            s_left <= (left xor temp) and left;
        end if;
end if;
end process;
end Behavioral;
