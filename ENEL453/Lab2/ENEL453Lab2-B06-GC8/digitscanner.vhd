-- digitscanner.vhd
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

entity digitscanner is 

	port 	(	reset 		: in STD_LOGIC;
				clk			: in STD_LOGIC;
				cEn			: in STD_LOGIC;
				anodeCtrl 	: out STD_LOGIC_VECTOR(3 downto 0);
				muxCtrl 	: out STD_LOGIC_VECTOR(1 downto 0)
			);

end digitscanner;

architecture Behavioral of digitscanner is

  	signal count2bit : unsigned(1 downto 0); 

begin 

  	muxCtrl <= std_logic_vector(count2bit); 

	process(count2bit) begin 

  		case count2bit is 

    		when "00" => anodeCtrl <= "1110"; 
    		when "01" => anodeCtrl <= "1101"; 
    		when "10" => anodeCtrl <= "1011"; 
   		 	when "11" => anodeCtrl <= "0111"; 
    		when others => anodeCtrl <= "1111"; 

  		end case; 

	end process; 

	process(reset,clk,cEn) begin 

  		if reset='1' then  
    		count2bit <= "00"; 
  		elsif rising_edge(clk) and cEn='1' then 
    		count2bit <= count2bit + 1; 
  		end if; 

	end process; 

end Behavioral;