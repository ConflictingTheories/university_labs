    .section data1;
 	// Will place local variables here (correct place is on STACK, but WAIL)
 	.byte2 currentRegisterValue = 0;
 	.byte2 updatedRegisterValue = 0;
 	
 	.section program		// void TurnOnWaterASM(COFFEEPOT_DEVICE *coffeePt_BaseAddress, unsigned char waterInputSpeed) {
 	.global _TurnOnWater_ASM;							
 #define INPAR1_R0 R0		//                                         INPAR1_R0  ^^^^           INPAR2_R1 ^^^^^^
 #define INPAR2_R1 R1		// PSP -- Use selfdocumentating names so we know what is being coded
 #define COFFEEPOT_DEVICEPointer_P0 P0
 #define currentRegisterValuePointer_P1 P1
 #define updatedRegisterValuePointer_P2 P2
 
 _TurnOnWater_ASM:
 	LINK 20;
 	COFFEEPOT_DEVICEPointer_P0  = INPAR1_R0;
 							// First step -- Place INPAR1 (a pointer / address) into a pointer register (R0 can be re-used)
 							// Make a pointer register point to where currentRegisterValue is stored
 	P1.L = lo(currentRegisterValue); 		P1.H = hi(currentRegisterValue);  // Like MIPS -- load 16 bits at a time
 	P2.L = lo(updatedRegisterValue);		P2.H = hi(updatedRegisterValue);
							     // Turn on the power to water and LED
							     
							//     unsigned short int currentRegisterValue = coffeePt_BaseAddress->controlRegister;
	// This one line of C++ code becomes two lines of assembly code in a LOAD / STORE ARCHITECTURE						
	#define temp_R2 R2										
	#define CONTROLREGISTER_OFFSET 0									// From the memory structure in design document
	temp_R2 = W[COFFEEPOT_DEVICEPointer_P0 + CONTROLREGISTER_OFFSET];	//     temp_R2 = coffeePt_BaseAddress->controlRegister;
	W[currentRegisterValuePointer_P1] = temp_R2;						//     unsigned short int currentRegisterValue = temp_R2
							
							//     unsigned short int updatedRegisterValue = currentRegisterValue | WATERPOWER  | LEDPOWER;
	// This one line of C++ code becomes about 6 lines of assembly code in a LOAD / STORE ARCHITECTURE	
	temp_R2 = W[currentRegisterValuePointer_P1];										// temp_R2 = currentRegisterValue;
#define temp_R3 R3
//  GENERAL CONTROL   (Bits 4 to 0)   		-- cut and pasted from CoffePot_SimulatorFunctions.h
#define LEDPOWER            (1 << 1)       // 0x2 – LED Power on 
#define WATERPOWER          (1 << 2)       // 0x4 – Water control power on						
	temp_R3 = WATERPOWER;								// temp_R3 = WATERPOWER
	temp_R2 = temp_R2 | temp_R3;						// OR in the first constant
	temp_R3 = LEDPOWER;									// temp_R3 = LEDPOWER
	temp_R2 = temp_R2 | temp_R3;						// OR in second constant
	W[updatedRegisterValuePointer_P2] = temp_R2;		// Store the result

// LED CONTROL   (Bits 15 to 12)  -- cut and pasted from CoffePot_SimulatorFunctions.h
#define LED_CONTROL_OFFSET 12
#define LED3       (1 << (LED_CONTROL_OFFSET + 2)) 	// 0x4 – LED 3
#define LED4       (1 << (LED_CONTROL_OFFSET + 3)) 	// 0x8 – LED 4
#define LED_WATERPOWER 	LED3
#define LED_LEDPOWER 	LED4	
							//     updatedRegisterValue = updatedRegisterValue | LED_WATERPOWER  | LED_LEDPOWER ;
	temp_R2 = W[P2];										// Fetch value from memory								
	temp_R3 = LED_WATERPOWER;							
	temp_R2 = temp_R2 | temp_R3;						// OR in the first constant					
	R3.L = lo(LED_LEDPOWER); R3.H = hi(LED_LEDPOWER);	// If assembler considers 3 = (1 << (12 + 3)) TOO BIG -- DON'T ARGUE;	
	// temp_R3.L = lo(LED_LEDPOWER); temp_R3.H = hi(LED_LEDPOWER);		-- The obvious syntax is not allowed by the assembler			
	temp_R2 = temp_R2 | temp_R3;						// OR in second constant
	W[updatedRegisterValuePointer_P2] = temp_R2;		// Store the result
							
							//     coffeePt_BaseAddress->controlRegister = updatedRegisterValue ;
	temp_R2 = W[updatedRegisterValuePointer_P2];
	W[COFFEEPOT_DEVICEPointer_P0 + CONTROLREGISTER_OFFSET] = temp_R2;
							
	.extern __Z23UpdateSimulationDisplayv;						//     UpdateSimulationDisplay( );
	CALL __Z23UpdateSimulationDisplayv;

#warning "This reuse of COFFEEPOT_DEVICEPointer_P0 is actually a defect in my code that I have just supported -- but the code worked by luck"
#warning "DON'T REPEAT THIS DEFECT IN AN EXAM -- Check class notes on how to fix"
							
							//     coffeePt_BaseAddress-> waterInFlowRegister = waterInputSpeed;
	#define WATERINFLOWREGISTER_OFFSET 7
	B[COFFEEPOT_DEVICEPointer_P0 + WATERINFLOWREGISTER_OFFSET] = INPAR2_R1;
	
	CALL __Z23UpdateSimulationDisplayv;						    //     UpdateSimulationDisplay( );
							
	UNLINK;													// }
_TurnOnWater_ASM.END:										// MATCH THE ASSEMBLY CODE TO THE KNOWN WORKING CODE
	RTS;
	