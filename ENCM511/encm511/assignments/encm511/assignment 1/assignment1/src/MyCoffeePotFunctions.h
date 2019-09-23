#include <stdio.h>
#include <MockDevices/CoffeePot_SimulatorFunctions.h>

#ifndef MyCoffeePotFunctions_h
#define MyCoffeePotFunctions_h

#define COFFEE_INSERT_BIT	0x0800

enum{COFFEEPOT1 = 1, COFFEEPOT2, COFFEEPOT3, COFFEEPOT4};

void Do_Simulation_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress);

extern "C" void Do_Simulation_ASM(COFFEEPOT_DEVICE * coffeePot_BaseAddress);

void PrepareTheCoffeePot_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress);

extern "C" void PrepareTheCoffeePot_ASM(COFFEEPOT_DEVICE * coffeePot_BaseAddress);

void TurnOnWater_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress, unsigned char waterFlowRate);

extern "C" void TurnOnWater_ASM(COFFEEPOT_DEVICE * coffeePot_BaseAddress, unsigned char waterFlowRate);

void TurnOnHeat_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress, unsigned char heaterLevel, unsigned char heaterBoost);

extern "C" void TurnOnHeat_ASM(COFFEEPOT_DEVICE * coffeePot_BaseAddress, unsigned char heaterLevel, unsigned char heaterBoost);

void TurnOnCoffee_CPP(COFFEEPOT_DEVICE * coffeePot_BaseAddress);

extern "C" void TurnOnCoffee_ASM(COFFEEPOT_DEVICE * coffeePot_BaseAddress);

#endif
