library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_down is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           down : in STD_LOGIC;
           clk_100 : in std_logic;
           s_down : out STD_LOGIC);
end reg_down;

architecture Behavioral of reg_down is
signal temp : std_logic;
begin
process(clk)
    begin
    if rising_edge(clk) then
        if(rst ='1') then
            s_down <= '0';
            temp <= '0';
        elsif(clk_100 ='1') then
            temp <= down;
            s_down <= (down xor temp) and down;
        end if;
end if;
end process;
end Behavioral;
