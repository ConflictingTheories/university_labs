-- Testbench Gencounter
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
entity gencounter_test is
end gencounter_test;

--Testbench Initialization
architecture Behavioral of gencounter_test is

-- Component to Test
	Component gencounter
		generic	( 	nbits: positive:=4;
					divby: positive:=10 
				);

		port	( 	reset 	: in STD_LOGIC;
					clk		: in STD_LOGIC;
					cEn		: in STD_LOGIC;
					q		: out STD_LOGIC_VECTOR (nbits-1 downto 0);
					carry	: out STD_LOGIC
				);
	end Component;

-- Signals
	--Inputs
	signal reset 	: STD_LOGIC := '0';
	signal clk 		: STD_LOGIC := '0';
	signal cEn 		: STD_LOGIC := '0';
	--Outputs
	signal q 		: STD_LOGIC_VECTOR(nbits-1 downto 0);
	signal carry 	: STD_LOGIC;

-- Clock Period
	constant clk_period : TIME := 10 ns;

begin
--Instantiate UUT
UUT:	gencounter 
	generic map (4, 10) port map (reset,clk,cEn,q,carry);

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