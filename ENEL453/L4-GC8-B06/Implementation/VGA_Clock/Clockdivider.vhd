----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - Clockdivider.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clockdivider is

	port( reset		 	 : in STD_LOGIC;
			clk 		 	 : in STD_LOGIC;
			onehertz	 	 : out STD_LOGIC;
			tenhertz	 	 : out STD_LOGIC;
			hundredhertz : out STD_LOGIC;
			kilohertz	 : out STD_LOGIC
		);

end clockdivider;

architecture Behavioral of clockdivider is

	component gencounter

		generic ( 	nbits	: positive := 4;
					divby	: positive := 10
				);

		port	(	reset	: in STD_LOGIC;
					clk 	: in STD_LOGIC;
					cEn 	: in STD_LOGIC;
					q		: out STD_LOGIC_VECTOR (nbits-1 downto 0);
					carry	: out STD_LOGIC
				);

	end component;

	signal carrybits:	STD_LOGIC_VECTOR(6 downto 0);

begin

	-- First divide by 25 Assuming 25Mhz
	div25: gencounter
		generic map(5, 25) port map(reset,clk,'1',open,carrybits(0));

	-- then divide by 10 six times  
    gendiv10e6: for k in 1 to 6 generate 
  		
  		div10: gencounter 
 			generic map(4,10) port map(reset,clk,carrybits(k-1),open,carrybits(k)); 
 	
 	end generate gendiv10e6; 
   
 	onehertz     <= carrybits(6); 
 	tenhertz     <= carrybits(5); 
 	hundredhertz <= carrybits(4); 
 	kilohertz    <= carrybits(3); 

end Behavioral;