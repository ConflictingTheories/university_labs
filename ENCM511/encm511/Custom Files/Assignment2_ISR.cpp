/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		Assignment2_ISR.cpp		*
\***********************************/

#include "myBlackfin.h"
#include "Assignment2_ISR.h"
#include "Assignment2_Main.h"
#include "Updated_CoffeePotFunctions.h"
#include "myCoffeePotFunctions.h"

// TODO - ISR Function for WDOG
void ISR_WDog_Function(void)
{
	// Measure Temperature of Pots
	Temperature[0] = RequestTemperature(CoffeePots[0]);
	Temperature[1] = RequestTemperature(CoffeePots[1]);

	// Measure Water Level of Pots
	WaterLevel[0] = RequestWaterLevel(CoffeePots[0]);
	WaterLevel[1] = RequestWaterLevel(CoffeePots[1]);

	// Update Simulation
	UpdateSimulation();

	// TODO - May need to Deactivate Interrupt Bit Too?

	//Reset Watchdog Timer
	*pWDOG_CTL = 0x0AD0;
	//Set Proper Interrupt (GP)
	*pWDOG_CTL |= 0x0004;
	//Restart Watchdog Timer
	*pWDOG_CTL &= (~0x0FF0);
}

// TODO - ISR Function for GPIO
void ISR_GPIO_Function(void)
{

	// Read Switches
	unsigned short int currentSwitchValue = Read_Switches();

	// Set Appropriate Switch Semaphores

	// SW1
	if(currentSwitchValue & (SW1_BITMASK >> 8) == (SW1_BITMASK >> 8))
		SW1_isPressed = true;
	else
		SW1_isPressed = false;

	// SW2
	if(currentSwitchValue & (SW2_BITMASK >> 8) == (SW2_BITMASK >> 8))
		SW2_isPressed = true;
	else
		Sw2_isPressed = false;

	// SW3
	if(currentSwitchValue & (SW3_BITMASK >> 8) == (SW3_BITMASK >> 8))
		SW3_isPressed = true;
	else
		SW3_isPressed = false;

	// SW4
	if(currentSwitchValue & (SW4_BITMASK >> 8) == (SW4_BITMASK >> 8))
		SW4_isPressed = true;
	else
		SW4_isPressed = false;

	// TODO
	// Reset Interrupts as Necessary

}