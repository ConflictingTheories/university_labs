// LOCAL VARIABLE DECLARATIONS
.section data1

// PROGRAM INSTRUCTIONS
.section program

//void TurnOnWater_ASM(COFFEEPOT_DEVICE *coffeePt_BaseAddress, unsigned char waterInputSpeed) {
.global _TurnOnWater_ASM;

// INPUT PARAMETERS
#define PAR1_R0 R0
#define PAR2_R1 R1

// TEMPORARY REGISTERS
#define TEMP_R2 R2
#define TEMP_R3 R3

// COFFEEPOT_DEVICE * BaseAddress
#define COFFEEPOT_DEVICE_P0 P0

// CONTROL REGISTER OFFSETS
#define CONTROLREGISTER_OFFSET	0
#define WATERINFLOWREGISTER_OFFSET 	7
#define HEATERREGISTER_OFFSET	6
#define HEATERBOOST_OFFSET		8
#define LED_OFFSET				12

// CONTROL BITMASKS
#define INITPOWERED				(1 << 0)
#define LEDPOWER				(1 << 1)
#define	WATERPOWER				(1 << 2)
#define HEATERPOWER				(1 << 3)
#define DEVICEREADY				(1 << 4)

// LED BITMASKS
#define LED1						(1 << (LED_OFFSET + 0))
#define LED2						(1 << (LED_OFFSET + 1))
#define LED3						(1 << (LED_OFFSET + 2))
#define LED4						(1 << (LED_OFFSET + 3))
#define LED_LED_ON					LED2
#define LED_HEAT_ON					LED3
#define LED_WATER_ON				LED4

_TurnOnWater_ASM:

LINK 20;

// SELECT COFFEE POT BASE ADDRESS
	COFFEEPOT_DEVICE_P0 = PAR1_R0;

// SET WATER FLOW RATE
	B[COFFEEPOT_DEVICE_P0 + WATERINFLOWREGISTER_OFFSET] = PAR2_R1;
	
// TURN ON POWER AND WATER (AND LEDS)
	TEMP_R2 = W[COFFEEPOT_DEVICE_P0 + CONTROLREGISTER_OFFSET];
	TEMP_R3 = WATERPOWER;
	TEMP_R2 = TEMP_R2 | TEMP_R3;
	TEMP_R3 = LEDPOWER;
	TEMP_R2 = TEMP_R2 | TEMP_R3;
	R3.L = lo(LED_WATER_ON);	R3.H = hi(LED_WATER_ON);
	TEMP_R2 = TEMP_R2 | TEMP_R3;
	R3.L = lo(LED_LED_ON);		R3.H = hi(LED_LED_ON);
	TEMP_R2 = TEMP_R2 | TEMP_R3;
	W[COFFEEPOT_DEVICE_P0 + CONTROLREGISTER_OFFSET] = TEMP_R2;

//  UPDATE DISPLAY
	.extern __Z23UpdateSimulationDisplayv;
	CALL __Z23UpdateSimulationDisplayv;
	CALL __Z23UpdateSimulationDisplayv;

UNLINK;

_TurnOnWater_ASM.END:

RTS;