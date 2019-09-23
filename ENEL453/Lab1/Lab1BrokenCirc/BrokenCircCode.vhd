----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:28 01/18/2013 
-- Design Name: 
-- Module Name:    BrokenCircCode - Behavioral 
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

entity BrokenCircCode is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end BrokenCircCode;

architecture Behavioral of BrokenCircCode is

begin
	Y <= A and B;

	process(A,B) 
	begin
		if B='0' then
			Y <= A;
		else
			Y <= '1';
		end if;
end process;

end Behavioral;

