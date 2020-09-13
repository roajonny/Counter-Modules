----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2020 05:30:36 PM
-- Design Name: 
-- Module Name: Binary_Counter - Behavioral
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

entity Binary_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end Binary_Counter;

architecture Behavioral of Binary_Counter is
signal cnt : unsigned (7 downto 0) :=  (others => '0');

begin
    process(clk, rst)
    begin
        if (rst = '1') then
                cnt <= (others => '0');    
        elsif (pause = '1') then
                cnt <= cnt;
        elsif (rising_edge(clk) and clk = '1') then
            if (cnt < 256) then
                cnt <= cnt + 1;
            else
                cnt <= (others => '0');
            end if;
        end if;
    end process;
    
q <= std_logic_vector(cnt);
end Behavioral;
