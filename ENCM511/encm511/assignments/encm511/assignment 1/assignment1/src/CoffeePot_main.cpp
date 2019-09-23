/*
 * CoffeePot_main.cpp
 *
 *  Created on: Oct 13, 2014
 *      Author: kderbyma
 */
#include "MyCoffeePotFunctions.h"
/* Managed drivers and/or services include */
#include "../system/adi_initialize.h"

int main(void) {
	/* Initialize managed drivers and/or services */
	adi_initComponents();

    printf("Hello World from the Blackfin\n");

    // Use mathematical paragraphs to separate ideas
    printf("\n");
    printf("About to start my coffee pot simulator\n");

    int numCoffeePots = 2;

    int whichDisplay = USE_TEXT_GUI | USE_CCES_GUI; // USE_TEXT_GUI | USE_SPI_GUI | USE_CCES_GUI;
    Init_CoffeePotSimulation(numCoffeePots, (WHICHDISPLAY) whichDisplay);

 //   int whichDisplayWithGUI = USE_TEXT_GUI | USE_SPI_GUI;
 //   Init_CoffeePotSimulation(numCoffeePots, (WHICHDISPLAY) whichDisplayWithGUI);

    COFFEEPOT_DEVICE *coffeePot1_BaseAddress = (COFFEEPOT_DEVICE *)NULL;
    COFFEEPOT_DEVICE *coffeePot2_BaseAddress = (COFFEEPOT_DEVICE *)NULL;

    coffeePot1_BaseAddress  = Add_CoffeePotToSystem_PlugAndPlay(COFFEEPOT1, "WDS");
    Do_Simulation_CPP(coffeePot1_BaseAddress);
    coffeePot2_BaseAddress = Add_CoffeePotToSystem_PlugAndPlay(COFFEEPOT2, "KDM");
    Do_Simulation_CPP(coffeePot2_BaseAddress);

}

void USE_CCES_GUI_Delay(void) {
    int delay = 0xFFFF;
        for  ( int count = 0; count < delay; count++) {   // 0x1FFFFFF Seemed to work abeit slowly
            count = count + 1;
        }
}



