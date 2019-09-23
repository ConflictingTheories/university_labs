----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - dualportRAM.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dualportRAM is

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
				
end dualportRAM;

architecture Behavioral of dualportRAM is
	
	-- RAM Type Declaration (An Array of 2**addressBits Words which are 3 bits each)
	type RAM is array( 0 to 2**addressBits-1 ) of STD_LOGIC_VECTOR(databits-1 downto 0);

	-- RAM Block for Storage
	signal RAMBlock : RAM;

begin

	-- Syncronous Read/Write
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (writeEn = '1') then
			-- Write Input Data to RAM (At Specified "Write" Address)
				RAMBlock(to_integer(unsigned(writeAddress))) <= dataIn;
			end if;
			-- Read output Data from RAM (At Specified "Read" Address)
			dataOut <= RAMBlock(to_integer(unsigned(readAddress)));
		end if;
	end process;
	
end Behavioral;

