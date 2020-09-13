----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/11/2020 09:01:20 PM
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
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

entity Clock_Divider is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_mod : out STD_LOGIC);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

signal ctr : integer;
signal clk_out : STD_LOGIC;

begin

process (clk, rst)
begin
    if (rst = '1') then
        ctr <= 0;
        clk_out <= '1';
    elsif (rising_edge(clk)) then
        if (ctr < 5) then
            ctr <= ctr + 1;
            clk_out <= clk_out;
        else
            ctr <= 0;
            clk_out <= not clk_out;
        end if;
    end if;
end process;

clk_mod <= clk_out; 

end Behavioral;
