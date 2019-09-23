----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - digitdrawFSM.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity digitdrawFSM is

    Port ( reset 		: in  STD_LOGIC;
           clk 		: in  STD_LOGIC;
           clkEn 		: in  STD_LOGIC;
           digitsel 	: out  STD_LOGIC_VECTOR (1 downto 0);
           digitmap 	: in  STD_LOGIC_VECTOR (0 to 14);
           xaddr 		: out  STD_LOGIC_VECTOR (6 downto 0);
           yaddr 		: out  STD_LOGIC_VECTOR (5 downto 0);
           pixeldata : out  STD_LOGIC_VECTOR (2 downto 0);
           writeEn 	: out  STD_LOGIC
			 );

end digitdrawFSM;

architecture Behavioral of digitdrawFSM is

-- STATE TYPE DECLARATION
	type digitstates is (minute1,minute0,colon,second1,second0);

-- ORDERED PAIR TYPE DECLARATION
	type orderedpair is array(0 to 1) of integer range 0 to 79;
	
-- CONSTANTS
	
	-- Colon Character Map 
	constant colondmap :	STD_LOGIC_VECTOR(0 to 14) := "000010000010000";
	
	-- Positional Ranges for Digits
	constant minute1position	:	orderedpair	:= (15,30);
	constant minute0position	:	orderedpair	:=	(20,35);
	constant colonposition		:	orderedpair	:= (25,40);
	constant second1position	:	orderedpair	:= (30,45);
	constant second0position	:	orderedpair	:= (35,50);

-- INTERNAL SIGNALS
	
	--State Variable
	signal digitstate			:	digitstates;
	signal nextdigitstate	:	digitstates;
	
	--Digit Position
	signal digitpos	:	orderedpair;
	
	--Pixel Colour
	signal pixelcolor	:	STD_LOGIC_VECTOR(2 downto 0);
	
	--Character Map
	signal intDigitmap	: STD_LOGIC_VECTOR(0 to 14);
	
	--Character Offsets
	signal xoffsetcount	: integer range 0 to 2;
	signal yoffsetcount	: integer range 0 to 4;
	
begin

	-- Read from ROM unless colon
	intDigitmap <= colondmap when digitstate = colon else digitmap;

	-- Print out only pixels which form characters, else black
	pixeldata <= pixelcolor when intDigitmap(xoffsetcount+yoffsetcount*3)='1' else "000";

	--Calculate Position and store in vector
	yaddr <= STD_LOGIC_VECTOR(to_unsigned(digitpos(0)+yoffsetcount,6));
	xaddr <= STD_LOGIC_VECTOR(to_unsigned(digitpos(1)+xoffsetcount,7));


--ITERATE THROUGH CHARACTER MAP
	process(reset, clk, clkEn)
	begin

		if reset='1' then
			digitstate <= minute1;
			xoffsetcount <= 0;
			yoffsetcount <= 0;
		elsif rising_edge(clk) then
			if clkEn='1' then
				writeEn <= '1';
				--Print Horizontal Character Map Pixels
				if xoffsetcount<2 then
					xoffsetcount <= xoffsetcount+1;
				
				--Move to Next Line if Finished
				else
					xoffsetcount <= 0;
					if yoffsetcount <4 then
						yoffsetcount 	<= yoffsetcount+1;
						
					-- If Finished Character, Change State
					else
						yoffsetcount 	<= 0;
						digitstate 		<= nextdigitstate;
					end if;
				end if;
			else	
				writeEn <= '0';
			end if;
		end if;
	end process;

--DIGIT FSM PROCESS
	process(digitstate)
	begin
		
		--STATE MACHINE DECLARATION
		case digitstate is
		
			-- MINUTE (TENS) (_X:XX)
			when minute1 =>
				nextdigitstate <= minute0;
				digitpos <= minute1position;
				digitsel <= "11";
				pixelcolor <= "011";
			
			-- MINUTE (ONES) (X_:XX)
			when minute0 =>
				nextdigitstate <= colon;
				digitpos <= minute0position;
				digitsel <= "10";
				pixelcolor <= "110";
			
			-- COLON (XX_XX)
			when colon =>
				nextdigitstate <= second1;
				digitpos <= colonposition;
				digitsel <= "01";
				pixelcolor <= "111";
			
			-- SECOND (TENS) (XX:_X)
			when second1 =>
				nextdigitstate <= second0;
				digitpos <= second1position;
				digitsel <= "01";
				pixelcolor <= "101";
				
			-- SECOND (ONES) (XX:X_)
			when second0 =>
				nextdigitstate <= minute1;
				digitpos <= second0position;
				digitsel <= "00";
				pixelcolor <= "100";
		
		end case;
		
	end process;
	
end Behavioral;