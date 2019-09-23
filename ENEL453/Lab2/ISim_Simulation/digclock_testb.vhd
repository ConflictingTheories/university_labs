--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:40:43 01/29/2013
-- Design Name:   
-- Module Name:   H:/ENEL453/Lab2/ISim_Simulation/digclock_testb.vhd
-- Project Name:  ISim_Simulation
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clocksystem
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY digclock_testb IS
END digclock_testb;
 
ARCHITECTURE behavior OF digclock_testb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clocksystem
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         freqsel : IN  std_logic;
         anodeCtrl : OUT  std_logic_vector(3 downto 0);
         LEDsegments : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal freqsel : std_logic := '0';

 	--Outputs
   signal anodeCtrl : std_logic_vector(3 downto 0);
   signal LEDsegments : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clocksystem PORT MAP (
          reset => reset,
          clk => clk,
          freqsel => freqsel,
          anodeCtrl => anodeCtrl,
          LEDsegments => LEDsegments
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      reset <= '1';
		
		wait for clk_period*10;
		
		reset <= '0';
	
		wait for clk_period*10;
		
		freqsel <= '1';
	
		wait for clk_period*10;
		
		freqsel <= '0'; 

      wait;
   end process;

END;
