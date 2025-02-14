library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_FSM_background is
end tb_FSM_background;

architecture tb of tb_FSM_background is
    component FSM_background
        port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               up : in STD_LOGIC;
               down : in STD_LOGIC;
               s_background : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal clk : STD_LOGIC;
    signal rst : STD_LOGIC;
    signal up : STD_LOGIC;
    signal down : STD_LOGIC;
    signal s_background : STD_LOGIC_VECTOR (3 downto 0);

    constant TbPeriod : time := 1000 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin
    dut : FSM_background
    port map (clk => clk, rst => rst, up => up, down => down, s_background => s_background);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    clk <= TbClock;

    stimuli : process
    begin
        -- Initialization
        up <= '0';
        down <= '0';

        -- Reset generation
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        -- Add stimuli here
        up <= '1'; -- Set up to 1
        wait for 10000 ns;
        up <= '0'; -- Set up back to 0

        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;
end tb;