----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2020 08:22:35 PM
-- Design Name: 
-- Module Name: Gray_Counter - Behavioral
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

entity Gray_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end Gray_Counter;

architecture Behavioral of Gray_Counter is
signal cnt : unsigned(7 downto 0) := (others => '0');
begin

process (clk, rst)
    begin
        if (rst = '1') then
            cnt <= (others => '0');
        elsif (pause = '1') then
            cnt <= cnt;
        elsif (clk' event and clk = '1') then
            if (cnt < 256) then
                cnt <= cnt + 1;
            else
                cnt <= (others => '0');
            end if;
        end if;
end process;
q <= STD_LOGIC_VECTOR(cnt) xor STD_LOGIC_VECTOR(('0' & cnt(7 downto 1)));
end Behavioral;
