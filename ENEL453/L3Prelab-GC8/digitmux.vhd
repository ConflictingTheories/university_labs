----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - digitmux.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity digitmux is

	port	(	digit0		: in STD_LOGIC_VECTOR(3 downto 0);
				digit1		: in STD_LOGIC_VECTOR(3 downto 0);
				digit2		: in STD_LOGIC_VECTOR(3 downto 0);
				digit3		: in STD_LOGIC_VECTOR(3 downto 0);
				muxCtrl 	: in STD_LOGIC_VECTOR(1 downto 0);
				outdigit	: out STD_LOGIC_VECTOR( 3 downto 0)
			);

end digitmux;


architecture Behavioral of digitmux is 
begin 
process(digit0,digit1,digit2,digit3,muxCtrl) 
begin 
  case muxCtrl is 
    when "00" => outdigit <= digit0; 
    when "01" => outdigit <= digit1; 
    when "10" => outdigit <= digit2; 
    when "11" => outdigit <= digit3; 
    when others => outdigit <= "1111"; 
  end case; 
end process; 
end Behavioral;