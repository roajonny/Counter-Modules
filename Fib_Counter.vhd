----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2020 09:53:45 PM
-- Design Name: 
-- Module Name: Fib_Counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Fib_Counter is
    Port ( clk, rst, pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end Fib_Counter;

architecture Behavioral of Fib_Counter is
signal a, b, c: integer range 0 to 255;
signal ctr : integer range 0 to 255;
constant num_terms : integer := 50;

begin
process(clk, rst)
begin
    if(rst = '1') then
        b <= 1;
        c <= 0;
        ctr <= 0;
    elsif (rising_edge(clk) and ctr < num_terms) then
        c <= b;
        b <= a;
        ctr <= ctr + 1;
    end if;
    a <= b + c;
end process;
q <= STD_LOGIC_VECTOR(to_unsigned(c, 8));

end Behavioral;
