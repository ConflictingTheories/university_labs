/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		myBlackfin.cpp		*
\***********************************/

#include "myBlackfin.h"

// Initialize Blackfin Flash Memory (For LEDS)
void Init_Flash()
{
	// Set Read and Write Times for Memory Banks 0 and 1
	*pEBIU_AMBCTL0 = (0x7bb07bb0);
	// Set Read and Write Times for Memory Banks 2 and 3
	*pEBIU_AMBCTL1 = (0x7bb07bb0);
	// Enable all Memory Banks
	*pEBIU_AMGCTL = (0x000F);
	// Force Write
	Ssync();
}

// Initialize Blackfin LEDS
void Init_LED()
{
	// Set LEDS 1-6 for Output
	*pLED_IO_DIR = 0x3F;
	// Set LEDS Off
	*pLED_IO_SET = 0x00;
	//Force Write
	Ssync();
}

// Read Blackfin LEDS
unsigned char Read_LED()
{
	// Read in Value from Register
	unsigned char currentValue = (*pLED_IO_STAT & 0x3F);
	// Return Value
	return currentValue;
}

// Write Blackfin LEDS
void Write_LED(unsigned char MASK)
{
	// Write Given MASK to LEDS
	*pLED_IO_SET = MASK & 0x3F;
	// Force Write
	Ssync();
}

// Initialize Blackfin Switches
void Init_Switches()
{
	// Set Polarity of Switches to Active High
	*pFIO_POLAR &= (~0x0F00);
	// Set Sensitivity to Level
	*pFIO_EDGE &= (~0x0F00);
	// Set Direction of Switches to Inputs
	*pFIO_DIR &= (~0x0F00);
	// Set MASKA and MASKB Interrupts Off
	*pFIO_MASKA_S &= (~0x0F00);
	*pFIO_MASKB_S &= (~0x0F00);
	// Set Input Enabled
	*pFIO_INEN |= (0x0F00);
	// Force Write
	Ssync();
}

// Enable Switches
void Enable_Switches()
{
	// Set Switch Input Enabled
	*pFIO_INEN |= (0x0F00);
	// Force Write
	Ssync();
}

// Disable Switches
void Disable_Switches()
{
	// Set Switch Input Disabled
	*pFIO_INEN &= (~0x0F00);
	// Force Write
	Ssync();
}

// Read Blackfin Switches
unsigned short int Read_Switches()
{
	// Read in Switches from GPIO and Bitshift 8 Bits
	unsigned short currentValue = ((*pFIO_FLAG_D & 0x0F00) >> 8);
	// Return Value
	return currentValue;
}

// Stop Watchdog Interrupts
void Stop_WDOG_Int()
{
	// Stop WDOG Counter
	*pWDOG_CTL = (0x0AD0) | (0x0004);
	*pWDOG_CNT &= (0xFFFF);
	// Force Write
	Ssync();
}

// Setup Watchdog Interrupts (Passes Function, and Period)
void Setup_WDOG_Int(void (*isr_func)(), unsigned long period )
{
	// Reset Watchdog Timer - And Map GP interrupt
	*pWDOG_CTL = 0x0AD0 | (0x0004);
	// Set Period of Interrupt
	*pWDOG_CNT = period;
	// Enable WDOG Interrupt
	*pSIC_IMASK |= (0x00800000);
	// Enable Corresponding EVT Interrupt (IVG8)
	*pIMASK |= (0x00000100);
	// Enable Correspondong SIC_IAR Register (IVG8)
	*pSIC_IAR2 |= (0x10000000);
	// Set given ISR to EVT
	*pEVT8 = isr_func;
	// Force Write
	Ssync();
}

// Start Watchdog Interrupts
void Start_WDOG_Int()
{
	// Turn on WDOG Timer
	*pWDOG_CTL &= (~0x0FF0);
	// Force Write
	Ssync();
}

// Stop Watchdog Interrupts
void Stop_CoreTimer_Int()
{
	// Stop WDOG Counter
	*pTCNTL &= (~0x00000002);
	// Force Write
	Ssync();
}

void Setup_CoreTimer_Int(void (*isr_func)(), unsigned long period )
{
	// Set Auto Reload and Set Active State
	*pTCNTL = 0x00000005;
	// Set Period of Interrupt
	*pTPERIOD = period;
	// Set Scale to 1 Cycle Decrement
	*pTSCALE = 0x0;
	// Enable Corresponding EVT Interrupt (IVTMR)
	*pIMASK |= (0x00000040);
	// Set given ISR to EVT
	//*pEVT6 = isr_func;
	// Force Write
	Ssync();
}

// Start Core Timer Interrupts
void Start_CoreTimer_Int()
{
	// Turn on Core Timer
	*pTCNTL |= 0x00000002;
	// Force Write
	Ssync();
}

// Stop Switch Interrupts
void Stop_GPIO_Int()
{
	// Disable Interrupts for PF8-PF11
	*pFIO_MASKA_S &= (~0x0F00);
	// Disable SIC_IMASK Interrupt
	*pSIC_IMASK &= (~0x00080000);
	// Disable IMASK Interrupt
	*pIMASK &= (~0x00000080);
	// Force Write
	Ssync();
}

// Setup Switch Interrupts
void Setup_GPIO_Int(void (*isr_func)(void))
{
	// Set GPIO to be Edge Triggered
	*pFIO_EDGE |= 0x0F00;
	// Set Interrupts for Both Rising/Falling
	*pFIO_BOTH |= 0x0F00;
	// Enable GPIO Interrupt
	*pSIC_IMASK |= 0x00080000;
	// Enable IVG7 Interrupt
	*pIMASK |= (0x00000080);
	// Enable Corresponding SIC_IAR2 Register (EVT7)
	//*pSIC_IAR2 &= (~0x0000F000);
	// Set Given ISR to EVT7
	//*pEVT7 = isr_func;
	// Force Write
	Ssync();
}

// Start Switch Interrupts
void Start_GPIO_Int()
{
	// Enable Interrupts for PF8-PF11
	*pFIO_MASKA_S |= (0x0F00);
	// Force Write
	Ssync();
}
