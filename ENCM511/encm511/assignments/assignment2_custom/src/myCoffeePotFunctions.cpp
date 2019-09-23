/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		myCoffeePotFunctions.cpp	*
\***********************************/

#include <stdio.h>
#include "myBlackfin.h"
#include "myCoffeePotFunctions.h"

#define INIT_COFFEEPOT			(1<<0)
#define LEDPOWER				(1<<1)
#define WATERPOWER				(1<<2)
#define HEATERPOWER				(1<<3)
#define DEVICEREADY				(1<<4)

// Turn On Coffee Pot
void TurnOnCoffeePot(COFFEEPOT_DEVICE* baseAddress)
{
	// Read Register Value
	unsigned short int currentRegisterValue = baseAddress->controlRegister;
	// Set to New Control Value (Initialize and Power On)
	unsigned short int updatedRegisterValue = currentRegisterValue | INIT_COFFEEPOT | LED_POWER;
	updatedRegisterValue = updatedRegisterValue | POWER_LED | LEDPOWER_LED;
	// Update Register
	baseAddress->controlRegister = updatedRegisterValue;
	// Force Write
	Ssync();
}

// Turn Off Coffee Pot
void TurnOffCoffeePot(COFFEEPOT_DEVICE* baseAddress)
{
	// Read in Current Register Value
	unsigned short int currentRegisterValue = baseAddress->controlRegister;
	// Turn Off Power to Coffee Pot
	unsigned short int updatedRegisterValue = currentRegisterValue & (~INIT_COFFEEPOT) & (~LED_POWER);
	updatedRegisterValue = updatedRegisterValue & (~POWER_LED) & (~LEDPOWER_LED);
	// Update Register
	baseAddress->controlRegister = updatedRegisterValue;
	// Force Write
	Ssync();
}

// Set Water Flow Rate
void SetWaterRate(COFFEEPOT_DEVICE* baseAddress, unsigned char Rate)
{
	// Set Water Flow Rate
	baseAddress->waterInFlowRegister = Rate;
	// Force Write
	Ssync();
}

// Turn On Water
void TurnOnWater(COFFEEPOT_DEVICE* baseAddress)
{
	// Turn on the power to water and LED
     unsigned short int currentRegisterValue = baseAddress->controlRegister;
     unsigned short int updatedRegisterValue = currentRegisterValue | WATERPOWER;
     updatedRegisterValue = updatedRegisterValue | WATER_LED ;
     // Update Control Register
     baseAddress->controlRegister = updatedRegisterValue ;
     // Force Write
     Ssync();
}

// Turn Off Water
void TurnOffWater(COFFEEPOT_DEVICE* baseAddress)
{
	// Turn off the power to water and LED
     unsigned short int currentRegisterValue = baseAddress->controlRegister;
     unsigned short int updatedRegisterValue = currentRegisterValue & (~WATERPOWER);
     updatedRegisterValue = updatedRegisterValue & (~WATER_LED) ;
     // Update Control Register
     baseAddress->controlRegister = updatedRegisterValue ;
     // Force Write
     Ssync();
}

// Set Heater Rate
void SetHeaterRate(COFFEEPOT_DEVICE* baseAddress, unsigned char Rate, unsigned char Boost)
{
	// Set Heater Flow Rate
	baseAddress->heaterRegister = Rate;
	// Set Heater Boost Rate
	baseAddress->heaterBoostRegister = Boost;
	// Force Write
	Ssync();
}

// Turn On Heater
void TurnOnHeater(COFFEEPOT_DEVICE* baseAddress)
{
	// Turn on the power to Heater and LED
     unsigned short int currentRegisterValue = baseAddress->controlRegister;
     unsigned short int updatedRegisterValue = currentRegisterValue | HEATERPOWER;
     updatedRegisterValue = updatedRegisterValue | HEATER_LED ;
     // Update Control Register
     baseAddress->controlRegister = updatedRegisterValue ;
     // Force Write
     Ssync();
}

// Turn Off Heater
void TurnOffHeater(COFFEEPOT_DEVICE* baseAddress)
{
	// Turn off the power to heater and LED
     unsigned short int currentRegisterValue = baseAddress->controlRegister;
     unsigned short int updatedRegisterValue = currentRegisterValue & (~HEATERPOWER);
     updatedRegisterValue = updatedRegisterValue & (~HEATER_LED) ;
     // Update Control Register
     baseAddress->controlRegister = updatedRegisterValue ;
     // Force Write
     Ssync();
}

// Insert Coffee
void Insert_Coffee(COFFEEPOT_DEVICE* baseAddress)
{
	// Insert Coffee to the pot
	unsigned short int currentRegisterValue = baseAddress->controlRegister;
	unsigned short int updatedRegisterValue = currentRegisterValue | COFFEE_INSERT;
	// Turn Heat Down Low
	SetHeaterRate(baseAddress, 0, 1);
	// Turn Water Flow Low
	SetWaterRate(baseAddress, 0);
	// Update Control Register
	baseAddress->controlRegister = updatedRegisterValue;
	// Force Write
	Ssync();
}
