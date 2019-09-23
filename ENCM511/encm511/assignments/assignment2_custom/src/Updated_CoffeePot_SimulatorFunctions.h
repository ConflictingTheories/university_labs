/*
 * Updated CoffeePot_SimulatorFunctions.h
 *
 *  Created on: 2015-09-01
 *      Author: smithmr
 */

#ifndef COFFEPOT_SIMULATORFUNCTIONS_H_
#define COFFEPOT_SIMULATORFUNCTIONS_H_

//  GENERAL CONTROL   (Bits 4 to 0)
#define INITandSTAYPOWEREDON_BIT    (1 << 0)	// 0x0001 – Cause device to initialize (2 seconds) and stay powered up
#define LEDPOWERON_BIT            (1 << 1)		// 0x0002 – LED Power on
#define WATERPOWERON_BIT          (1 << 2)		// 0x0004 – Water control power on
#define HEATERPOWERON_BIT         (1 << 3)		// 0x0008 – Heater power on
#define DEVICE_READY_BIT_RO       (1 << 4)		// 0x0010 – Device is ready after initialization  -- RO
#define COFFEEPOD_INSERT_BIT	  (1 << 11)		// 0x0800 -- Cofffepod insertion control


// LED CONTROL   (Bits 15 to 12)  -- W1S
#define LED_CONTROL_OFFSET 12
#define LED1_BIT       (1 << (LED_CONTROL_OFFSET + 0))  // 0x1 – LED 1
#define LED2_BIT       (1 << (LED_CONTROL_OFFSET + 1)) 	// 0x2 – LED 2
#define LED3_BIT       (1 << (LED_CONTROL_OFFSET + 2)) 	// 0x4 – LED 3
#define LED4_BIT       (1 << (LED_CONTROL_OFFSET + 3)) 	// 0x8 – LED 4

// The following names are degraded for 2015
#warning "The following names are degraded for 2015 -- LED_POWERON_BIT, LED_LEDPOWERON_BIT, LED_HEATERPOWERON_BIT, LED_WATERPOWER_BIT"
#define LED_POWERON_BIT 		LED1_BIT
#define LED_LEDPOWERON_BIT 		LED2_BIT
#define LED_HEATERPOWERON_BIT	LED3_BIT
#define LED_WATERPOWER_BIT	 	LED4_BIT

#define SHOW_DEVICE_POWER_ON	LED4_BIT
#define SHOW_WATER_POWER_ON		LED3_BIT
#define SHOW_HEATER_POWER_ON	LED2_BIT
#define	SHOW_LED_POWER_ON		LED1_BIT

typedef struct COFFEEPOT_DEVICE {
       unsigned short int controlRegister;	    // A BIT pattern controlling switches 	-- OFFSET 0 bytes
       unsigned short int TIMER_upper;		// Value from (0x0000 to 0xFFFF)			-- OFFSET 2 bytes
       unsigned short int TIMER_lower;		// Value from (0x0000 to 0xFFFF)			-- OFFSET 4 bytes
       // Combine to get unsigned int TIMER =  (TIMER_upper << 16) + TIMER_lower;
       unsigned char heaterRegister;	   // A VALUE (0 to 255, 0x00 --> 0xFF)			-- OFFSET 6 bytes
       unsigned char waterInFlowRegister;	// A VALUE (0 to 255, 0x00 --> 0xFF)		-- OFFSET 7 bytes
       unsigned char heaterBoostRegister;	// A VALUE (0 to 15, 0x0 --> 0x3)			-- OFFSET 8 bytes
}  COFFEEPOT_DEVICE_REGISTER_STRUCTURE;

#if 0
typedef struct OLD_COFFEEPOT_DEVICE{
       unsigned char controlRegister;	    // A BIT pattern controlling switches
       unsigned char waterInFlowRegister;	// A VALUE (0 to 255, 0x00 --> 0xFF)
       unsigned short int TIMER_upper;		// Value from (0x0000 to 0xFFFF)
       unsigned short int TIMER_lower;		// Value from (0x0000 to 0xFFFF)
       // Combine to get unsigned int TIMER =  (TIMER_upper << 16) + TIMER_lower;
       unsigned char heaterRegister;	   // A VALUE (0 to 255, 0x00 --> 0xFF)
       unsigned char heaterBoostRegister;	// A VALUE (0 to 15, 0x0 --> 0x3)
}  OLD_COFFEEPOT_DEVICE_REGISTER_STRUCTURE;
#endif

#warning("C++ aware editor OFTEN gives false warnings with enum declared in include file\n")
	enum WHICHDISPLAY {USE_TEXT_GUI = 1, USE_CCES_GUI = 2, USE_SPI_GUI = 4};	// Make all display modes simultaneously available

	void Init_CoffeePotSimulation(int numCoffeePots, WHICHDISPLAY whichDisplay);

	COFFEEPOT_DEVICE * Add_CoffeePotToSystem_PlugAndPlay(int whichCoffeePot, char * yourName);

	void UpdateSimulationDisplay(void);
	unsigned short int ReadControlRegister_CPP(COFFEEPOT_DEVICE *baseAddress );
	void Remove_CoffeePotFromSystem(COFFEEPOT_DEVICE *baseAddress );
	void ShowDeviceRegisters(COFFEEPOT_DEVICE *newBaseAddress);

	void USE_CCES_GUI_Delay(void);

	// New functionality
	int WaterLevelRequest(COFFEEPOT_DEVICE *baseAddress);
	int CurrentTemperatureRequest(COFFEEPOT_DEVICE *baseAddress);


#endif /* COFFEPOT_SIMULATORFUNCTIONS_H_ */
