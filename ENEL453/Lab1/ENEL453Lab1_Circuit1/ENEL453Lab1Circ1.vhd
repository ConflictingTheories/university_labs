----------------------------------------------------------------------------------
-- Authors:
-- 
-- Create Date:    13:54:12 01/18/2013 
-- Design Name: 
-- Module Name:    ENEL453Lab1Circ1 - Behavioral 
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

entity ENEL453Lab1Circ1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           X : out  STD_LOGIC;
           Y : out  STD_LOGIC);
end ENEL453Lab1Circ1;

architecture Behavioral of ENEL453Lab1Circ1 is

begin

	X <= A and B;
	Y <= A xor B;

end Behavioral;

