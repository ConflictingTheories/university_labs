--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.28xd
--  \   \         Application: netgen
--  /   /         Filename: ENEL453Lab1Circ1_synthesis.vhd
-- /___/   /\     Timestamp: Fri Jan 18 14:49:08 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm ENEL453Lab1Circ1 -w -dir netgen/synthesis -ofmt vhdl -sim ENEL453Lab1Circ1.ngc ENEL453Lab1Circ1_synthesis.vhd 
-- Device	: xc3s100e-5-cp132
-- Input file	: ENEL453Lab1Circ1.ngc
-- Output file	: \\engfs.eng.ad.ucalgary.ca\home\kderbyma\ENEL453\ENEL453Lab1_Circuit1\netgen\synthesis\ENEL453Lab1Circ1_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: ENEL453Lab1Circ1
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
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity ENEL453Lab1Circ1 is
  port (
    A : in STD_LOGIC := 'X'; 
    B : in STD_LOGIC := 'X'; 
    X : out STD_LOGIC; 
    Y : out STD_LOGIC 
  );
end ENEL453Lab1Circ1;

architecture Structure of ENEL453Lab1Circ1 is
  signal A_IBUF_1 : STD_LOGIC; 
  signal B_IBUF_3 : STD_LOGIC; 
  signal X_OBUF_0 : STD_LOGIC; 
  signal Y_OBUF_7 : STD_LOGIC; 
begin
  X1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => A_IBUF_1,
      I1 => B_IBUF_3,
      O => X_OBUF_0
    );
  Mxor_Y_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => B_IBUF_3,
      I1 => A_IBUF_1,
      O => Y_OBUF_7
    );
  A_IBUF : IBUF
    port map (
      I => A,
      O => A_IBUF_1
    );
  B_IBUF : IBUF
    port map (
      I => B,
      O => B_IBUF_3
    );
  X_OBUF_5 : OBUF
    port map (
      I => X_OBUF_0,
      O => X
    );
  Y_OBUF : OBUF
    port map (
      I => Y_OBUF_7,
      O => Y
    );

end Structure;

