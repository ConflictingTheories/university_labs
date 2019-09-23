/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		myCoffeePotFunctions.h		*
\***********************************/

#include <stdio.h>
#include "Updated_CoffeePot_SimulatorFunctions.h"

#ifndef _MY_COFFEEPOT_FUNC_H
#define _MY_COFFEEPOT_FUNC_H

// COFFEEPOT CONTROL BITMASKS
#define INIT_COFFEEPOT			(1<<0)				//	(0x0001)
#define LED_POWER				(1<<1)				//	(0x0002)
#define WATER_POWER				(1<<2)				//	(0x0004)
#define HEATER_POWER			(1<<3)				//	(0x0008)
#define DEVICEREADY				(1<<4)				//	(0x0010)
#define COFFEE_INSERT			(1<<11)				//	(0x0800)

// COFFEEPOT LED CONTROL BITMASKS
#define LED_OFFSET				12					// 	Bit 12
#define COFFEE_LED1				(1<<(LED_OFFSET+0))	// 	(0x1000)
#define COFFEE_LED2				(1<<(LED_OFFSET+1))	// 	(0x2000)
#define COFFEE_LED3				(1<<(LED_OFFSET+2))	// 	(0x4000)
#define COFFEE_LED4				(1<<(LED_OFFSET+3))	// 	(0x8000)

// DEFINE ALIAS FOR LEDS
#define POWER_LED				COFFEE_LED1
#define LEDPOWER_LED			COFFEE_LED2
#define WATER_LED				COFFEE_LED3
#define HEATER_LED				COFFEE_LED4

// FUNCTION DECLARATIONS

// Init Coffee Pot
void Init_CoffeePot(COFFEEPOT_DEVICE* baseAddress);

// Turn On Coffee Pot
void TurnOnCoffeePot(COFFEEPOT_DEVICE* baseAddress);

// Turn Off Coffee Pot
void TurnOffCoffeePot(COFFEEPOT_DEVICE* baseAddress);

// Set Water Flow Rate
void SetWaterRate(COFFEEPOT_DEVICE* baseAddress, unsigned char Rate);

// Turn On Water
void TurnOnWater(COFFEEPOT_DEVICE* baseAddress);

// Turn Off Water
void TurnOffWater(COFFEEPOT_DEVICE* baseAddress);

// Set Heater Rate
void SetHeaterRate(COFFEEPOT_DEVICE* baseAddress, unsigned char Rate, unsigned char Boost);

// Turn On Heater
void TurnOnHeater(COFFEEPOT_DEVICE* baseAddress);

// Turn Off Heater
void TurnOffHeater(COFFEEPOT_DEVICE* baseAddress);

// Insert Coffee
void Insert_Coffee(COFFEEPOT_DEVICE* baseAddress);

#endif
