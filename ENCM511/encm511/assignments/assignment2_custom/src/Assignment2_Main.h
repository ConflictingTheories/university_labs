/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		Assignment2_Main.h			*
\***********************************/

#include "Updated_CoffeePot_SimulatorFunctions.h"
#include "myCoffeePotFunctions.h"

#ifndef _ASSN2_MAIN_H
#define _ASSN2_MAIN_H

// Figure Out Empirically
	// MAX VOLUME
#define MAXVOLUME1 		250
#define MAXVOLUME2		250
	// MAX TEMP
#define MAXTEMP			85
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
extern static volatile bool SW1_isPressed;
extern static volatile bool SW2_isPressed;
extern static volatile bool SW3_isPressed;
extern static volatile bool SW4_isPressed;

// Semaphores for Coffee States
extern static volatile bool WaterOn[2];
extern static volatile bool HeatOn[2];

// Global Coffee Pot Array
extern static COFFEEPOT_DEVICE* CoffeePots[2];

// Semaphores for Coffee Pot Devices
extern static volatile int HeaterLevel[2];
extern static volatile int WaterRate[2];
extern static volatile int BoostRate[2];

// Semaphores for Coffee Pot Status
extern static volatile bool DeviceReady[2];
extern static volatile bool LEDPower[2];
extern static volatile bool CoffeePower[2];
extern static volatile bool WaterPower[2];
extern static volatile bool HeaterPower[2];
extern static volatile int Temperature[2];
extern static volatile int WaterLevel[2];

#endif
