
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Level is
 Port (clk : in STD_LOGIC;
       pause : in STD_LOGIC;
       rst : in STD_LOGIC;
       sel : in STD_LOGIC_VECTOR (2 downto 0);
       q : out STD_LOGIC_VECTOR (7 downto 0)
       );
 
end Top_Level;

architecture Behavioral of Top_Level is

component Clock_Divider is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_mod : out STD_LOGIC);
end component;

component Binary_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Johnson_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Gray_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Ring_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Fib_Counter is
    Port ( clk, rst, pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk_int, pause_int, rst_int : STD_LOGIC;
signal BCD_out, J_out, G_out, R_out, F_out : STD_LOGIC_VECTOR (7 downto 0);

begin

-- internal global signals
pause_int <= pause;
rst_int <= rst;

-- 100 MHz -> 1 Hz clock-divider instantiation
Clock_Mod: Clock_Divider
port map (clk => clk, rst => rst_int, clk_mod => clk_int);

-- counter instantiations, maps to global signals and output-specific signals
BCD: Binary_Counter
port map (clk => clk_int, rst => rst_int, pause => pause_int, q => BCD_out);

J: Johnson_Counter
port map (clk => clk_int, rst => rst_int, pause => pause_int, q => J_out);

G: Gray_Counter
port map (clk => clk_int, rst => rst_int, pause => pause_int, q => G_out);

R: Ring_Counter
port map (clk => clk_int, rst => rst_int, pause => pause_int, q => R_out);

F: Fib_Counter
port map (clk => clk_int, rst => rst_int, pause => pause_int, q => F_out);

--multiplexing the counter outputs to the LEDs' bus
with sel select
      q <= BCD_out when "000",
           J_out when "001",
           G_out when "010",
           R_out when "011",
           F_out when "100",
           (others => '0') when others;

end Behavioral;
