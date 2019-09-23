-- digitclock60min.vhd
--
-- ENEL 453 Lab #2 - Prelab
--
-- Authors:		Kyle Derby MacInnis
--				Sajna Massey
--
-- Date: January 28, 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Clocksystem Circuit Declaration
entity clocksystem is 

	port 	(	reset		: in STD_LOGIC;
				clk 		: in STD_LOGIC;
				freqsel 	: in STD_LOGIC;
				anodeCtrl 	: out STD_LOGIC_VECTOR(3 downto 0);
				LEDsegments : out STD_LOGIC_VECTOR(6 downto 0)
			);

end clocksystem;

architecture Behavioral of clocksystem is

	-- Clock Divider Component Declaration
	component clockdivider

	port( 	reset		 : in STD_LOGIC;
			clk 		 : in STD_LOGIC;
			onehertz	 : out STD_LOGIC;
			tenhertz	 : out STD_LOGIC;
			hundredhertz : out STD_LOGIC;
			kilohertz	 : out STD_LOGIC
		);

	end component;

	-- min60sec60 component Declaration
	component min60sec60

		port(	reset 		: in  STD_LOGIC; 
          	clk   		: in  STD_LOGIC; 
        		cEn   		: in STD_LOGIC; 
           	carry	 		: out  STD_LOGIC;
           	digit0		: out STD_LOGIC_VECTOR(3 downto 0);
				digit1		: out STD_LOGIC_VECTOR(3 downto 0);
				digit2		: out STD_LOGIC_VECTOR(3 downto 0);
				digit3		: out STD_LOGIC_VECTOR(3 downto 0)
            );

	end component;

	-- Digitmux Component Declaration
	component digitmux

		port(	digit0		: in STD_LOGIC_VECTOR(3 downto 0);
				digit1		: in STD_LOGIC_VECTOR(3 downto 0);
				digit2		: in STD_LOGIC_VECTOR(3 downto 0);
				digit3		: in STD_LOGIC_VECTOR(3 downto 0);
				muxCtrl 	: in STD_LOGIC_VECTOR(1 downto 0);
				outdigit	: out STD_LOGIC_VECTOR( 3 downto 0)
			);


	end component;

	-- Digitscanner Component Declaration
	component digitscanner

		port (reset 		: in STD_LOGIC;
				clk			: in STD_LOGIC;
				cEn			: in STD_LOGIC;
				anodeCtrl 	: out STD_LOGIC_VECTOR(3 downto 0);
				muxCtrl 		: out STD_LOGIC_VECTOR(1 downto 0)
			);

	end	component;

	-- BCDtoSeg Component Declaration
	component BCDto7seg

		port(   BCDdigit    	: in STD_LOGIC_VECTOR(3 downto 0);
              SevenSeg   	: out STD_LOGIC_VECTOR(6 downto 0)
            );

	end component;

	-- Temp and Internal Signals
	signal temp_dig0		: STD_LOGIC_VECTOR(3 downto 0);
	signal temp_dig1		: STD_LOGIC_VECTOR(3 downto 0);
	signal temp_dig2		: STD_LOGIC_VECTOR(3 downto 0);
	signal temp_dig3		: STD_LOGIC_VECTOR(3 downto 0);
	signal temp_muxctrl 	: STD_LOGIC_VECTOR(1 downto 0);
	signal temp_bcdseg	: STD_LOGIC_VECTOR(3 downto 0);
	signal temp_10hz	: STD_LOGIC;
	signal temp_1hz 	: STD_LOGIC;
	signal temp_khz		: STD_LOGIC;
	signal temp_100hz : STD_LOGIC;
	signal clkenable	: STD_LOGIC;


begin

	-- Clock Frequency Selector
	clkenable <= temp_10hz when freqsel = '1' else temp_1hz;

	-- Port Mapped Components
	clkdiv:	clockdivider
		port map (reset, clk, temp_1hz, temp_10hz, temp_100hz, temp_khz);

	minsec60: min60sec60
		port map (reset, clk, clkenable, open, temp_dig0, temp_dig1, temp_dig2, temp_dig3);

	digsel:	digitmux
		port map (temp_dig0, temp_dig1, temp_dig2, temp_dig3, temp_muxctrl, temp_bcdseg);

	BCDdec:	BCDto7seg
		port map (temp_bcdseg, LEDsegments);

	digitCtrl: digitscanner
		port map (reset, clk, temp_khz, anodeCtrl, temp_muxctrl);

end Behavioral;