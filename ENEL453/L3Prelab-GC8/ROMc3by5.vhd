----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - ROMc3by5.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROMc3by5 is

    Port ( dselect 	: in  STD_LOGIC_VECTOR (3 downto 0);
           dmap 		: out  STD_LOGIC_VECTOR (0 to 14)
			 );

end ROMc3by5;

architecture Behavioral of ROMc3by5 is

begin

	-- Select Character Map based on Number
	process(dselect) begin 

        case dselect is             

            when "0000" => dmap <= "111101101101111"; --0 
            when "0001" => dmap <= "010110010010111"; --1 
            when "0010" => dmap <= "111001111100111"; --2 
            when "0011" => dmap <= "111001111001111"; --3 
            when "0100" => dmap <= "101101111001001"; --4 
            when "0101" => dmap <= "111100110001110"; --5 
            when "0110" => dmap <= "011100111101111"; --6 
            when "0111" => dmap <= "110001001001001"; --7 
            when "1000" => dmap <= "111101111101111"; --8 
            when "1001" => dmap <= "111101111001001"; --9 
            when others => dmap <= "111100111100111"; --E for error 

        end case; 

    end process;

end Behavioral;

