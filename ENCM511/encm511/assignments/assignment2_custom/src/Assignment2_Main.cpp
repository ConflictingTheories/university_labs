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
#include <cdefbf533.h>
#include "myBlackfin.h"
#include "Updated_CoffeePot_SimulatorFunctions.h"
#include "myCoffeePotFunctions.h"
#include "Assignment2_Main.h"
#include "Assignment2_ISR.h"

// Semaphores for Control Signals
static volatile bool SW1_isPressed = false;
static volatile bool SW2_isPressed = false;
static volatile bool SW3_isPressed = false;
static volatile bool SW4_isPressed = false;

// Semaphores for Coffee States
static volatile bool WaterOn[2] = {false, false};
static volatile bool HeatOn[2] = {false, false};

// Global Coffee Pot Array
static COFFEEPOT_DEVICE* CoffeePots[2] = {};

// Semaphores for Coffee Pot Devices
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

// Enumerate Coffee Pots
enum{COFFEEPOT1=1, COFFEEPOT2};

// Main Coffee Pot Function
void main(void)
{
	//Setup Coffee Pot Devices
	int numCoffeePots = 2;

	// Select Display Type
	int whichDisplay = USE_TEXT_GUI;// | USE_CCES_GUI; // USE_TEXT_GUI | USE_SPI_GUI | USE_CCES_GUI;

	// Prepare Simulation for # of Coffee Pots
	Init_CoffeePotSimulation(numCoffeePots, (WHICHDISPLAY) whichDisplay);

	//Initialize CoffeePots
	COFFEEPOT_DEVICE* baseAddress1 = Add_CoffeePotToSystem_PlugAndPlay(COFFEEPOT1, "Kyle42");
	COFFEEPOT_DEVICE* baseAddress2 = Add_CoffeePotToSystem_PlugAndPlay(COFFEEPOT2, "LzmfDr.Who");

	//Initialize Coffee Pot Array
	CoffeePots[0] = baseAddress1;
	CoffeePots[1] = baseAddress2;

	// Print Welcome Statement
	printf("Thank you for choosing Blackfin Coffee: available exclusively at the 'Restaurant at the End of the Universe'.\n\n");

	printf("About to Start Brewing Coffee from out of this world!\n\n");

	//Initialize Blackfin Flash Memory
	Init_Flash();

	//Initialize Blackfin LEDS
	Init_LED();

	//Initialize Blackfin Switches
	Init_Switches(); 	

//## Setup Interrupts (Switches)

	//Stop Switch Interrupts
	Stop_GPIO_Int();
	//Setup Switch Interrupts
	Setup_GPIO_Int(&ISR_GPIO_Function);
	register_handler(ik_ivg7, ISR_GPIO_Function);
	//Start Switch Interrupts
	Start_GPIO_Int();

//## Setup Interrupts (Timer)

	// Stop Core Timer Interrupts
	Stop_CoreTimer_Int();
	// Setup Core Timer Interrupts
	Setup_CoreTimer_Int(&ISR_CoreTimer_Function, TIMER_PERIOD);
	register_handler(ik_timer, ISR_CoreTimer_Function);
	// Start Core Timer Interrupts
	Start_CoreTimer_Int();

//## Main Super Loop
	while(!SW4_isPressed)
	{
		// If SW1 is Pressed, Initialize Devices
		if(SW1_isPressed)
		{
			if(!DeviceReady[0] || !DeviceReady[1])
			{
				// Conditional
				bool finished = false;

				// Initialize Coffee Pots
				TurnOnCoffeePot(baseAddress1);
				TurnOnCoffeePot(baseAddress2);

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
			if(DeviceReady[0] || DeviceReady[1])
			{
				TurnOffCoffeePot(baseAddress1);
				TurnOffCoffeePot(baseAddress2);
				// Device Turned Off, So Not Ready
				DeviceReady[0] = false;
				DeviceReady[1] = false;
			}
		}

		// If SW2 is Pressed, Start Water Flowing
		if((DeviceReady[0] && DeviceReady[1]) && (SW2_isPressed))
		{
			WaterLevel[0] = WaterLevelRequest(baseAddress1);
			WaterLevel[1] = WaterLevelRequest(baseAddress2);

			// If POT 1 IS BELOW MAX, KEEP FILLING
			if ((WaterLevel[0] < MAXVOLUME1))
			{
				SetWaterRate(baseAddress1, WATERRATE1);
				TurnOnWater(baseAddress1);
				WaterOn[0] = true;
			}
			else
			{
				// Reduce Flow if Full
				SetWaterRate(baseAddress1, 0);
			}

			// If POT 2 IS BELOW MAX, KEEP FILLING
			if ((WaterLevel[1] < MAXVOLUME2))
			{
				SetWaterRate(baseAddress2, WATERRATE2);
				TurnOnWater(baseAddress2);
				WaterOn[1] = true;
			}
			else
			{
				// Reduce Flow if Full
				SetWaterRate(baseAddress2, 0);
			}
		}
		else
		{
			// If SW2 is released, Turn off Water
			if(WaterOn[0] || WaterOn[1])
			{
				TurnOffWater(baseAddress1);
				TurnOffWater(baseAddress2);

				WaterOn[0] = false;
				WaterOn[1] = false;
			}
		}

		// If SW3 is Pressed, Start Heater Going
		if((DeviceReady[0] && DeviceReady[1]) && (SW3_isPressed))
		{
			Temperature[0] = CurrentTemperatureRequest(baseAddress1);
			Temperature[1] = CurrentTemperatureRequest(baseAddress2);

			// If POT 1 IS BELOW MAX, KEEP FILLING
			if ((Temperature[0] < MAXTEMP))
			{
				SetHeaterRate(baseAddress1, HEATLEVEL1, BOOSTRATE1);
				TurnOnHeater(baseAddress1);
				HeatOn[0] = true;
			}
			else
			{
				// Set Heat To Low
				SetHeaterRate(baseAddress1, 0, 1);
			}

			// If POT 2 IS BELOW MAX, KEEP FILLING
			if ((Temperature[1] < MAXTEMP))
			{
				SetHeaterRate(baseAddress2, HEATLEVEL2, BOOSTRATE2);
				TurnOnHeater(baseAddress2);
				HeatOn[1] = true;
			}
			else
			{
				// Set Heat to Low
				SetHeaterRate(baseAddress2, 0, 1);
			}
		}
		else
		{
			// If SW3 is released, Turn off Heater
			if(HeatOn[0] || HeatOn[1])
			{
				TurnOffHeater(baseAddress1);
				TurnOffHeater(baseAddress2);
				HeatOn[0] = false;
				HeatOn[1] = false;
			}
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

	// STOP CORE TIMER INTERRUPT
	Stop_CoreTimer_Int();
	// STOP GPIO INTERRUPT
	Stop_GPIO_Int();

	// Eject Coffee Pots From System after SW4 is Pressed
	Remove_CoffeePotFromSystem(baseAddress1);
	Remove_CoffeePotFromSystem(baseAddress2);
}

// CCES GUI DELAY FUNCTION
void USE_CCES_GUI_Delay(void) {
    int delay = 0xFFFF;
        for  ( int count = 0; count < delay; count++) {   // 0x1FFFFFF Seemed to work abeit slowly
            count = count + 1;
        }
}

