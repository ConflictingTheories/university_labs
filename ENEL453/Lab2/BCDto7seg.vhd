-- BCDto7seg.vhd
--
-- ENEL 453 Lab #2 - Prelab
--
-- Authors:     Kyle Derby MacInnis
--              Sajna Massey
--
-- Date: January 28, 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCDto7seg is

    port    (   BCDdigit    : in STD_LOGIC_VECTOR(3 downto 0);
                SevenSeg    : out STD_LOGIC_VECTOR(6 downto 0)
            );

end BCDto7seg;

architecture Behavioral of BCDto7seg is

begin 

    process(BCDdigit) begin 

        case BCDdigit is            --  6543210 

            when "0000" => SevenSeg <= "1000000"; --0 
            when "0001" => SevenSeg <= "1111001"; --1 
            when "0010" => SevenSeg <= "0100100"; --2 
            when "0011" => SevenSeg <= "0110000"; --3 
            when "0100" => SevenSeg <= "0011001"; --4 
            when "0101" => SevenSeg <= "0010010"; --5 
            when "0110" => SevenSeg <= "0000010"; --6 
            when "0111" => SevenSeg <= "1111000"; --7 
            when "1000" => SevenSeg <= "0000000"; --8 
            when "1001" => SevenSeg <= "0010000"; --9 
            when others => SevenSeg <= "0000110"; --E for error 

        end case; 

    end process; 

end Behavioral;