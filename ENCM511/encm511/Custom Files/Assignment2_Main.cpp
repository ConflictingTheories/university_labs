/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		Assignment2_Main.cpp		*
\***********************************/

#include <stdio.h>
#include <sys\exception.h>
#include "myBlackfin.h"
#include "Updated_CoffeePotFunctions.h"
#include "myCoffeePotFunctions.h"
#include "Assignment2_Main.h"
#include "Assignment2_ISR.h"

// Enumerate Coffee Pots
enum{COFFEPOT1=1, COFEEPOT2};

// Main Coffee Pot Function
void main(void)
{
	//Setup Coffee Pot Devices
	int numCoffeePots = 2;

	// Prepare Simulation for # of Coffee Pots
	Init_CoffeePotSimulation(numCoffeePots);

	//Initialize CoffeePots
	COFFEEPOT_DEVICE* baseAddress1 = Add_CoffeePotToSystem_PlugAndPlay(COFFEPOT1, "Kyle42");
	COFFEEPOT_DEVICE* baseAddress2 = Add_CoffeePotToSystem_PlugAndPlay(COFFEPOT2, "LzmfDr.Who");

	//Initialize Coffee Pot Array
	CoffeePots[0] = baseAddress1;
	CoffeePots[1] = baseAddress2;

	//Initialize Blackfin Flash Memory
	Init_Flash();

	//Initialize Blackfin LEDS
	Init_LED();			

	//Initialize Blackfin Switches
	Init_Switches(); 	

	//## Setup Interrupts (Timer)
	
	//Stop Timer Interrupts
	Stop_WDOG_Int();	
	
	//Setup Timer Interrupts (Passing Coffee Pot Array, and Period)
	Setup_WDOG_Int(ISR_WDog_Function, WDOG_PERIOD);
	
	//Start Timer Interrupts
	Start_WDOG_Int();

	//## Setup Interrupts (Switches)

	//Stop Switch Interrupts
	Stop_GPIO_Int();	
	//Setup Switch Interrupts
	Setup_GPIO_Int(ISR_GPIO_Function);	
	//Start Switch Interrupts
	Start_GPIO_Int();	


	//Main Super Loop
	while(!SW4_isPressed)
	{
		// If SW1 is Pressed, Initialize Devices
		if(SW1_isPressed)
		{
			if(!DeviceReady[0] || !DeviceReady[1])
			{
				// Conditional
				bool finished = false;

				// Intialize Coffee Pots
				Init_CoffeePot(baseAddress1);
				Init_CoffeePot(baseAddress2);

				// Wait until Devices Initialized
				while(!finished)
				{
					// Check for Device Ready Bits to be Set
					if(((baseAddress1->controlRegister & DEVICEREADY) == DEVICEREADY) && ((baseAddress1->controlRegister & DEVICEREADY) == DEVICEREADY))
					{
						finished = true;
					}
					else
					{
						finished = false;
					}

				}
				// Set Devices to Ready
				DeviceReady[0] = true;
				DeviceReady[1] = true;
			}

		}
		else
		{
			// If SW1 is Released, Turn off Coffee Pot
			TurnOffCoffeePot(baseAddress1);
			TurnOffCoffeePot(baseAddress2);
		}

		// If SW2 is Pressed, Start Water Flowing
		if((DeviceReady[0] && DeviceReady[1]) && SW2_isPressed)
		{
			int WaterLevel1 = RequestWaterLevel(baseAddress1);
			int WaterLevel2 = RequestWaterLevel(baseAddress2);

			// If POT 1 IS BELOW MAX, KEEP FILLING
			if ((Waterlevel1 < MAXVOLUME1))
			{
				SetWaterRate(baseAddress1, WATERRATE1);
				TurnOnWater(baseAddress1);
			}
			else
			{
				// Reduce Flow if Full
				SetWaterRate(baseAddress1, 0);
			}

			// If POT 2 IS BELOW MAX, KEEP FILLING
			if ((Waterlevel1 < MAXVOLUME2))
			{
				SetWaterRate(baseAddress2, WATERRATE2)
				TurnOnWater(baseAddress2);
			}
			else
			{
				// Reduce Flow if Full
				SetWaterRate(baseAddress2, 0)			
			}
		}
		else
		{
			// If SW2 is released, Turn off Water
			TurnOffWater(baseAddress1);
			TurnOffWater(baseAddress2);
		}

		// If SW3 is Pressed, Start Heater Going
		if((DeviceReady[0] && DeviceReady[1]) && SW2_isPressed)
		{
			int Temperature1 = RequestTemperature(baseAddress1);
			int Temperature2 = RequestTemperature(baseAddress2);

			// If POT 1 IS BELOW MAX, KEEP FILLING
			if ((HeaterLevel1 < MAXTEMP))
			{
				SetHeaterRate(baseAddress1, HEATRATE1, BOOSTRATE1);
				TurnOnHeater(baseAddress1);
			}
			else
			{
				// Set Heat To Low
				SetHeaterRate(baseAddress1, 1, 1);
			}

			// If POT 2 IS BELOW MAX, KEEP FILLING
			if ((HEaterlevel1 < MAXTEMP))
			{
				SetHeaterRate(baseAddress2, HEATERRATE2, BOOSTRATE2);
				TurnOnHeater(baseAddress2);
			}
			else
			{
				// Set Heat to Low
				SetHeaterRate(baseAddress2, 1, 1);		
			}
		}
		else
		{
			// If SW3 is released, Turn off Heater
			TurnOffHeater(baseAddress1);
			TurnOffHeater(baseAddress2);
		}

		// If Temperature and Water are at Proper Levels
		// Start the Coffee Pod and Make Coffee
		if((WaterLevel[0] >= MAXVOLUME1) && (Temperature[0] >= MAXTEMP))
		{
			// Start Coffee Pod for Coffee Pot 1
			Insert_Coffee(baseAddress1);
		}

		if((WaterLevel[1] >= MAXVOLUME2) && (Temperature[1] >= MAXTEMP))
		{
			// Start Coffee Pod for Coffee Pot 2
			Insert_Coffee(baseAddress2);
		}
		
	}

	// STOP WDOG INTERRUPT
	Stop_WDOG_Int();

	// STOP GPIO INTERRUPT
	Stop_GPIO_Int();

	// Eject Coffee Pots From System after SW4 is Pressed
	Remove_CoffeePotFromSystem(baseAddress1);
	Remove_CoffeePotFromSystem(baseAddress2);
}

