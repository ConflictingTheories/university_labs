----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - min60sec60.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity min60sec60 is

	port(	reset 		: in  STD_LOGIC; 
         clk   		: in  STD_LOGIC; 
        	cEn   		: in 	STD_LOGIC; 
         carry	 		: out STD_LOGIC;
         digit0		: out STD_LOGIC_VECTOR(3 downto 0);
			digit1		: out STD_LOGIC_VECTOR(3 downto 0);
			digit2		: out STD_LOGIC_VECTOR(3 downto 0);
			digit3		: out STD_LOGIC_VECTOR(3 downto 0)
           	
        );

end min60sec60;

architecture Behavioral of min60sec60 is

 	component gencounter  
    
    	generic	( 	nbits: positive:=4; 
             		divby: positive:=10
             	); 
    
    	port	(	reset : in  STD_LOGIC; 
           		clk   : in  STD_LOGIC; 
           		cEn   : in STD_LOGIC; 
           		q     : out  STD_LOGIC_VECTOR (nbits-1 downto 0); 
           		carry : out  STD_LOGIC
           	); 
 
 	end component; 
 
 	signal c_int: std_logic_vector(3 downto 0); 

begin 
 	
 	carry <= c_int(3);

 	digit1(3) <= '0'; 
 	
 	digit3(3) <= '0'; 
 	
 	sec0: gencounter  
 		generic map(4,10) 
 		port map(reset, clk, cEn, digit0, c_int(0)); 
 
 	sec1: gencounter  
 		generic map(3,6)   
 		port map(reset, clk, c_int(0), digit1(2 downto 0), c_int(1)); 
 
 	min0: gencounter  
 		generic map(4,10)  
 		port map(reset, clk, c_int(1), digit2, c_int(2)); 
 
 	min1: gencounter  
 		generic map(3,6)   
 		port map(reset, clk, c_int(2), digit3(2 downto 0), c_int(3)); 
  
end Behavioral;