----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - ClockCounter.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockCounter is
    
	 Port ( muxCtrl : in  STD_LOGIC_VECTOR (1 downto 0);
           clk25 : in  STD_LOGIC;
           freqsel : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           muxedBCD : out  STD_LOGIC_VECTOR (3 downto 0);
           kilohertz : out  STD_LOGIC
			 );

end ClockCounter;

architecture Behavioral of ClockCounter is
	
-- INTERNAL SIGNALS
	signal clkenable: STD_LOGIC;
	signal intOneHz:	STD_LOGIC;
	signal intTenHz:	STD_LOGIC;
	signal intDig0:	STD_LOGIC_VECTOR(3 downto 0);
	signal intDig1:	STD_LOGIC_VECTOR(3 downto 0);
	signal intDig2:	STD_LOGIC_VECTOR(3 downto 0);
	signal intDig3:	STD_LOGIC_VECTOR(3 downto 0);
	
-- INTERNAL COMPONENTS

	--MINUTE/SECOND COUNTER
	component min60sec60
	
		port(	reset 		: in  STD_LOGIC; 
				clk   		: in  STD_LOGIC; 
				cEn   		: in 	STD_LOGIC; 
				carry	 		: out STD_LOGIC;
				digit0		: out STD_LOGIC_VECTOR(3 downto 0);
				digit1		: out STD_LOGIC_VECTOR(3 downto 0);
				digit2		: out STD_LOGIC_VECTOR(3 downto 0);
				digit3		: out STD_LOGIC_VECTOR(3 downto 0)
			);
	
	end component;
	
	--CLOCK DIVIDER
	component clockdivider
	
		port( reset		 : in STD_LOGIC;
				clk 		 : in STD_LOGIC;
				onehertz	 : out STD_LOGIC;
				tenhertz	 : out STD_LOGIC;
				hundredhertz : out STD_LOGIC;
				kilohertz	 : out STD_LOGIC
			);
	
	end component;
	
	--DIGIT SELECTOR
	component digitmux
	
		port(	digit0		: in STD_LOGIC_VECTOR(3 downto 0);
				digit1		: in STD_LOGIC_VECTOR(3 downto 0);
				digit2		: in STD_LOGIC_VECTOR(3 downto 0);
				digit3		: in STD_LOGIC_VECTOR(3 downto 0);
				muxCtrl 		: in STD_LOGIC_VECTOR(1 downto 0);
				outdigit		: out STD_LOGIC_VECTOR( 3 downto 0)
			);
	
	end component;
	
begin

	-- Determine Frequency of Clock Counter
	clkenable <= intTenHz when freqsel = '1' else intOneHz;

	-- Clock Counter
	minsec60:	min60sec60
		port map(reset, clk25, clkenable, open, intDig0, intDig1, intDig2, intDig3);

	-- Clock Divider
	clkdiv:	clockdivider
		port map(reset, clk25, intOneHz, intTenHz, open, kilohertz);
		
	-- Digit Selector
	digitsel:	digitmux
		port map(intDig0, intDig1, intDig2, intDig3, muxCtrl, muxedBCD);
		
end Behavioral;

