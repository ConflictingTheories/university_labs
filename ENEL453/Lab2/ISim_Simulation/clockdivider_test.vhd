-- Testbench clockdivider
--
-- ENEL 453 Lab #2 - Prelab
--
-- Authors:		Kyle Derby MacInnis
--				Sajna Massey
--
-- Date: January 28, 2013

library IEEE;
use IEEE.STD_LOGIC_114.ALL;

--Testbench Entity
entity clockdivider_test is
end clockdivider_test;

--Testbench Initialization
architecture Behavioral of clockdivider_test is

-- Component to Test
	Component clockdivider

		port( 	reset		 : in STD_LOGIC;
				clk 		 : in STD_LOGIC;
				onehertz	 : out STD_LOGIC;
				tenhertz	 : out STD_LOGIC;
				hundredhertz : out STD_LOGIC;
				kilohertz	 : out STD_LOGIC
			);

	end Component;

-- Signals
	--Inputs
	signal reset 		: STD_LOGIC := '0';
	signal clk 			: STD_LOGIC := '0';

	--Outputs
	signal onehertz 	: STD_LOGIC := '0';
	signal tenhertz 	: STD_LOGIC := '0';
	signal hundredhertz : STD_LOGIC := '0';
	signal kilohertz 	: STD_LOGIC := '0';

-- Clock Period
	constant clk_period : TIME := 10 ns;

begin
--Instantiate UUT
UUT:	clockdivider
	port map (reset,clk,onehertz,tenhertz,hundredhertz,kilohertz);

--Clock Process
clk_process:	Process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end Process;

--Stimulus Process
stim_proc:	Process
begin
	--reset all signals
	reset <= '1';
	wait for clk_period*4;
	reset <= '0';
	wait;
end Process;

end Behavioral;