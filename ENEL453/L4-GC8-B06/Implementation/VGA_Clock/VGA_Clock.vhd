----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - VGA_Clock.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_Clock is
    Port ( reset : in  STD_LOGIC;
           clk25 : in  STD_LOGIC;
           freqsel : in  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC);
end VGA_Clock;

architecture Behavioral of VGA_Clock is

--INTERNAL SIGNALS

	signal intKilo		:	STD_LOGIC;
	signal intwriteEn	:	STD_LOGIC;
	signal intMuxCtrl	:	STD_LOGIC_VECTOR(1 downto 0);
	signal intpxData	:	STD_LOGIC_VECTOR(2 downto 0);
	signal intxAddr	: 	STD_LOGIC_VECTOR(6 downto 0);
	signal intyAddr	:	STD_LOGIC_VECTOR(5 downto 0);
	signal intDmap		:	STD_LOGIC_VECTOR(0 to 14);
	signal intDsel		:	STD_LOGIC_VECTOR(3 downto 0);
	
--INTERNAL COMPONENTS

	--CHARACTER MAP ROM
	component ROMc3by5
	
		Port ( 	dselect 	: in  STD_LOGIC_VECTOR (3 downto 0);
					dmap 		: out  STD_LOGIC_VECTOR (14 downto 0)
				);
	
	end component;
	
	--CLOCK COUNTER
	component ClockCounter
	
		 Port ( muxCtrl : in  STD_LOGIC_VECTOR (1 downto 0);
           clk25 : in  STD_LOGIC;
           freqsel : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           muxedBCD : out  STD_LOGIC_VECTOR (3 downto 0);
           kilohertz : out  STD_LOGIC
			 );
			 
	end component;
	
	--DIGIT FSM
	component digitDrawFSM
	
		Port ( reset 		: in  STD_LOGIC;
				  clk 		: in  STD_LOGIC;
				  clkEn 		: in  STD_LOGIC;
				  digitsel 	: out  STD_LOGIC_VECTOR (1 downto 0);
				  digitmap 	: in  STD_LOGIC_VECTOR (14 downto 0);
				  xaddr 		: out  STD_LOGIC_VECTOR (6 downto 0);
				  yaddr 		: out  STD_LOGIC_VECTOR (5 downto 0);
				  pixeldata : out  STD_LOGIC_VECTOR (2 downto 0);
				  writeEn 	: out  STD_LOGIC
				 );
				 
	end component;
	
	--VGA DRIVER
	component VGA_Driver
		
		generic ( downsample : natural	:= 3 );
		
		 Port ( reset 		: in  STD_LOGIC;
				  clk 		: in  STD_LOGIC;
				  -- Pixel Settings
				  wxAddr 	: in  STD_LOGIC_VECTOR (9-downsample downto 0);
				  wyAddr 	: in  STD_LOGIC_VECTOR (8-downsample downto 0);
				  pixelin 	: in  STD_LOGIC_VECTOR (2 downto 0);
				  writeEn 	: in  STD_LOGIC;
				  -- VGA Interface
				  hsync 		: out  STD_LOGIC;
				  vsync 		: out  STD_LOGIC;
				  Red 		: out  STD_LOGIC_VECTOR (2 downto 0);
				  Green 		: out  STD_LOGIC_VECTOR (2 downto 0);
				  Blue 		: out  STD_LOGIC_VECTOR (1 downto 0)
				 );
			 
	end component;
	
begin

	-- Character Map ROM
	characterROM	:	ROMc3by5
		port map ( intDsel, intDmap );
		
	-- Digit Draw FSM
	digitDraw	:	digitdrawFSM
		port map ( reset, clk25, intKilo, intMuxCtrl, intDmap, intxAddr, intyAddr, intpxData, intwriteEn);
		
	-- Clock Counter
	clockdigits	:	ClockCounter
		port map ( intMuxCtrl, clk25, freqsel, reset, intDsel, intKilo);
		
	-- VGA Driver
	VGAdisplay:	VGA_driver
		generic map (3)
		port map ( reset, clk25, intxAddr, intyAddr, intpxData, intwriteEn, hsync, vsync, red, green, blue);

end Behavioral;

