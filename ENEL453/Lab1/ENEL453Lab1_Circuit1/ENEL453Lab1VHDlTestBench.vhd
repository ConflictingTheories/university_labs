----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:28 01/18/2013 
-- Design Name: 
-- Module Name:    ENEL453Lab1VHDlTestBench - Behavioral 
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

entity ENEL453Lab1VHDlTestBench is
end ENEL453Lab1VHDlTestBench;

architecture Behavioral of ENEL453Lab1VHDlTestBench is
	-- Component Declaration
	Component ENEL453Lab1Circ1
		port(A, B: in std_logic; X,Y: out std_logic);
	end Component;
	
	-- Intermediary Signals
	-- Inputs
	signal Ain : std_logic := '0';
	signal Bin : std_logic := '0';
	--Outputs
	signal Xout : std_logic;
	signal Yout : std_logic;
	
begin

	UUT: ENEL453Lab1Circ1 port map(Ain, Bin, Xout, Yout);
	Ain <= '0','1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
	Bin <= '0','1' after 20 ns;

end Behavioral;

