library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_right is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           right : in STD_LOGIC;
           clk_100 : in std_logic;
           s_right : out STD_LOGIC);
end reg_right;

architecture Behavioral of reg_right is
signal temp : std_logic;
begin
process(clk)
    begin
    if rising_edge(clk) then
        if(rst ='1') then
            s_right <= '0';
            temp <= '0';
        elsif(clk_100 ='1') then
            temp <= right;
            s_right <= (right xor temp) and right;
        end if;
end if;
end process;
end Behavioral;
