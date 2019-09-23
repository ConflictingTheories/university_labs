----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - colorkiller.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity colorKiller is
		Port (	-- Inputs
					B_in: in STD_LOGIC_VECTOR(1 downto 0);
					G_in: in STD_LOGIC_VECTOR(2 downto 0);
					R_in: in STD_LOGIC_VECTOR(2 downto 0);
					Blanking: in STD_LOGIC;
					-- Outputs
					B_out: out STD_LOGIC_VECTOR(1 downto 0);
					G_out: out STD_LOGIC_VECTOR(2 downto 0);
					R_out: out STD_LOGIC_VECTOR(2 downto 0)
				);
end colorKiller;

architecture Behavioral of colorKiller is

begin

process(Blanking, B_in, G_in, R_in)
begin
	if Blanking='1' then
		B_out <= "00";
		G_out <= "000";
		R_out <= "000";
	else
		B_out <= B_in;
		G_out <= G_in;
		R_out <= R_in;
	end if;
end process;

end Behavioral;

