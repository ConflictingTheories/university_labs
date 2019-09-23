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
#include "Updated_CoffeePot_SimulatorFunctions.h"
#include "myCoffeePotFunctions.h"

// TODO - ISR Function for WDOG
//#pragma interrupt
//void ISR_WDog_Function(void)
EX_INTERRUPT_HANDLER(ISR_WDog_Function)
{
	// TODO
}

//#pragma interrupt
//void ISR_CoreTimer_Function(void)
EX_INTERRUPT_HANDLER(ISR_CoreTimer_Function)
{
	//Reset Watchdog Timer
	*pWDOG_CTL = (0x0AD0) | (0x0004);

	// Measure Temperature of Pots
	Temperature[0] = CurrentTemperatureRequest(CoffeePots[0]);
	Temperature[1] = CurrentTemperatureRequest(CoffeePots[1]);

	// Measure Water Level of Pots
	WaterLevel[0] = WaterLevelRequest(CoffeePots[0]);
	WaterLevel[1] = WaterLevelRequest(CoffeePots[1]);

	// Update Simulation
	UpdateSimulationDisplay();

	//Reload Counter
	*pWDOG_CNT = TIMER_PERIOD;
	//Restart Watchdog Timer
	*pWDOG_CTL &= (~0x0FF0);
	// Force Write
	Ssync();
}

// GPIO Interrupt Service Routine
//#pragma interrupt
//void ISR_GPIO_Function(void)
EX_INTERRUPT_HANDLER(ISR_GPIO_Function)
{
	// Read Switches
	unsigned short currentSwitchValue = Read_Switches();

	// Acknowledge Interrupt
	*pFIO_FLAG_D &= (~0x0F00);
	// Force Write
	Ssync();

	// SW1 - Toggle Bool
	if((currentSwitchValue & (SW1_BITMASK)) == (SW1_BITMASK))
	{
		SW1_isPressed = (!SW1_isPressed);
	}
	//else
		//SW1_isPressed = false;

	// SW2 - Toggle Bool
	if((currentSwitchValue & (SW2_BITMASK)) == (SW2_BITMASK))
	{
		SW2_isPressed = (!SW2_isPressed);
	}
	//else
		//SW2_isPressed = false;

	// SW3 - Toggle Bool
	if((currentSwitchValue & (SW3_BITMASK)) == (SW3_BITMASK))
	{
		SW3_isPressed = (!SW3_isPressed);
	}
	//else
		//SW3_isPressed = false;

	// SW4 - Toggle Bool
	if((currentSwitchValue & (SW4_BITMASK)) == (SW4_BITMASK))
	{
		SW4_isPressed = (!SW4_isPressed);
	}
	//else
		//SW4_isPressed = false;
}
