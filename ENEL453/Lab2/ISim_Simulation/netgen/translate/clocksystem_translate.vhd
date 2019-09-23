--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.28xd
--  \   \         Application: netgen
--  /   /         Filename: clocksystem_translate.vhd
-- /___/   /\     Timestamp: Tue Jan 29 16:10:38 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm clocksystem -w -dir netgen/translate -ofmt vhdl -sim clocksystem.ngd clocksystem_translate.vhd 
-- Device	: 3s100evq100-5
-- Input file	: clocksystem.ngd
-- Output file	: \\engfs.eng.ad.ucalgary.ca\home\kderbyma\ENEL453\Lab2\ISim_Simulation\netgen\translate\clocksystem_translate.vhd
-- # of Entities	: 1
-- Design Name	: clocksystem
-- Xilinx	: C:\Xilinx\14.2\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity clocksystem is
  port (
    clk : in STD_LOGIC := 'X'; 
    reset : in STD_LOGIC := 'X'; 
    freqsel : in STD_LOGIC := 'X'; 
    LEDsegments : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
    anodeCtrl : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end clocksystem;

architecture Structure of clocksystem is
  signal LEDsegments_0_OBUF_10 : STD_LOGIC; 
  signal LEDsegments_1_OBUF_11 : STD_LOGIC; 
  signal LEDsegments_2_OBUF_12 : STD_LOGIC; 
  signal LEDsegments_3_OBUF_13 : STD_LOGIC; 
  signal LEDsegments_4_OBUF_14 : STD_LOGIC; 
  signal LEDsegments_5_OBUF_15 : STD_LOGIC; 
  signal LEDsegments_6_OBUF_16 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal anodeCtrl_0_OBUF_35 : STD_LOGIC; 
  signal anodeCtrl_1_OBUF_36 : STD_LOGIC; 
  signal anodeCtrl_2_OBUF_37 : STD_LOGIC; 
  signal anodeCtrl_3_OBUF_38 : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal clkdiv_div25_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_div25_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_div25_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_div25_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_div25_Mcount_q_int_xor_4_1 : STD_LOGIC; 
  signal clkdiv_div25_carry_46 : STD_LOGIC; 
  signal clkdiv_div25_q_int_cmp_eq0000_52 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_carry_57 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_carry_mux0002_58 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_q_int_0_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_q_int_1_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_q_int_2_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_q_int_3_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_carry_67 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_carry_mux0002_68 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_q_int_0_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_q_int_1_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_q_int_2_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_q_int_3_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_carry_77 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_carry_mux0002_78 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_q_int_0_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_q_int_1_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_q_int_2_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_q_int_3_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_carry_87 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_carry_mux0002_88 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_q_int_0_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_q_int_1_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_q_int_2_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_q_int_3_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_carry_97 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_carry_mux0002_98 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_q_int_0_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_q_int_1_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_q_int_2_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_q_int_3_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_Mcount_q_int : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_Mcount_q_int1 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_Mcount_q_int2 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_Mcount_q_int3 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_carry_107 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_carry_mux0002_108 : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_q_int_0_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_q_int_1_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_q_int_2_Q : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_q_int_3_Q : STD_LOGIC; 
  signal clkenable : STD_LOGIC; 
  signal digsel_Mmux_outdigit_3_116 : STD_LOGIC; 
  signal digsel_Mmux_outdigit_31_117 : STD_LOGIC; 
  signal digsel_Mmux_outdigit_32_118 : STD_LOGIC; 
  signal digsel_Mmux_outdigit_4_119 : STD_LOGIC; 
  signal digsel_Mmux_outdigit_41_120 : STD_LOGIC; 
  signal digsel_Mmux_outdigit_42_121 : STD_LOGIC; 
  signal freqsel_IBUF_123 : STD_LOGIC; 
  signal minsec60_min0_Mcount_q_int : STD_LOGIC; 
  signal minsec60_min0_Mcount_q_int1 : STD_LOGIC; 
  signal minsec60_min0_Mcount_q_int2 : STD_LOGIC; 
  signal minsec60_min0_Mcount_q_int3 : STD_LOGIC; 
  signal minsec60_min0_carry_128 : STD_LOGIC; 
  signal minsec60_min0_carry_mux0002_129 : STD_LOGIC; 
  signal minsec60_min1_Mcount_q_int : STD_LOGIC; 
  signal minsec60_min1_Mcount_q_int1 : STD_LOGIC; 
  signal minsec60_min1_Mcount_q_int2 : STD_LOGIC; 
  signal minsec60_sec0_Mcount_q_int : STD_LOGIC; 
  signal minsec60_sec0_Mcount_q_int1 : STD_LOGIC; 
  signal minsec60_sec0_Mcount_q_int2 : STD_LOGIC; 
  signal minsec60_sec0_Mcount_q_int3 : STD_LOGIC; 
  signal minsec60_sec0_carry_144 : STD_LOGIC; 
  signal minsec60_sec0_carry_mux0002_145 : STD_LOGIC; 
  signal minsec60_sec1_Mcount_q_int : STD_LOGIC; 
  signal minsec60_sec1_Mcount_q_int1 : STD_LOGIC; 
  signal minsec60_sec1_Mcount_q_int2 : STD_LOGIC; 
  signal minsec60_sec1_carry_153 : STD_LOGIC; 
  signal minsec60_sec1_carry_mux0002 : STD_LOGIC; 
  signal reset_IBUF_159 : STD_LOGIC; 
  signal minsec60_min0_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clkdiv_gendiv10e6_6_div10_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clkdiv_gendiv10e6_5_div10_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clkdiv_gendiv10e6_4_div10_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clkdiv_gendiv10e6_3_div10_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clkdiv_gendiv10e6_2_div10_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clkdiv_gendiv10e6_1_div10_carry_mux0002_SW0_O : STD_LOGIC; 
  signal minsec60_sec0_carry_mux0002_SW0_O : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_2 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal Result : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal clkdiv_div25_q_int : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal digitCtrl_count2bit : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal minsec60_min0_q_int : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal minsec60_min1_q_int : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal minsec60_sec0_q_int : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal minsec60_sec1_q_int : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal temp_bcdseg : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  clkdiv_gendiv10e6_1_div10_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_1_div10_carry_mux0002_58,
      O => clkdiv_gendiv10e6_1_div10_carry_57,
      CE => VCC,
      SET => GND
    );
  clkdiv_gendiv10e6_2_div10_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_2_div10_carry_mux0002_68,
      O => clkdiv_gendiv10e6_2_div10_carry_67,
      CE => VCC,
      SET => GND
    );
  clkdiv_gendiv10e6_3_div10_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_3_div10_carry_mux0002_78,
      O => clkdiv_gendiv10e6_3_div10_carry_77,
      CE => VCC,
      SET => GND
    );
  clkdiv_gendiv10e6_4_div10_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_4_div10_carry_mux0002_88,
      O => clkdiv_gendiv10e6_4_div10_carry_87,
      CE => VCC,
      SET => GND
    );
  clkdiv_gendiv10e6_5_div10_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_5_div10_carry_mux0002_98,
      O => clkdiv_gendiv10e6_5_div10_carry_97,
      CE => VCC,
      SET => GND
    );
  clkdiv_gendiv10e6_6_div10_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_6_div10_carry_mux0002_108,
      O => clkdiv_gendiv10e6_6_div10_carry_107,
      CE => VCC,
      SET => GND
    );
  clkdiv_div25_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_div25_q_int_cmp_eq0000_52,
      O => clkdiv_div25_carry_46,
      CE => VCC,
      SET => GND
    );
  minsec60_sec1_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => minsec60_sec1_carry_mux0002,
      O => minsec60_sec1_carry_153,
      CE => VCC,
      SET => GND
    );
  minsec60_sec0_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => minsec60_sec0_carry_mux0002_145,
      O => minsec60_sec0_carry_144,
      CE => VCC,
      SET => GND
    );
  minsec60_min0_carry : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => minsec60_min0_carry_mux0002_129,
      O => minsec60_min0_carry_128,
      CE => VCC,
      SET => GND
    );
  clkdiv_gendiv10e6_1_div10_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_div25_carry_46,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_1_div10_Mcount_q_int,
      O => clkdiv_gendiv10e6_1_div10_q_int_0_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_1_div10_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_div25_carry_46,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_1_div10_Mcount_q_int1,
      O => clkdiv_gendiv10e6_1_div10_q_int_1_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_1_div10_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_div25_carry_46,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_1_div10_Mcount_q_int2,
      O => clkdiv_gendiv10e6_1_div10_q_int_2_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_1_div10_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_div25_carry_46,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_1_div10_Mcount_q_int3,
      O => clkdiv_gendiv10e6_1_div10_q_int_3_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_2_div10_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_1_div10_carry_57,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_2_div10_Mcount_q_int,
      O => clkdiv_gendiv10e6_2_div10_q_int_0_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_2_div10_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_1_div10_carry_57,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_2_div10_Mcount_q_int1,
      O => clkdiv_gendiv10e6_2_div10_q_int_1_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_2_div10_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_1_div10_carry_57,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_2_div10_Mcount_q_int2,
      O => clkdiv_gendiv10e6_2_div10_q_int_2_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_2_div10_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_1_div10_carry_57,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_2_div10_Mcount_q_int3,
      O => clkdiv_gendiv10e6_2_div10_q_int_3_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_3_div10_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_2_div10_carry_67,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_3_div10_Mcount_q_int,
      O => clkdiv_gendiv10e6_3_div10_q_int_0_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_3_div10_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_2_div10_carry_67,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_3_div10_Mcount_q_int1,
      O => clkdiv_gendiv10e6_3_div10_q_int_1_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_3_div10_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_2_div10_carry_67,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_3_div10_Mcount_q_int2,
      O => clkdiv_gendiv10e6_3_div10_q_int_2_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_3_div10_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_2_div10_carry_67,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_3_div10_Mcount_q_int3,
      O => clkdiv_gendiv10e6_3_div10_q_int_3_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_4_div10_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_3_div10_carry_77,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_4_div10_Mcount_q_int,
      O => clkdiv_gendiv10e6_4_div10_q_int_0_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_4_div10_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_3_div10_carry_77,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_4_div10_Mcount_q_int1,
      O => clkdiv_gendiv10e6_4_div10_q_int_1_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_4_div10_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_3_div10_carry_77,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_4_div10_Mcount_q_int2,
      O => clkdiv_gendiv10e6_4_div10_q_int_2_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_4_div10_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_3_div10_carry_77,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_4_div10_Mcount_q_int3,
      O => clkdiv_gendiv10e6_4_div10_q_int_3_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_5_div10_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_4_div10_carry_87,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_5_div10_Mcount_q_int,
      O => clkdiv_gendiv10e6_5_div10_q_int_0_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_5_div10_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_4_div10_carry_87,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_5_div10_Mcount_q_int1,
      O => clkdiv_gendiv10e6_5_div10_q_int_1_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_5_div10_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_4_div10_carry_87,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_5_div10_Mcount_q_int2,
      O => clkdiv_gendiv10e6_5_div10_q_int_2_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_5_div10_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_4_div10_carry_87,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_5_div10_Mcount_q_int3,
      O => clkdiv_gendiv10e6_5_div10_q_int_3_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_6_div10_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_5_div10_carry_97,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_6_div10_Mcount_q_int,
      O => clkdiv_gendiv10e6_6_div10_q_int_0_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_6_div10_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_5_div10_carry_97,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_6_div10_Mcount_q_int1,
      O => clkdiv_gendiv10e6_6_div10_q_int_1_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_6_div10_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_5_div10_carry_97,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_6_div10_Mcount_q_int2,
      O => clkdiv_gendiv10e6_6_div10_q_int_2_Q,
      SET => GND
    );
  clkdiv_gendiv10e6_6_div10_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_5_div10_carry_97,
      RST => reset_IBUF_159,
      I => clkdiv_gendiv10e6_6_div10_Mcount_q_int3,
      O => clkdiv_gendiv10e6_6_div10_q_int_3_Q,
      SET => GND
    );
  clkdiv_div25_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_div25_Mcount_q_int,
      O => clkdiv_div25_q_int(0),
      CE => VCC,
      SET => GND
    );
  clkdiv_div25_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_div25_Mcount_q_int1,
      O => clkdiv_div25_q_int(1),
      CE => VCC,
      SET => GND
    );
  clkdiv_div25_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_div25_Mcount_q_int2,
      O => clkdiv_div25_q_int(2),
      CE => VCC,
      SET => GND
    );
  clkdiv_div25_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      RST => reset_IBUF_159,
      I => clkdiv_div25_Mcount_q_int3,
      O => clkdiv_div25_q_int(3),
      CE => VCC,
      SET => GND
    );
  minsec60_sec1_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec0_carry_144,
      RST => reset_IBUF_159,
      I => minsec60_sec1_Mcount_q_int,
      O => minsec60_sec1_q_int(0),
      SET => GND
    );
  minsec60_sec1_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec0_carry_144,
      RST => reset_IBUF_159,
      I => minsec60_sec1_Mcount_q_int1,
      O => minsec60_sec1_q_int(1),
      SET => GND
    );
  minsec60_sec1_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec0_carry_144,
      RST => reset_IBUF_159,
      I => minsec60_sec1_Mcount_q_int2,
      O => minsec60_sec1_q_int(2),
      SET => GND
    );
  minsec60_sec0_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkenable,
      RST => reset_IBUF_159,
      I => minsec60_sec0_Mcount_q_int,
      O => minsec60_sec0_q_int(0),
      SET => GND
    );
  minsec60_sec0_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkenable,
      RST => reset_IBUF_159,
      I => minsec60_sec0_Mcount_q_int1,
      O => minsec60_sec0_q_int(1),
      SET => GND
    );
  minsec60_sec0_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkenable,
      RST => reset_IBUF_159,
      I => minsec60_sec0_Mcount_q_int2,
      O => minsec60_sec0_q_int(2),
      SET => GND
    );
  minsec60_sec0_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkenable,
      RST => reset_IBUF_159,
      I => minsec60_sec0_Mcount_q_int3,
      O => minsec60_sec0_q_int(3),
      SET => GND
    );
  minsec60_min0_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec1_carry_153,
      RST => reset_IBUF_159,
      I => minsec60_min0_Mcount_q_int,
      O => minsec60_min0_q_int(0),
      SET => GND
    );
  minsec60_min0_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec1_carry_153,
      RST => reset_IBUF_159,
      I => minsec60_min0_Mcount_q_int1,
      O => minsec60_min0_q_int(1),
      SET => GND
    );
  minsec60_min0_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec1_carry_153,
      RST => reset_IBUF_159,
      I => minsec60_min0_Mcount_q_int2,
      O => minsec60_min0_q_int(2),
      SET => GND
    );
  minsec60_min0_q_int_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_sec1_carry_153,
      RST => reset_IBUF_159,
      I => minsec60_min0_Mcount_q_int3,
      O => minsec60_min0_q_int(3),
      SET => GND
    );
  minsec60_min1_q_int_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_min0_carry_128,
      RST => reset_IBUF_159,
      I => minsec60_min1_Mcount_q_int,
      O => minsec60_min1_q_int(0),
      SET => GND
    );
  minsec60_min1_q_int_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_min0_carry_128,
      RST => reset_IBUF_159,
      I => minsec60_min1_Mcount_q_int1,
      O => minsec60_min1_q_int(1),
      SET => GND
    );
  minsec60_min1_q_int_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => minsec60_min0_carry_128,
      RST => reset_IBUF_159,
      I => minsec60_min1_Mcount_q_int2,
      O => minsec60_min1_q_int(2),
      SET => GND
    );
  digitCtrl_count2bit_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_3_div10_carry_77,
      RST => reset_IBUF_159,
      I => Result(0),
      O => digitCtrl_count2bit(0),
      SET => GND
    );
  digitCtrl_count2bit_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_gendiv10e6_3_div10_carry_77,
      RST => reset_IBUF_159,
      I => Result(1),
      O => digitCtrl_count2bit(1),
      SET => GND
    );
  digsel_Mmux_outdigit_2_f5_1 : X_MUX2
    port map (
      IA => digsel_Mmux_outdigit_42_121,
      IB => digsel_Mmux_outdigit_32_118,
      SEL => digitCtrl_count2bit(1),
      O => temp_bcdseg(2)
    );
  digsel_Mmux_outdigit_42 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => minsec60_sec0_q_int(2),
      ADR2 => minsec60_sec1_q_int(2),
      O => digsel_Mmux_outdigit_42_121
    );
  digsel_Mmux_outdigit_32 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => minsec60_min0_q_int(2),
      ADR2 => minsec60_min1_q_int(2),
      O => digsel_Mmux_outdigit_32_118
    );
  digsel_Mmux_outdigit_2_f5_0 : X_MUX2
    port map (
      IA => digsel_Mmux_outdigit_41_120,
      IB => digsel_Mmux_outdigit_31_117,
      SEL => digitCtrl_count2bit(1),
      O => temp_bcdseg(1)
    );
  digsel_Mmux_outdigit_41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => minsec60_sec0_q_int(1),
      ADR2 => minsec60_sec1_q_int(1),
      O => digsel_Mmux_outdigit_41_120
    );
  digsel_Mmux_outdigit_31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => minsec60_min0_q_int(1),
      ADR2 => minsec60_min1_q_int(1),
      O => digsel_Mmux_outdigit_31_117
    );
  digsel_Mmux_outdigit_2_f5 : X_MUX2
    port map (
      IA => digsel_Mmux_outdigit_4_119,
      IB => digsel_Mmux_outdigit_3_116,
      SEL => digitCtrl_count2bit(1),
      O => temp_bcdseg(0)
    );
  digsel_Mmux_outdigit_4 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => minsec60_sec0_q_int(0),
      ADR2 => minsec60_sec1_q_int(0),
      O => digsel_Mmux_outdigit_4_119
    );
  digsel_Mmux_outdigit_3 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => minsec60_min0_q_int(0),
      ADR2 => minsec60_min1_q_int(0),
      O => digsel_Mmux_outdigit_3_116
    );
  digitCtrl_Mdecod_anodeCtrl31 : X_LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => digitCtrl_count2bit(1),
      O => anodeCtrl_3_OBUF_38
    );
  digitCtrl_Mdecod_anodeCtrl21 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => digitCtrl_count2bit(1),
      ADR1 => digitCtrl_count2bit(0),
      O => anodeCtrl_2_OBUF_37
    );
  digitCtrl_Mdecod_anodeCtrl11 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => digitCtrl_count2bit(1),
      O => anodeCtrl_1_OBUF_36
    );
  digitCtrl_Mdecod_anodeCtrl01 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => digitCtrl_count2bit(1),
      O => anodeCtrl_0_OBUF_35
    );
  digitCtrl_Mcount_count2bit_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => digitCtrl_count2bit(1),
      ADR1 => digitCtrl_count2bit(0),
      O => Result(1)
    );
  clkdiv_div25_Mcount_q_int_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(1),
      ADR1 => clkdiv_div25_q_int(0),
      O => clkdiv_div25_Mcount_q_int1
    );
  minsec60_sec1_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"62"
    )
    port map (
      ADR0 => minsec60_sec1_q_int(2),
      ADR1 => minsec60_sec1_q_int(0),
      ADR2 => minsec60_sec1_q_int(1),
      O => minsec60_sec1_Mcount_q_int2
    );
  minsec60_sec1_Mcount_q_int_xor_1_11 : X_LUT3
    generic map(
      INIT => X"26"
    )
    port map (
      ADR0 => minsec60_sec1_q_int(1),
      ADR1 => minsec60_sec1_q_int(0),
      ADR2 => minsec60_sec1_q_int(2),
      O => minsec60_sec1_Mcount_q_int1
    );
  minsec60_min1_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"62"
    )
    port map (
      ADR0 => minsec60_min1_q_int(2),
      ADR1 => minsec60_min1_q_int(0),
      ADR2 => minsec60_min1_q_int(1),
      O => minsec60_min1_Mcount_q_int2
    );
  minsec60_min1_Mcount_q_int_xor_1_11 : X_LUT3
    generic map(
      INIT => X"26"
    )
    port map (
      ADR0 => minsec60_min1_q_int(1),
      ADR1 => minsec60_min1_q_int(0),
      ADR2 => minsec60_min1_q_int(2),
      O => minsec60_min1_Mcount_q_int1
    );
  minsec60_sec0_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => minsec60_sec0_q_int(2),
      ADR1 => minsec60_sec0_q_int(1),
      ADR2 => minsec60_sec0_q_int(0),
      O => minsec60_sec0_Mcount_q_int2
    );
  minsec60_min0_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => minsec60_min0_q_int(2),
      ADR1 => minsec60_min0_q_int(1),
      ADR2 => minsec60_min0_q_int(0),
      O => minsec60_min0_Mcount_q_int2
    );
  clkdiv_gendiv10e6_6_div10_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_6_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_6_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_6_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_6_div10_Mcount_q_int2
    );
  clkdiv_gendiv10e6_5_div10_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_5_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_5_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_5_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_5_div10_Mcount_q_int2
    );
  clkdiv_gendiv10e6_4_div10_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_4_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_4_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_4_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_4_div10_Mcount_q_int2
    );
  clkdiv_gendiv10e6_3_div10_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_3_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_3_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_3_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_3_div10_Mcount_q_int2
    );
  clkdiv_gendiv10e6_2_div10_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_2_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_2_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_2_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_2_div10_Mcount_q_int2
    );
  clkdiv_gendiv10e6_1_div10_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_1_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_1_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_1_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_1_div10_Mcount_q_int2
    );
  clkdiv_div25_Mcount_q_int_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(2),
      ADR1 => clkdiv_div25_q_int(1),
      ADR2 => clkdiv_div25_q_int(0),
      O => clkdiv_div25_Mcount_q_int2
    );
  minsec60_sec1_carry_mux00021 : X_LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      ADR0 => minsec60_sec1_q_int(2),
      ADR1 => minsec60_sec0_carry_144,
      ADR2 => minsec60_sec1_q_int(1),
      ADR3 => minsec60_sec1_q_int(0),
      O => minsec60_sec1_carry_mux0002
    );
  minsec60_sec0_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => minsec60_sec0_q_int(0),
      ADR1 => minsec60_sec0_q_int(1),
      ADR2 => minsec60_sec0_q_int(2),
      ADR3 => minsec60_sec0_q_int(3),
      O => minsec60_sec0_Mcount_q_int1
    );
  minsec60_min0_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => minsec60_min0_q_int(0),
      ADR1 => minsec60_min0_q_int(1),
      ADR2 => minsec60_min0_q_int(2),
      ADR3 => minsec60_min0_q_int(3),
      O => minsec60_min0_Mcount_q_int1
    );
  clkdiv_gendiv10e6_6_div10_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_6_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_6_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_6_div10_q_int_2_Q,
      ADR3 => clkdiv_gendiv10e6_6_div10_q_int_3_Q,
      O => clkdiv_gendiv10e6_6_div10_Mcount_q_int1
    );
  clkdiv_gendiv10e6_5_div10_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_5_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_5_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_5_div10_q_int_2_Q,
      ADR3 => clkdiv_gendiv10e6_5_div10_q_int_3_Q,
      O => clkdiv_gendiv10e6_5_div10_Mcount_q_int1
    );
  clkdiv_gendiv10e6_4_div10_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_4_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_4_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_4_div10_q_int_2_Q,
      ADR3 => clkdiv_gendiv10e6_4_div10_q_int_3_Q,
      O => clkdiv_gendiv10e6_4_div10_Mcount_q_int1
    );
  clkdiv_gendiv10e6_3_div10_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_3_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_3_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_3_div10_q_int_2_Q,
      ADR3 => clkdiv_gendiv10e6_3_div10_q_int_3_Q,
      O => clkdiv_gendiv10e6_3_div10_Mcount_q_int1
    );
  clkdiv_gendiv10e6_2_div10_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_2_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_2_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_2_div10_q_int_2_Q,
      ADR3 => clkdiv_gendiv10e6_2_div10_q_int_3_Q,
      O => clkdiv_gendiv10e6_2_div10_Mcount_q_int1
    );
  clkdiv_gendiv10e6_1_div10_Mcount_q_int_xor_1_11 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_1_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_1_div10_q_int_1_Q,
      ADR2 => clkdiv_gendiv10e6_1_div10_q_int_2_Q,
      ADR3 => clkdiv_gendiv10e6_1_div10_q_int_3_Q,
      O => clkdiv_gendiv10e6_1_div10_Mcount_q_int1
    );
  minsec60_sec0_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => minsec60_sec0_q_int(0),
      ADR1 => minsec60_sec0_q_int(3),
      ADR2 => minsec60_sec0_q_int(1),
      ADR3 => minsec60_sec0_q_int(2),
      O => minsec60_sec0_Mcount_q_int3
    );
  minsec60_min0_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => minsec60_min0_q_int(0),
      ADR1 => minsec60_min0_q_int(3),
      ADR2 => minsec60_min0_q_int(1),
      ADR3 => minsec60_min0_q_int(2),
      O => minsec60_min0_Mcount_q_int3
    );
  clkdiv_gendiv10e6_6_div10_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_6_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_6_div10_q_int_3_Q,
      ADR2 => clkdiv_gendiv10e6_6_div10_q_int_1_Q,
      ADR3 => clkdiv_gendiv10e6_6_div10_q_int_2_Q,
      O => clkdiv_gendiv10e6_6_div10_Mcount_q_int3
    );
  clkdiv_gendiv10e6_5_div10_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_5_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_5_div10_q_int_3_Q,
      ADR2 => clkdiv_gendiv10e6_5_div10_q_int_1_Q,
      ADR3 => clkdiv_gendiv10e6_5_div10_q_int_2_Q,
      O => clkdiv_gendiv10e6_5_div10_Mcount_q_int3
    );
  clkdiv_gendiv10e6_4_div10_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_4_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_4_div10_q_int_3_Q,
      ADR2 => clkdiv_gendiv10e6_4_div10_q_int_1_Q,
      ADR3 => clkdiv_gendiv10e6_4_div10_q_int_2_Q,
      O => clkdiv_gendiv10e6_4_div10_Mcount_q_int3
    );
  clkdiv_gendiv10e6_3_div10_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_3_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_3_div10_q_int_3_Q,
      ADR2 => clkdiv_gendiv10e6_3_div10_q_int_1_Q,
      ADR3 => clkdiv_gendiv10e6_3_div10_q_int_2_Q,
      O => clkdiv_gendiv10e6_3_div10_Mcount_q_int3
    );
  clkdiv_gendiv10e6_2_div10_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_2_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_2_div10_q_int_3_Q,
      ADR2 => clkdiv_gendiv10e6_2_div10_q_int_1_Q,
      ADR3 => clkdiv_gendiv10e6_2_div10_q_int_2_Q,
      O => clkdiv_gendiv10e6_2_div10_Mcount_q_int3
    );
  clkdiv_gendiv10e6_1_div10_Mcount_q_int_xor_3_11 : X_LUT4
    generic map(
      INIT => X"6CC4"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_1_div10_q_int_0_Q,
      ADR1 => clkdiv_gendiv10e6_1_div10_q_int_3_Q,
      ADR2 => clkdiv_gendiv10e6_1_div10_q_int_1_Q,
      ADR3 => clkdiv_gendiv10e6_1_div10_q_int_2_Q,
      O => clkdiv_gendiv10e6_1_div10_Mcount_q_int3
    );
  clkenable1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => freqsel_IBUF_123,
      ADR1 => clkdiv_gendiv10e6_6_div10_carry_107,
      ADR2 => clkdiv_gendiv10e6_5_div10_carry_97,
      O => clkenable
    );
  minsec60_sec0_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      ADR0 => minsec60_sec0_q_int(1),
      ADR1 => minsec60_sec0_q_int(2),
      ADR2 => minsec60_sec0_q_int(0),
      ADR3 => N40,
      O => minsec60_sec0_carry_mux0002_145
    );
  minsec60_min0_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      ADR0 => minsec60_min0_q_int(1),
      ADR1 => minsec60_min0_q_int(2),
      ADR2 => minsec60_min0_q_int(0),
      ADR3 => N42,
      O => minsec60_min0_carry_mux0002_129
    );
  clkdiv_gendiv10e6_6_div10_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_6_div10_q_int_3_Q,
      ADR1 => clkdiv_gendiv10e6_6_div10_q_int_0_Q,
      ADR2 => clkdiv_gendiv10e6_5_div10_carry_97,
      ADR3 => N44,
      O => clkdiv_gendiv10e6_6_div10_carry_mux0002_108
    );
  clkdiv_gendiv10e6_5_div10_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_5_div10_q_int_3_Q,
      ADR1 => clkdiv_gendiv10e6_5_div10_q_int_0_Q,
      ADR2 => clkdiv_gendiv10e6_5_div10_q_int_2_Q,
      ADR3 => N46,
      O => clkdiv_gendiv10e6_5_div10_carry_mux0002_98
    );
  clkdiv_gendiv10e6_4_div10_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_4_div10_q_int_3_Q,
      ADR1 => clkdiv_gendiv10e6_4_div10_q_int_0_Q,
      ADR2 => clkdiv_gendiv10e6_3_div10_carry_77,
      ADR3 => N48,
      O => clkdiv_gendiv10e6_4_div10_carry_mux0002_88
    );
  clkdiv_gendiv10e6_3_div10_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_3_div10_q_int_3_Q,
      ADR1 => clkdiv_gendiv10e6_3_div10_q_int_0_Q,
      ADR2 => clkdiv_gendiv10e6_3_div10_q_int_2_Q,
      ADR3 => N50,
      O => clkdiv_gendiv10e6_3_div10_carry_mux0002_78
    );
  clkdiv_gendiv10e6_2_div10_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_2_div10_q_int_3_Q,
      ADR1 => clkdiv_gendiv10e6_2_div10_q_int_0_Q,
      ADR2 => clkdiv_gendiv10e6_2_div10_q_int_2_Q,
      ADR3 => N52,
      O => clkdiv_gendiv10e6_2_div10_carry_mux0002_68
    );
  clkdiv_gendiv10e6_1_div10_carry_mux0002 : X_LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_1_div10_q_int_3_Q,
      ADR1 => clkdiv_gendiv10e6_1_div10_q_int_0_Q,
      ADR2 => clkdiv_gendiv10e6_1_div10_q_int_2_Q,
      ADR3 => N54,
      O => clkdiv_gendiv10e6_1_div10_carry_mux0002_58
    );
  clkdiv_div25_q_int_cmp_eq0000 : X_LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(4),
      ADR1 => clkdiv_div25_q_int(2),
      ADR2 => clkdiv_div25_q_int(0),
      ADR3 => N69,
      O => clkdiv_div25_q_int_cmp_eq0000_52
    );
  clkdiv_div25_Mcount_q_int_xor_0_1 : X_LUT4
    generic map(
      INIT => X"0F0D"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(4),
      ADR1 => clkdiv_div25_q_int(2),
      ADR2 => clkdiv_div25_q_int(0),
      ADR3 => N56,
      O => clkdiv_div25_Mcount_q_int
    );
  BCDdec_Mrom_SevenSeg61 : X_LUT4
    generic map(
      INIT => X"4101"
    )
    port map (
      ADR0 => temp_bcdseg(3),
      ADR1 => temp_bcdseg(1),
      ADR2 => temp_bcdseg(2),
      ADR3 => temp_bcdseg(0),
      O => LEDsegments_6_OBUF_16
    );
  BCDdec_Mrom_SevenSeg51 : X_LUT4
    generic map(
      INIT => X"5110"
    )
    port map (
      ADR0 => temp_bcdseg(3),
      ADR1 => temp_bcdseg(2),
      ADR2 => temp_bcdseg(1),
      ADR3 => temp_bcdseg(0),
      O => LEDsegments_5_OBUF_15
    );
  BCDdec_Mrom_SevenSeg21 : X_LUT4
    generic map(
      INIT => X"A8AC"
    )
    port map (
      ADR0 => temp_bcdseg(3),
      ADR1 => temp_bcdseg(1),
      ADR2 => temp_bcdseg(2),
      ADR3 => temp_bcdseg(0),
      O => LEDsegments_2_OBUF_12
    );
  BCDdec_Mrom_SevenSeg41 : X_LUT4
    generic map(
      INIT => X"445C"
    )
    port map (
      ADR0 => temp_bcdseg(3),
      ADR1 => temp_bcdseg(0),
      ADR2 => temp_bcdseg(2),
      ADR3 => temp_bcdseg(1),
      O => LEDsegments_4_OBUF_14
    );
  BCDdec_Mrom_SevenSeg111 : X_LUT4
    generic map(
      INIT => X"EE48"
    )
    port map (
      ADR0 => temp_bcdseg(1),
      ADR1 => temp_bcdseg(2),
      ADR2 => temp_bcdseg(0),
      ADR3 => temp_bcdseg(3),
      O => LEDsegments_1_OBUF_11
    );
  digsel_Mmux_outdigit11 : X_LUT4
    generic map(
      INIT => X"5410"
    )
    port map (
      ADR0 => digitCtrl_count2bit(0),
      ADR1 => digitCtrl_count2bit(1),
      ADR2 => minsec60_sec0_q_int(3),
      ADR3 => minsec60_min0_q_int(3),
      O => temp_bcdseg(3)
    );
  BCDdec_Mrom_SevenSeg11 : X_LUT4
    generic map(
      INIT => X"0006"
    )
    port map (
      ADR0 => temp_bcdseg(0),
      ADR1 => temp_bcdseg(2),
      ADR2 => temp_bcdseg(1),
      ADR3 => temp_bcdseg(3),
      O => LEDsegments_0_OBUF_10
    );
  reset_IBUF : X_BUF
    port map (
      I => reset,
      O => reset_IBUF_159
    );
  freqsel_IBUF : X_BUF
    port map (
      I => freqsel,
      O => freqsel_IBUF_123
    );
  clkdiv_div25_q_int_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => clk_BUFGP,
      CE => clkdiv_div25_q_int(3),
      RST => reset_IBUF_159,
      I => clkdiv_div25_Mcount_q_int_xor_4_1,
      O => clkdiv_div25_q_int(4),
      SET => GND
    );
  clkdiv_div25_Mcount_q_int_xor_4_11 : X_LUT4
    generic map(
      INIT => X"78E0"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(2),
      ADR1 => clkdiv_div25_q_int(0),
      ADR2 => clkdiv_div25_q_int(4),
      ADR3 => clkdiv_div25_q_int(1),
      O => clkdiv_div25_Mcount_q_int_xor_4_1
    );
  BCDdec_Mrom_SevenSeg3 : X_LUT4
    generic map(
      INIT => X"0092"
    )
    port map (
      ADR0 => temp_bcdseg(0),
      ADR1 => temp_bcdseg(1),
      ADR2 => temp_bcdseg(2),
      ADR3 => temp_bcdseg(3),
      O => LEDsegments_3_OBUF_13
    );
  clkdiv_div25_Mcount_q_int_xor_3_1 : X_MUX2
    port map (
      IA => N67,
      IB => N68,
      SEL => clkdiv_div25_q_int(0),
      O => clkdiv_div25_Mcount_q_int3
    );
  clkdiv_div25_Mcount_q_int_xor_3_1_F : X_LUT4
    generic map(
      INIT => X"AAA2"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(3),
      ADR1 => clkdiv_div25_q_int(4),
      ADR2 => clkdiv_div25_q_int(2),
      ADR3 => clkdiv_div25_q_int(1),
      O => N67
    );
  clkdiv_div25_Mcount_q_int_xor_3_1_G : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(3),
      ADR1 => clkdiv_div25_q_int(2),
      ADR2 => clkdiv_div25_q_int(1),
      O => N68
    );
  minsec60_sec1_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => minsec60_sec1_q_int(0),
      O => minsec60_sec1_Mcount_q_int
    );
  minsec60_sec0_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => minsec60_sec0_q_int(0),
      O => minsec60_sec0_Mcount_q_int
    );
  minsec60_min1_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => minsec60_min1_q_int(0),
      O => minsec60_min1_Mcount_q_int
    );
  minsec60_min0_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => minsec60_min0_q_int(0),
      O => minsec60_min0_Mcount_q_int
    );
  digitCtrl_Mcount_count2bit_xor_0_11_INV_0 : X_INV
    port map (
      I => digitCtrl_count2bit(0),
      O => Result(0)
    );
  clkdiv_gendiv10e6_6_div10_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => clkdiv_gendiv10e6_6_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_6_div10_Mcount_q_int
    );
  clkdiv_gendiv10e6_5_div10_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => clkdiv_gendiv10e6_5_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_5_div10_Mcount_q_int
    );
  clkdiv_gendiv10e6_4_div10_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => clkdiv_gendiv10e6_4_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_4_div10_Mcount_q_int
    );
  clkdiv_gendiv10e6_3_div10_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => clkdiv_gendiv10e6_3_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_3_div10_Mcount_q_int
    );
  clkdiv_gendiv10e6_2_div10_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => clkdiv_gendiv10e6_2_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_2_div10_Mcount_q_int
    );
  clkdiv_gendiv10e6_1_div10_Mcount_q_int_xor_0_11_INV_0 : X_INV
    port map (
      I => clkdiv_gendiv10e6_1_div10_q_int_0_Q,
      O => clkdiv_gendiv10e6_1_div10_Mcount_q_int
    );
  minsec60_min0_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => minsec60_min0_carry_mux0002_SW0_O,
      O => N42
    );
  minsec60_min0_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => minsec60_min0_q_int(3),
      ADR1 => minsec60_sec1_carry_153,
      O => minsec60_min0_carry_mux0002_SW0_O
    );
  clkdiv_gendiv10e6_6_div10_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => clkdiv_gendiv10e6_6_div10_carry_mux0002_SW0_O,
      O => N44
    );
  clkdiv_gendiv10e6_6_div10_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_6_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_6_div10_q_int_1_Q,
      O => clkdiv_gendiv10e6_6_div10_carry_mux0002_SW0_O
    );
  clkdiv_gendiv10e6_5_div10_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => clkdiv_gendiv10e6_5_div10_carry_mux0002_SW0_O,
      O => N46
    );
  clkdiv_gendiv10e6_5_div10_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_5_div10_q_int_1_Q,
      ADR1 => clkdiv_gendiv10e6_4_div10_carry_87,
      O => clkdiv_gendiv10e6_5_div10_carry_mux0002_SW0_O
    );
  clkdiv_gendiv10e6_4_div10_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => clkdiv_gendiv10e6_4_div10_carry_mux0002_SW0_O,
      O => N48
    );
  clkdiv_gendiv10e6_4_div10_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_4_div10_q_int_2_Q,
      ADR1 => clkdiv_gendiv10e6_4_div10_q_int_1_Q,
      O => clkdiv_gendiv10e6_4_div10_carry_mux0002_SW0_O
    );
  clkdiv_gendiv10e6_3_div10_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => clkdiv_gendiv10e6_3_div10_carry_mux0002_SW0_O,
      O => N50
    );
  clkdiv_gendiv10e6_3_div10_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_3_div10_q_int_1_Q,
      ADR1 => clkdiv_gendiv10e6_2_div10_carry_67,
      O => clkdiv_gendiv10e6_3_div10_carry_mux0002_SW0_O
    );
  clkdiv_gendiv10e6_2_div10_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => clkdiv_gendiv10e6_2_div10_carry_mux0002_SW0_O,
      O => N52
    );
  clkdiv_gendiv10e6_2_div10_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_2_div10_q_int_1_Q,
      ADR1 => clkdiv_gendiv10e6_1_div10_carry_57,
      O => clkdiv_gendiv10e6_2_div10_carry_mux0002_SW0_O
    );
  clkdiv_gendiv10e6_1_div10_carry_mux0002_SW0_LUT2_L_BUF : X_BUF
    port map (
      I => clkdiv_gendiv10e6_1_div10_carry_mux0002_SW0_O,
      O => N54
    );
  clkdiv_gendiv10e6_1_div10_carry_mux0002_SW0 : X_LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      ADR0 => clkdiv_gendiv10e6_1_div10_q_int_1_Q,
      ADR1 => clkdiv_div25_carry_46,
      O => clkdiv_gendiv10e6_1_div10_carry_mux0002_SW0_O
    );
  clkdiv_div25_q_int_cmp_eq0000_SW0_LUT2_D_BUF : X_BUF
    port map (
      I => N56,
      O => N69
    );
  clkdiv_div25_q_int_cmp_eq0000_SW0 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => clkdiv_div25_q_int(3),
      ADR1 => clkdiv_div25_q_int(1),
      O => N56
    );
  minsec60_sec0_carry_mux0002_SW0_LUT4_L_BUF : X_BUF
    port map (
      I => minsec60_sec0_carry_mux0002_SW0_O,
      O => N40
    );
  minsec60_sec0_carry_mux0002_SW0 : X_LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      ADR0 => freqsel_IBUF_123,
      ADR1 => clkdiv_gendiv10e6_6_div10_carry_107,
      ADR2 => minsec60_sec0_q_int(3),
      ADR3 => clkdiv_gendiv10e6_5_div10_carry_97,
      O => minsec60_sec0_carry_mux0002_SW0_O
    );
  clk_BUFGP_BUFG : X_CKBUF
    port map (
      I => clk_BUFGP_IBUFG_2,
      O => clk_BUFGP
    );
  clk_BUFGP_IBUFG : X_CKBUF
    port map (
      I => clk,
      O => clk_BUFGP_IBUFG_2
    );
  LEDsegments_0_OBUF : X_OBUF
    port map (
      I => LEDsegments_0_OBUF_10,
      O => LEDsegments(0)
    );
  LEDsegments_1_OBUF : X_OBUF
    port map (
      I => LEDsegments_1_OBUF_11,
      O => LEDsegments(1)
    );
  LEDsegments_2_OBUF : X_OBUF
    port map (
      I => LEDsegments_2_OBUF_12,
      O => LEDsegments(2)
    );
  LEDsegments_3_OBUF : X_OBUF
    port map (
      I => LEDsegments_3_OBUF_13,
      O => LEDsegments(3)
    );
  LEDsegments_4_OBUF : X_OBUF
    port map (
      I => LEDsegments_4_OBUF_14,
      O => LEDsegments(4)
    );
  LEDsegments_5_OBUF : X_OBUF
    port map (
      I => LEDsegments_5_OBUF_15,
      O => LEDsegments(5)
    );
  LEDsegments_6_OBUF : X_OBUF
    port map (
      I => LEDsegments_6_OBUF_16,
      O => LEDsegments(6)
    );
  anodeCtrl_0_OBUF : X_OBUF
    port map (
      I => anodeCtrl_0_OBUF_35,
      O => anodeCtrl(0)
    );
  anodeCtrl_1_OBUF : X_OBUF
    port map (
      I => anodeCtrl_1_OBUF_36,
      O => anodeCtrl(1)
    );
  anodeCtrl_2_OBUF : X_OBUF
    port map (
      I => anodeCtrl_2_OBUF_37,
      O => anodeCtrl(2)
    );
  anodeCtrl_3_OBUF : X_OBUF
    port map (
      I => anodeCtrl_3_OBUF_38,
      O => anodeCtrl(3)
    );
  NlwBlock_clocksystem_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_clocksystem_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

