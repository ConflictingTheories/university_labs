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
#include "Updated_CoffeePotFunctions.h"

#ifndef _MY_COFFEEPOT_FUNC_H
#define _MY_COFFEEPOT_FUNC_H

// COFFEEPOT CONTROL BITMASKS
#define INIT_COFFEEPOT			(1<<0)
#define LEDPOWER				(1<<1)
#define WATERPOWER				(1<<2)
#define HEATERPOWER				(1<<3)
#define DEVICEREADY				(1<<4)

// COFFEEPOT LED CONTROL BITMASKS
#define LED_OFFSET				12
#define COFFEE_LED1				(1<<(LED_OFFSET+0))	
#define COFFEE_LED2				(1<<(LED_OFFSET+1))
#define COFFEE_LED3				(1<<(LED_OFFSET+2))
#define COFFEE_LED4				(1<<(LED_OFFSET+3))

// FUNCTION DECLARATIONS

// Init Coffee Pot
void Init_CoffeePot(COFFEEPOT_DEVICE* baseAddress);

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