--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.28xd
--  \   \         Application: netgen
--  /   /         Filename: ENEL453Lab1Circ1_translate.vhd
-- /___/   /\     Timestamp: Fri Jan 18 14:49:34 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm ENEL453Lab1Circ1 -w -dir netgen/translate -ofmt vhdl -sim ENEL453Lab1Circ1.ngd ENEL453Lab1Circ1_translate.vhd 
-- Device	: 3s100ecp132-5
-- Input file	: ENEL453Lab1Circ1.ngd
-- Output file	: \\engfs.eng.ad.ucalgary.ca\home\kderbyma\ENEL453\ENEL453Lab1_Circuit1\netgen\translate\ENEL453Lab1Circ1_translate.vhd
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

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
  signal X_OBUF_5 : STD_LOGIC; 
  signal Y_OBUF_7 : STD_LOGIC; 
begin
  X1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => A_IBUF_1,
      ADR1 => B_IBUF_3,
      O => X_OBUF_5
    );
  Mxor_Y_Result1 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => B_IBUF_3,
      ADR1 => A_IBUF_1,
      O => Y_OBUF_7
    );
  A_IBUF : X_BUF
    port map (
      I => A,
      O => A_IBUF_1
    );
  B_IBUF : X_BUF
    port map (
      I => B,
      O => B_IBUF_3
    );
  X_OBUF_11 : X_OBUF
    port map (
      I => X_OBUF_5,
      O => X
    );
  Y_OBUF : X_OBUF
    port map (
      I => Y_OBUF_7,
      O => Y
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

