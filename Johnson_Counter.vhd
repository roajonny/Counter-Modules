----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2020 07:06:26 PM
-- Design Name: 
-- Module Name: Johnson_Counter - Behavioral
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

entity Johnson_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end Johnson_Counter;

architecture Behavioral of Johnson_Counter is
signal cnt : STD_LOGIC_VECTOR (7 downto 0);

begin

process (clk, rst)
begin
    if (rst = '1') then
        cnt <= (others => '0');
    elsif (pause = '1') then
        cnt <= cnt;
    elsif (rising_edge(clk) and clk = '1') then
        cnt(1) <= cnt(0);
        cnt(2) <= cnt(1);
        cnt(3) <= cnt(2);
        cnt(4) <= cnt(3);
        cnt(5) <= cnt(4);
        cnt(6) <= cnt(5);
        cnt(7) <= cnt(6);
        cnt(0) <= not cnt(7);
    end if;
end process;
q (7 downto 0) <= cnt(7 downto 0);

end Behavioral;
