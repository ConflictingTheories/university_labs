----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - VGA_Framebuffer.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_Framebuffer is
	 generic ( 	colorbits	:	positive	:= 8;
					xbits			:	positive	:= 10;
					ybits			:	positive	:= 9;
					pixelsinrow	:	positive	:= 640
				);

    Port ( clk 		: in  STD_LOGIC;
			  -- Reading
			  pixelin 	: in  STD_LOGIC_VECTOR (colorbits-1 downto 0);
           rxAddr 	: in  STD_LOGIC_VECTOR (xbits-1 downto 0);
           ryAddr 	: in  STD_LOGIC_VECTOR (ybits-1 downto 0);
           -- Writing
			  wxAddr 	: in  STD_LOGIC_VECTOR (xbits-1 downto 0);
           wyAddr 	: in  STD_LOGIC_VECTOR (ybits-1 downto 0);
           writeEn 	: in  STD_LOGIC;
           pixelout 	: out  STD_LOGIC_VECTOR (colorbits-1 downto 0)
			);

end VGA_Framebuffer;

architecture Behavioral of VGA_Framebuffer is
--INTERNAL SIGNALS
	
	signal intRlinearAddress:	STD_LOGIC_VECTOR(xbits+ybits-1 downto 0);
	signal intWlinearAddress:	STD_LOGIC_VECTOR(xbits+ybits-1 downto 0);
	
--INTERNAL COMPONENTS

	-- LINEAR ADDRESS GENERATOR
	component pixelAddressGenerator
	
	generic(		xbits			:	positive	:= 10;
					ybits			:	positive	:= 9;
					pixelsInRow	:	positive	:=	640
				);
		
    Port ( 		xAddress 		: in  STD_LOGIC_VECTOR (xbits-1 downto 0);
					yAddress 		: in  STD_LOGIC_VECTOR (ybits-1 downto 0);
					linearAddress 	: out  STD_LOGIC_VECTOR (xbits+ybits-1 downto 0)
			);
			
	end component;
	
	-- DUAL-PORT RAM
	component dualportRAM
	
	generic (	addressBits	:	positive	:= 8;
					dataBits		:	positive	:= 8
				);

    Port 	( 	clk 			 : in  STD_LOGIC;
					readAddress  : in  STD_LOGIC_VECTOR (addressBits-1 downto 0);
					writeAddress : in  STD_LOGIC_VECTOR (addressBits-1 downto 0);
					writeEn 		 : in  STD_LOGIC;
					dataIn 		 : in  STD_LOGIC_VECTOR (dataBits-1 downto 0);
					dataOut 		 : out  STD_LOGIC_VECTOR (dataBits-1 downto 0)
				);
	
	end component;

begin

	-- Read Address Generator
	readaddressgen:	pixelAddressGenerator
		generic map ( xbits, ybits, pixelsinrow )
		port map (rxAddr, ryAddr, intRlinearAddress);
	
	-- Write Address Generator
	writeaddressgen:	pixelAddressGenerator
		generic map ( xbits, ybits, pixelsinrow )
		port map (wxAddr, wyAddr, intWlinearAddress);
	
	-- RAM Block
	RAMUnit:	dualportRAM
		generic map ( xbits+ybits, colorbits )
		port map (clk, intRlinearAddress, intWlinearAddress, writeEn, pixelin, pixelout);

end Behavioral;

