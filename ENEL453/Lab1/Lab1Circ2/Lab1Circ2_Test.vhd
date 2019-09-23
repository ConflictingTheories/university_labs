--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:44 01/18/2013
-- Design Name:   
-- Module Name:   H:/ENEL453/Lab1Circ2/Lab1Circ2_Test.vhd
-- Project Name:  Lab1Circ2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seqCirc
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
 
ENTITY Lab1Circ2_Test IS
END Lab1Circ2_Test;
 
ARCHITECTURE behavior OF Lab1Circ2_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seqCirc
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         enable : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seqCirc PORT MAP (
          reset => reset,
          clk => clk,
          enable => enable,
          A => A,
          B => B,
          Z => Z
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
			-- reset all signals
			reset <= '1';
			wait for clk_period*4;
			reset <= '0';
			wait for clk_period*2;
			A <= '1';
			wait for clk_period*2;
			B <= '1';
			wait for clk_period*2;
			enable <='1';
			wait for clk_period*10;
			enable <='0';
			wait for clk_period*2;
			B <= '0';
			wait; -- this statement blocks the process forever
	end process;

END;
