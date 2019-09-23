#include "MyCoffeePotFunctions.h"        // Prototypes of functions you will build

void Do_Simulation_CPP(COFFEEPOT_DEVICE *baseAddress)
{
   PrepareTheCoffeePot_CPP(baseAddress);
   UpdateSimulationDisplay( );  // Update after write
   // In assigment 2 we will make the update automatic by learning how to use interrupts

   // TURN ON WATER
#define USE_C_TURNONWATER_CODE 0
   unsigned char waterFlowRate = 75;
#if USE_C_TURNONWATER_CODE
   TurnOnWater_CPP(baseAddress, waterFlowRate);                      // *** Need to add a MyFunction prototype and stub
#else
   TurnOnWater_ASM(baseAddress, waterFlowRate);// *** Need to add a MyFunction prototype and stub
#endif
   UpdateSimulationDisplay( ); // Update after write // Keep water filling

   // TURN ON HEAT
#define USE_C_TURNONHEAT_CODE 0
   unsigned char heaterLevel = 200;
   unsigned char heaterBoost = 15;
   for(int i=1;i<9;i++)
   {
#if USE_C_TURNONHEAT_CODE
   TurnOnHeat_CPP(baseAddress, heaterLevel, heaterBoost);
#else
   TurnOnHeat_ASM(baseAddress, heaterLevel, heaterBoost);
#endif
   UpdateSimulationDisplay( ); // Update after write // Keep Heater Going
   }
   // TURN ON COFFEE POD
#define USE_C_TURNONCOFFEE_CODE 1
#if USE_C_TURNONCOFFEE_CODE
   TurnOnCoffee_CPP(baseAddress);
#else
   TurnOnCoffee_ASM(baseAddress);	// TODO - TurnOnCoffee_ASM
#endif
   UpdateSimulationDisplay( ); // Update after write

// Remove_CoffeePotFromSystem(baseAddress);    // Eject    // *** Need to add a System prototype and stub
}


// TODO - Must Add in control to measure volume, Measure Heat, Maintain heat, and Actually Heat Up, and then to shutdown
