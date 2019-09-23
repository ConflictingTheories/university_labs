
----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - VGA_FrameBuffer_Test.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

 
ENTITY VGA_FrameBuffer_Test IS
END VGA_FrameBuffer_Test;
 
ARCHITECTURE behavior OF VGA_FrameBuffer_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGA_Framebuffer
    PORT(
         clk : IN  std_logic;
         pixelin : IN  std_logic_vector(7 downto 0);
         rxAddr : IN  std_logic_vector(9 downto 0);
         ryAddr : IN  std_logic_vector(8 downto 0);
         wxAddr : IN  std_logic_vector(9 downto 0);
         wyAddr : IN  std_logic_vector(8 downto 0);
         writeEn : IN  std_logic;
         pixelout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pixelin : std_logic_vector(7 downto 0) := (others => '0');
   signal rxAddr : std_logic_vector(9 downto 0) := (others => '0');
   signal ryAddr : std_logic_vector(8 downto 0) := (others => '0');
   signal wxAddr : std_logic_vector(9 downto 0) := (others => '0');
   signal wyAddr : std_logic_vector(8 downto 0) := (others => '0');
   signal writeEn : std_logic := '0';

 	--Outputs
   signal pixelout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGA_Framebuffer PORT MAP (
          clk => clk,
          pixelin => pixelin,
          rxAddr => rxAddr,
          ryAddr => ryAddr,
          wxAddr => wxAddr,
          wyAddr => wyAddr,
          writeEn => writeEn,
          pixelout => pixelout
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
	
	-- Hold Initial Settings
   wait for 100 ns;

	-- Write Disabled
   writeEn <= '0';
   wait for clk_period*20;
   
	-- Set Write Address
   wxAddr <= "0000001111";
	wyAddr <= "000000111";
	-- Set Pixel Colour
	pixelin <= "11100011";
	wait for clk_period*20;
	
	-- Set Wrong Read Address
	rxAddr <= "0000001110";
	ryAddr <= "000000111";
	wait for clk_period*20;
	
	-- Change Read Y-Address
	ryAddr <= "000000110";
	-- Enable Writing
	writeEn <= '1';
	wait for clk_period*20;
	
	--Find Correct Read Address
	rxAddr <= "0000001111";
	ryAddr <= "000000111";
	-- SHOULD OUTPUT PIXEL DATA FROM RAM
	wait for clk_period*20;
	
	--Disable Write
	writeEn <= '0';
	--Change Pixel Colour
	pixelin <= "10101010";
	wait for clk_period*20;
	
	--Enable Write (Writing new Pixel)
	writeEn <= '1';
   -- SHOULD OUTPUT NEW PIXEL FROM RAM
	wait;
   end process;

END;
