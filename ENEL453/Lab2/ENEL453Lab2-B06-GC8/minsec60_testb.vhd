--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:42:14 01/29/2013
-- Design Name:   
-- Module Name:   H:/ENEL453/Lab2/ISim_Simulation/minsec60_testb.vhd
-- Project Name:  ISim_Simulation
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: min60sec60
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
 
ENTITY minsec60_testb IS
END minsec60_testb;
 
ARCHITECTURE behavior OF minsec60_testb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT min60sec60
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         cEn : IN  std_logic;
         carry : OUT  std_logic;
         digit0 : OUT  std_logic_vector(3 downto 0);
         digit1 : OUT  std_logic_vector(3 downto 0);
         digit2 : OUT  std_logic_vector(3 downto 0);
         digit3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal cEn : std_logic := '0';

 	--Outputs
   signal carry : std_logic;
   signal digit0 : std_logic_vector(3 downto 0);
   signal digit1 : std_logic_vector(3 downto 0);
   signal digit2 : std_logic_vector(3 downto 0);
   signal digit3 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: min60sec60 PORT MAP (
          reset => reset,
          clk => clk,
          cEn => cEn,
          carry => carry,
          digit0 => digit0,
          digit1 => digit1,
          digit2 => digit2,
          digit3 => digit3
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

      -- insert stimulus here 

      wait;
   end process;

END;
