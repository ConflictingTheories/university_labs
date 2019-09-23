----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - ROMc3by5_Test.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

 
ENTITY ROMc3by5_Test IS
END ROMc3by5_Test;
 
ARCHITECTURE behavior OF ROMc3by5_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROMc3by5
    PORT(
         dselect : IN  std_logic_vector(3 downto 0);
         dmap : OUT  std_logic_vector(0 to 14)
        );
    END COMPONENT;
    

   --Inputs
   signal dselect : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal dmap : std_logic_vector(0 to 14);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROMc3by5 PORT MAP (
          dselect => dselect,
          dmap => dmap
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- Zero
      dselect <= "0000";
		wait for 100 ns;
		
		-- One	
      dselect <= "0001" ;
		wait for 100 ns;
		
		-- Two
      dselect <="0010" ;
		wait for 100 ns;
		
		-- Three
      dselect <="0011" ;
		wait for 100 ns;
		
		-- Four
      dselect <="0100" ;
		wait for 100 ns;
		
		-- Five
      dselect <="0101" ;
		wait for 100 ns;
		
		-- Six
      dselect <="0110" ;
		wait for 100 ns;
		
		-- Seven
      dselect <="0111" ;
		wait for 100 ns;
		
		-- Eight
      dselect <="1000" ;
		wait for 100 ns;
		
		-- Nine
      dselect <="1001" ;
		wait for 100 ns;
		
		-- Others (ie. Error)
      dselect <="1010";
		wait for 100 ns;
		dselect <="1011";
		wait for 100 ns;
		dselect <="1100";
		wait for 100 ns;
		dselect <="1101";
		wait for 100 ns;
		dselect <="1110";
		wait for 100 ns;
		dselect <="1111";
		wait;
      
   end process;

END;
