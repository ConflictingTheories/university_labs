----------------------------------------------------------------------------------
-- ENEL 453 - Lab 4 - VGA_Driver_Test.vhd
--
-- Authors:		Kyle Derby MacInnis
--					Sajna Massey
--
-- Date:			March 3, 2012
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
 
ENTITY VGA_Driver_Test IS
END VGA_Driver_Test;
 
ARCHITECTURE behavior OF VGA_Driver_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGA_driver
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         wxAddr : IN  std_logic_vector(6 downto 0);
         wyAddr : IN  std_logic_vector(5 downto 0);
         pixelin : IN  std_logic_vector(2 downto 0);
         writeEn : IN  std_logic;
         hsync : OUT  std_logic;
         vsync : OUT  std_logic;
         Red : OUT  std_logic_vector(2 downto 0);
         Green : OUT  std_logic_vector(2 downto 0);
         Blue : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal wxAddr : std_logic_vector(6 downto 0) := (others => '0');
   signal wyAddr : std_logic_vector(5 downto 0) := (others => '0');
   signal pixelin : std_logic_vector(2 downto 0) := (others => '0');
   signal writeEn : std_logic := '0';

 	--Outputs
   signal hsync : std_logic;
   signal vsync : std_logic;
   signal Red : std_logic_vector(2 downto 0);
   signal Green : std_logic_vector(2 downto 0);
   signal Blue : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGA_driver PORT MAP (
          reset => reset,
          clk => clk,
          wxAddr => wxAddr,
          wyAddr => wyAddr,
          pixelin => pixelin,
          writeEn => writeEn,
          hsync => hsync,
          vsync => vsync,
          Red => Red,
          Green => Green,
          Blue => Blue
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
		
		-- Reset 
		reset <= '1';
		wait for clk_period*10;
	   reset <= '0';
		wait for clk_period*10;
    
	 --Disable Writing
    writeEn <= '0';
    wait for clk_period*40;
	 
	 -- Enable Writing
    writeEn <= '1';
	 wait for clk_period*40;
	 
	 -- There will be an issue with pixel output due
	 -- to the lack of a write-address driver. Read address
	 -- is done internally by VGA_Driver, but write is handled externally.
	 -- Since Pixel Map is difficult to generate, it wont be done.

	 -- Check that different Pixels are Written
	 pixelin <= "111";
	 wait for clk_period*400;
	 pixelin <= "110";
	 wait for clk_period*400;
	 pixelin <= "101";
	 wait for clk_period*400;
	 pixelin <= "100";
	 wait for clk_period*400;
	 pixelin <= "011";
	 wait for clk_period*400;
	 pixelin <= "010";
	 wait for clk_period*400;
	 pixelin <= "001";
	 wait for clk_period*400;
	 pixelin <= "000";
	 wait;
	 
    end process;

END;
