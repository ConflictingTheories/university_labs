/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		Assignment2_Main.h			*
\***********************************/

#include "Updated_CoffeePotFunctions.h"
#include "myCoffeePotFunctions.h"

#ifndef _ASSN2_MAIN_H
#define _ASSN2_MAIN_H

// Figure Out Empirically
	// MAX VOLUME
#define MAXVOLUME1 		300
#define MAXVOLUME2		300
	// MAX TEMP
#define MAXTEMP			90
	// HEAT
#define HEATLEVEL1		200
#define HEATLEVEL2		200
	// WATER
#define WATERRATE1		50
#define WATERRATE2		50
	// BOOST
#define BOOSTRATE1		15
#define BOOSTRATE2		15

// Semaphores for Control Signals
static volatile bool SW1_isPressed = false;
static volatile bool SW2_isPressed = false;
static volatile bool SW3_isPressed = false;
static volatile bool SW4_isPressed = false;

// Semaphores for Coffee Pot Devices
static volatile COFFEEPOT_DEVICE* CoffeePots[2];
static volatile int HeaterLevel[2] 	= {HEATLEVEL1, HEATLEVEL2};
static volatile int WaterRate[2] 	= {WATERRATE1, WATERRATE2};
static volatile int BoostRate[2] 	= {BOOSTRATE1, BOOSTRATE2};

// Semaphores for Coffee Pot Status
static volatile bool DeviceReady[2] = {false, false};
static volatile bool LEDPower[2] 	= {false, false};
static volatile bool CoffeePower[2] = {false, false};
static volatile bool WaterPower[2]	= {false, false};
static volatile bool HeaterPower[2] = {false, false};
static volatile int Temperature[2] 	= {};
static volatile int WaterLevel[2] 	= {};

#endif
