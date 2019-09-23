--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.28xd
--  \   \         Application: netgen
--  /   /         Filename: ENEL453Lab1Circ1_timesim.vhd
-- /___/   /\     Timestamp: Fri Jan 18 14:42:48 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 5 -pcf ENEL453Lab1Circ1.pcf -rpw 100 -tpw 0 -ar Structure -tm ENEL453Lab1Circ1 -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim ENEL453Lab1Circ1.ncd ENEL453Lab1Circ1_timesim.vhd 
-- Device	: 3s100ecp132-5 (PRODUCTION 1.27 2012-07-09)
-- Input file	: ENEL453Lab1Circ1.ncd
-- Output file	: \\engfs.eng.ad.ucalgary.ca\home\kderbyma\ENEL453\ENEL453Lab1_Circuit1\netgen\par\ENEL453Lab1Circ1_timesim.vhd
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
  signal A_IBUF_18 : STD_LOGIC; 
  signal B_IBUF_19 : STD_LOGIC; 
  signal A_INBUF : STD_LOGIC; 
  signal B_INBUF : STD_LOGIC; 
  signal X_O : STD_LOGIC; 
  signal Y_O : STD_LOGIC; 
  signal Y_OBUF_71 : STD_LOGIC; 
  signal X_OBUF_62 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
begin
  A_IBUF : X_BUF
    generic map(
      LOC => "PAD52",
      PATHPULSE => 694 ps
    )
    port map (
      I => A,
      O => A_INBUF
    );
  B_IBUF : X_BUF
    generic map(
      LOC => "PAD54",
      PATHPULSE => 694 ps
    )
    port map (
      I => B,
      O => B_INBUF
    );
  X_OBUF_30 : X_OBUF
    generic map(
      LOC => "PAD51"
    )
    port map (
      I => X_O,
      O => X
    );
  Y_OBUF : X_OBUF
    generic map(
      LOC => "PAD53"
    )
    port map (
      I => Y_O,
      O => Y
    );
  B_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD54",
      PATHPULSE => 694 ps
    )
    port map (
      I => B_INBUF,
      O => B_IBUF_19
    );
  A_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD52",
      PATHPULSE => 694 ps
    )
    port map (
      I => A_INBUF,
      O => A_IBUF_18
    );
  X1 : X_LUT4
    generic map(
      INIT => X"AA00",
      LOC => "SLICE_X31Y2"
    )
    port map (
      ADR0 => B_IBUF_19,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => A_IBUF_18,
      O => X_OBUF_62
    );
  Mxor_Y_Result1 : X_LUT4
    generic map(
      INIT => X"55AA",
      LOC => "SLICE_X31Y2"
    )
    port map (
      ADR0 => B_IBUF_19,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => A_IBUF_18,
      O => Y_OBUF_71
    );
  X_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD51",
      PATHPULSE => 694 ps
    )
    port map (
      I => X_OBUF_62,
      O => X_O
    );
  Y_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD53",
      PATHPULSE => 694 ps
    )
    port map (
      I => Y_OBUF_71,
      O => Y_O
    );
  NlwBlock_ENEL453Lab1Circ1_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

