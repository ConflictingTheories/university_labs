/*--------------------------------------

ENCM 511 - Tutorial - Friday October 3rd


SUBJECT: Assignment #1 Overview

----------------------------------------*/

//In CCES:
//
//  Close All unrelated projects - because they have a bunch of executables
//  It will NOT necessarily be the one you want.
// --------------------------------------------------------------------------


//---------------------
// ### MyCoffeePotFunctions HEADER FILE
//  Include header files into basic project header file

#ifndef MYCOFFEEPOTFUNCTIONS_H_
#define MYCOFFEEPOTFUNCTIONS_H_

#include <stdio.h>
#include <MockDevices/CoffeePot_SimulatorFunctions.h>

void Do_Simulation_CPP(COFFEEPOT_DEVICE *coffeePot1_BaseAddress);

enum{COFFEEPOT1 = 1, COFFEEPOT2, COFFEEPOT3, COFFEEPOT4};

void PrepareTheCoffeePot_CPP(COFFEEPOT_DEVICE *coffeepotBaseAddress);

void TurnOnWater_CPP(COFFEEPOT_DEVICE * coffeepotBaseAddress, unsigned char waterLevel);

#define COFFEEPOT1 1

#endif


//-------------------


//-------------------
// ### MyCoffeePotFunctions CPP FILE
// From Online Source Available

#include "MyCoffeePotFunctions.h"

int main(void)
{
  printf("Hello World from the Blackfin\n");

  printf("\n");

  printf("About to start my coffee pot simulator.\n");

  int numCoffeePots = 2;

  int whichDisplay = USE_TEXT_GUI;

  Init_CoffeePotSimulation(numCoffeePOts, (WHICHDISPLAY) whichDisplay);

  COFFEEPOT_DEVICE *coffeePot1_BaseAddress = (COFFEEPOT_DEVICE *) NULL;

  coffeePot1_BaseAddress - Add_CoffeePotToSystem_PlugAndPlay(COFFEEPOT1, "WDS");

  ...

}
//--------------------


//--------------------
// ### MyDoSimulation CPP file
#include "MyCoffeePotFunctions.h"

void Do_Simulation_CPP(COFFEEPOT_DEVICE *coffeePotBaseAddress)
{
  //TODO - Code available online?

  PrepareTheCoffeePot_CPP(coffeePotBaseAddress);
  UpdateSimulationDisplay();


  #define USE_CPP_TURNONWATER_CODE 1
      unsigned char waterflowRate = 50;
  #if USE_CPP_TURNONWATER_CODE
      TurnOnWater_CPP(coffeepotBaseAddress, waterflowRate);
  #else
      TurnOnWater_ASM(coffeepotBaseAddress, waterflowRate);
 #endif
}

void PrepareTheCoffeePot_CPP(COFFEEPOT_DEVICE *coffeepotBaseAddress)
{
  //TODO - Code available online?
}


void TurnOnWater_CPP(COFFEEPOT_DEVICE *coffeepotBaseAddress, unsigned char waterLevel)
{
  //TODO - Code available online?
}

//-------------------------

// Do not forget to add in any necessary library functions

// Also, you may be required to include other include directories - Outside of the Project's own

