#include "MyCoffeePotFunctions.h"

void TurnOnWater_CPP(COFFEEPOT_DEVICE *coffeePt_BaseAddress, unsigned char waterInputSpeed) {
#define DO_CORRECT_WAY  true

#if DO_CORRECT_WAY        //  Called “conditional compile”
     #warning(“Compiling correct code”) // Message will be issued by compiler
     // Turn on the power to water and LED
     unsigned short int currentRegisterValue = coffeePt_BaseAddress->controlRegister;
     unsigned short int updatedRegisterValue = currentRegisterValue | WATERPOWERON_BIT | LEDPOWERON_BIT;
     updatedRegisterValue = updatedRegisterValue | LED_WATERPOWER_BIT | LED_LEDPOWERON_BIT ;

     // SET WATER FLOW RATE
     coffeePt_BaseAddress->waterInFlowRegister = waterInputSpeed;
     UpdateSimulationDisplay( );

     // TURN ON WATER
     coffeePt_BaseAddress->controlRegister = updatedRegisterValue ;
     UpdateSimulationDisplay( );

#else
     // Will show C++ code with common mistakes when writing “device peripheral code”
    #warning(“Compiling incorrect code”) // Message will be issued by compiler
// Turn on the power to water and LED
     unsigned short int newValue = WATERPOWERON_BIT  | LEDPOWERON_BIT | LED_WATERPOWER_BIT | LED_LEDPOWERON_BIT;

     coffeePt_BaseAddress->controlRegister = newValue ;
     UpdateSimulationDisplay( );

     coffeePt_BaseAddress->waterInFlowRegister = waterInputSpeed;
     UpdateSimulationDisplay( );

#endif

}

void TurnOnHeat_CPP(COFFEEPOT_DEVICE *coffeePot_BaseAddress, unsigned char heaterLevel, unsigned char heaterBoost)
{
#define DO_CORRECT_WAY true

#if DO_CORRECT_WAY
#warning("Compiling Correct Code")
	unsigned short int currentRegisterValue = coffeePot_BaseAddress->controlRegister;
	unsigned short int updatedRegisterValue = currentRegisterValue | HEATERPOWERON_BIT;
	updatedRegisterValue = updatedRegisterValue | LED_HEATERPOWERON_BIT;

	// Set Water Flow Rate to 0
	coffeePot_BaseAddress->waterInFlowRegister = 0;

	// Set Heat Level and Boost Level for Heater
	coffeePot_BaseAddress->heaterRegister = heaterLevel;
	coffeePot_BaseAddress->heaterBoostRegister = heaterBoost;
	UpdateSimulationDisplay();

	// Turn on Heat
	coffeePot_BaseAddress->controlRegister = updatedRegisterValue;
	UpdateSimulationDisplay();

#else
#warning("Compiling Incorrect Code")
	unsigned short int newValue = HEATERPOWERON_BIT | LED_HEATERPOWERON_BIT;

	coffeePot_BaseAddress->controlRegister = newValue;
	UpdateSimulationDisplay();

	coffeePot_BaseAddress->heaterRegister = heaterLevel;
	UpdateSimulationDisplay();

#endif
}

void TurnOnCoffee_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress)
{
	// BIT MASK FOR COFFEE POD
	unsigned short int currentRegisterValue = coffeePot_BaseAddress->controlRegister;
	unsigned short int updatedRegisterValue = currentRegisterValue | COFFEE_INSERT_BIT;

	// TURN HEAT DOWN LOW
	coffeePot_BaseAddress->heaterBoostRegister = 1;
	coffeePot_BaseAddress->heaterRegister = 1;

	// TURN ON COFFEE
	coffeePot_BaseAddress->controlRegister = updatedRegisterValue;
	printf("\n\tCoffee Pod Initialized: Coffee Intensity 42/42\n\n");
	UpdateSimulationDisplay();
}

void PrepareTheCoffeePot_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress)
{

		// BIT MASK FOR INITIALIZATION
		unsigned short int currentRegisterValue = coffeePot_BaseAddress->controlRegister;
		unsigned short int updatedRegisterValue = currentRegisterValue | INITandSTAYPOWEREDON_BIT;
		updatedRegisterValue = updatedRegisterValue | LED_POWERON_BIT;

		bool deviceReady = false;

		// TURN ON INIT BIT
		coffeePot_BaseAddress->controlRegister = updatedRegisterValue;
		UpdateSimulationDisplay();

		// WAIT UNTIL DEVICE READY BIT IS SET
		while(!deviceReady)
		{
			UpdateSimulationDisplay();
			if(((coffeePot_BaseAddress->controlRegister & DEVICE_READY_BIT_RO) ^ DEVICE_READY_BIT_RO) == 0x0)
				deviceReady = true;
			else
				deviceReady = false;
		}
}

