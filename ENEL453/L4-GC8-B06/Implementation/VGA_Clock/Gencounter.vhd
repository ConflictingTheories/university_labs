----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - Gencounter.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Gencounter Entity Declaration
entity gencounter is

	generic	( 	nbits: positive:=4;
					divby: positive:=10 
			);

	port	( 	reset 	: in STD_LOGIC;
				clk		: in STD_LOGIC;
				cEn		: in STD_LOGIC;
				q		: out STD_LOGIC_VECTOR (nbits-1 downto 0);
				carry	: out STD_LOGIC
			);

end gencounter;

-- Gencounter Architecture Initialization
architecture Behavioral of gencounter is

	signal q_int: unsigned(nbits-1 downto 0);

begin

	q <= STD_LOGIC_VECTOR(q_int);

	process( reset, clk, cEN) begin

		if reset = '1' then
			q_int <= (others => '0');
			carry <= '0';
		elsif rising_edge(clk) then
			carry <= '0';
			if cEn = '1' then
				if q_int = (divby-1) then
					q_int <= (others => '0');
					carry <= '1';
				else
					q_int <= q_int+1;
				end if;
			end if;
		end if;
	
	end process;

end Behavioral;
			