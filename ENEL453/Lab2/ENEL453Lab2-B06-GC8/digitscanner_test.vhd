-- Testbench Digit Scanner
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
entity digitscanner_test is
end digitscanner_test;

--Testbench Initialization
architecture Behavioral of digitscanner_test is

-- Component to Test
	Component digitscanner

		port (	reset 		: in STD_LOGIC;
				clk			: in STD_LOGIC;
				cEn			: in STD_LOGIC;
				anodeCtrl 	: out STD_LOGIC_VECTOR(3 downto 0);
				muxCtrl 	: out STD_LOGIC_VECTOR(1 downto 0)
			);

	end Component;

-- Signals
	--Inputs
	signal reset 		: STD_LOGIC := '0';
	signal clk 			: STD_LOGIC := '0';
	signal cEn 			: STD_LOGIC := '0';

	--Outputs
	signal anodeCtrl 	: STD_LOGIC_VECTOR(3 downto 0);
	signal muxCtrl 		: STD_LOGIC_VECTOR(1 downto 0);

-- Clock Period
	constant clk_period : TIME := 10 ns;

begin
--Instantiate UUT
UUT:	digitscanner 
	port map (reset,clk,cEn,anodeCtrl,muxCtrl);

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
	wait for clk_period*2;
	cEn <= '1';
	wait for clk_period*2;
	cEn <= '0';
	wait;
end Process;

end Behavioral;