----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:35 01/18/2013 
-- Design Name: 
-- Module Name:    seqCirc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Sequential Circuit Entity
entity seqCirc is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end seqCirc;

-- Sequential Circuit Behaviour (Architecture)
architecture Behavioral of seqCirc is
	signal Ztemp : std_logic;
begin
	-- Behavior for Ztemp Signal
	Ztemp <= A and B;
	
	-- Sequential Process Starts and Responds to
	-- reset, clk, enable, and Ztemp changes
	process(reset, clk, enable, Ztemp)
	begin
		-- If reset is true
		if reset='1' then
			Z <= '0';
		-- else if it is a rising edge, and enable is set
		elsif rising_edge(clk) and enable='1' then
			Z <= Ztemp;
		end if;
	end process;
	
end Behavioral;


