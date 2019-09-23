----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - pixelAddressGenerator.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pixelAddressGenerator is
	 
	 	generic(	xbits			:	positive	:= 10;
					ybits			:	positive	:= 9;
					pixelsInRow	:	positive	:=	640
				);
		
    	Port ( 		xAddress 		: in  STD_LOGIC_VECTOR (xbits-1 downto 0);
					yAddress 		: in  STD_LOGIC_VECTOR (ybits-1 downto 0);
					linearAddress 	: out  STD_LOGIC_VECTOR (xbits+ybits-1 downto 0)
			);
			
end pixelAddressGenerator;

architecture Behavioral of pixelAddressGenerator is

begin

	-- Calculate Linear Address for Pixels (Unsigned Arithmetic)
	linearAddress <= STD_LOGIC_VECTOR(unsigned(xAddress)+unsigned(yAddress)*to_unsigned(pixelsInRow,xbits));

end Behavioral;

