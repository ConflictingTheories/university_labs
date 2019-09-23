--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:39:28 01/29/2013
-- Design Name:   
-- Module Name:   H:/ENEL453/Lab2/ISim_Simulation/clockdivider_testb.vhd
-- Project Name:  ISim_Simulation
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clockdivider
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
 
ENTITY clockdivider_testb IS
END clockdivider_testb;
 
ARCHITECTURE behavior OF clockdivider_testb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clockdivider
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         onehertz : OUT  std_logic;
         tenhertz : OUT  std_logic;
         hundredhertz : OUT  std_logic;
         kilohertz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal onehertz : std_logic;
   signal tenhertz : std_logic;
   signal hundredhertz : std_logic;
   signal kilohertz : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clockdivider PORT MAP (
          reset => reset,
          clk => clk,
          onehertz => onehertz,
          tenhertz => tenhertz,
          hundredhertz => hundredhertz,
          kilohertz => kilohertz
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
		
      wait;
   end process;

END;
