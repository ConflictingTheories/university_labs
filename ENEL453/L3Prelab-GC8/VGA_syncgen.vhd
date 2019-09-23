----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - VGA_syncgen.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--ENTITY
entity VGA_syncgen is
    Port ( reset : in  STD_LOGIC;
           clk25 : in  STD_LOGIC;
           Hsync : out  STD_LOGIC;
           Vsync : out  STD_LOGIC;
           Blanking : out  STD_LOGIC;
           Haddress : out STD_LOGIC_VECTOR (9 downto 0);
			  Vaddress : out STD_LOGIC_VECTOR (9 downto 0)
			);
end VGA_syncgen;

--ARCHITECTURE
architecture Behavioral of VGA_syncgen is

	type syncstates is (FRONTPORCH,LOWPULSE,BACKPORCH,VIDEO);
	signal Hstate, nextHstate : syncstates;
	signal Vstate, nextVstate : syncstates;
	signal Hcounter : unsigned(9 downto 0);
	signal Vcounter : unsigned(9 downto 0);
	signal VcountEn : std_logic; -- enable for the vertical counter
	signal Hblanking: std_logic;
	signal Vblanking: std_logic;
	signal resetHcounter: std_logic;
	signal resetVcounter: std_logic;

begin

	Blanking <= Hblanking OR Vblanking;
	Haddress <= std_logic_vector(Hcounter);
	Vaddress <= std_logic_vector(Vcounter);

	counters : process(reset,clk25)
	begin

		if reset ='1' then
			Hstate <= FRONTPORCH;
			Vstate <= FRONTPORCH;
			Hcounter <= (others=>'0');
			Vcounter <= (others=>'0');
		elsif rising_edge(clk25) then
			Hstate <= nextHstate;
			Vstate <= nextVstate;
			if resetHcounter='1' then
				Hcounter <= (others=>'0');
			else
				Hcounter <= Hcounter+1;
			end if;
			
			if resetVcounter='1' then
				Vcounter <= (others=>'0');
			elsif VcountEn='1' then
				Vcounter <= Vcounter+1;
			end if;
		end if;
	end process counters;
	
--HORIZONTAL FSM	
	Hmachine: process(Hstate, Hcounter)
		begin
			resetHcounter <= '0';
			nextHstate <= Hstate;
			VcountEn <= '0';
			
			--STATE MACHINE DECLARATION
			case Hstate is
			
				--FRONTPORCH STATE
				when FRONTPORCH =>
					Hblanking <= '1';
					Hsync <= '1';
					if Hcounter=15 then
						nextHstate <= LOWPULSE;
						resetHcounter <= '1';
					end if;
				
				--LOWPULSE STATE
				when LOWPULSE =>
					Hblanking <= '1';
					Hsync <= '0';
					if Hcounter=95 then
						nextHstate <= BACKPORCH;
						resetHcounter <= '1';
					end if;
					
				--BACKPORCH STATE
				when BACKPORCH =>
					Hblanking <= '1';
					Hsync <= '1';
					if Hcounter=47 then
						nextHstate <= VIDEO;
						resetHcounter <= '1';
					end if;
					
				--VIDEO STATE
				when VIDEO =>
					Hblanking <= '0';
					Hsync <= '1';
					if Hcounter=639 then
						nextHstate <= FRONTPORCH;
						resetHcounter <= '1';
						VcountEn <= '1';
					end if;
			end case;
	end process Hmachine;

-- VERTICAL FSM
	Vmachine: process(Vstate, Vcounter)
		begin
			resetVcounter <= '0';
			nextVstate <= Vstate;
			
			--STATE MACHINE DECLARATION
			case Vstate is
			
				--FRONTPORCH STATE
				when FRONTPORCH =>
					Vblanking <= '1';
					Vsync <= '1';
					if Vcounter=9 then
						nextVstate <= LOWPULSE;
						resetVcounter <= '1';
					end if;
				
				--LOWPULSE STATE
				when LOWPULSE =>
					Vblanking <= '1';
					Vsync <= '0';
					if Vcounter=2 then
						nextVstate <= BACKPORCH;
						resetVcounter <= '1';
					end if;
					
				--BACKPORCH STATE	
				when BACKPORCH =>
					Vblanking <= '1';
					Vsync <= '1';
					if Vcounter=29 then
						nextVstate <= VIDEO;
						resetVcounter <= '1';
					end if;
				
				--VIDEO STATE
				when VIDEO =>
					Vblanking <= '0';
					Vsync <= '1';
					if Vcounter=479 then
						nextVstate <= FRONTPORCH;
						resetVcounter <= '1';
					end if;
			end case;
	end process Vmachine;

end Behavioral;

