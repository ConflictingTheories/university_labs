----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - VGA_driver.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_driver is
	 
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
			 
end VGA_driver;

architecture Behavioral of VGA_driver is

-- INTERNAL SIGNALS

	--Down-Sampled pixel
	signal pixelout 	: std_logic_vector(2 downto 0);
	--VGA color Bits
	signal intRed 		: std_logic_vector(2 downto 0);
	signal intGreen	: std_logic_vector(2 downto 0);
	signal intBlue 	: std_logic_vector(1 downto 0);
	--Down-Sampled Pixel Address
	signal ryaddr 		: std_logic_vector(9-downsample-1 downto 0);
	signal rxaddr 		: std_logic_vector(10-downsample-1 downto 0);
	--Actual Pixel Position
	signal haddr 		: std_logic_vector(9 downto 0);
	signal vaddr 		: std_logic_vector(9 downto 0);
	--Blanking Signal
	signal blanking 	: std_logic;

-- INTERNAL COMPONENTS

	-- VGA FRAMEBUFFER
	component VGA_FrameBuffer
	
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
		
	end component;
	
	-- VGA SYNC GENERATOR
	component VGA_SyncGen
	
		Port( reset 	: in  STD_LOGIC;
				clk25 	: in  STD_LOGIC;
				Hsync 	: out  STD_LOGIC;
				Vsync 	: out  STD_LOGIC;
				Blanking : out  STD_LOGIC;
				Haddress : out STD_LOGIC_VECTOR (9 downto 0);
				Vaddress : out STD_LOGIC_VECTOR (9 downto 0)
			);
	
	end component;
	
	-- VGA COLOR KILLER
	component colorKiller
	
		Port (	-- Inputs
					B_in		: in STD_LOGIC_VECTOR(1 downto 0);
					G_in		: in STD_LOGIC_VECTOR(2 downto 0);
					R_in		: in STD_LOGIC_VECTOR(2 downto 0);
					Blanking	: in STD_LOGIC;
					-- Outputs
					B_out		: out STD_LOGIC_VECTOR(1 downto 0);
					G_out		: out STD_LOGIC_VECTOR(2 downto 0);
					R_out		: out STD_LOGIC_VECTOR(2 downto 0)
				);
	
	end component;

begin

	-- Calculate Downsampled Position
	ryaddr <= vaddr(8 downto downsample);
	rxaddr <= haddr(9 downto downsample);
	
	-- Calculate Downsampled Color
	intRed 	<= pixelout(2) & pixelout(2) & pixelout(2);
	intGreen <= pixelout(1) & pixelout(1) & pixelout(1);
	intBlue	<= pixelout(0) & pixelout(0);
	
	-- VGA Frame Buffer
	framebuffer :	VGA_FrameBuffer
		generic map (3, 10-downsample, 9-downsample, 640/(2**downsample))
		port map (clk, pixelin, rxaddr, ryaddr, wxaddr, wyaddr, writeEn, pixelout);
	
	-- VGA Sync Generator
	syncgen	:	VGA_SyncGen
		port map (reset, clk, hsync, vsync, blanking, haddr, vaddr);
	
	-- VGA Colour Killer
	colourkill : colorKiller
		port map (intBlue, intGreen, intRed, blanking, Blue, Green, Red);
	
end Behavioral;

