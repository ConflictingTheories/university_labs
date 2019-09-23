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
	*pEBIU_AMBCTL0 = 0x7bb07bb0;
	// Set Read and Write Times for Memory Banks 2 and 3
	*pEBIU_AMBCTL1 = 0x7bb07bb0;
	// Enable all Memory Banks
	*pEBIU_AMGCTL = 0x000F;
	// Force Write
	ssync();
}

// Initialize Blackfin LEDS
void Init_LED()
{
	// Set LEDS Off
	*pLED_IO_SET = 0x0;
	// Set LEDS 1-6 for Output
	*pLED_IO_DIR = 0x3F;
	//Force Write
	ssync();
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
	ssync();
}

// Initialize Blackfin Switches
void Init_Switches()
{
	// Set Polarity of Switches to Active High
	*pFIO_POLAR &= (~0xF0FF);
	// Set Sensitivity to Level
	*pFIO_EDGE &= (~0xF0FF);
	// Set Direction of Switches to Inputs
	*pFIO_DIR &= (~0xF0FF);
	// Set Values to Off
	*pFIO_FLAG_D &= (~0xF0FF);
	// Force Write
	ssync();
}

// Enable Switches
void Enable_Switches()
{
	// Set Switch Input Enabled
	*pFIO_INEN |= (0x0F00);
	// Force Write
	ssync();
}

// Disable Switches
void Disable_Switches()
{
	// Set Switch Input Disabled
	*pFIO_INEN &= (~0x0F00)
	// Force Write
	ssync();
}

// Read Blackfin Switches
unsigned short int Read_Switches()
{
	// Read in Switches from GPIO and Bitshift 8 Bits
	unsigned short int currentValue = ((*pFIO_DATA_D & 0x0F00) >> 8)
	// Return Value
	return currentValue;
}

// Stop Watchdog Interrupts
void Stop_WDOG_Int()
{
	// Stop WDOG Counter
	*pWDOG_CTL |= (0x0AD0);
	// Force Write
	ssync();
}

// Setup Watchdog Interrupts (Passes Function, and Period)
void Setup_WDOG_Int(void (*isr_func)(void), unsigned long period )
{
	// Reset Watchdog Timer
	*pWDOG_CTL = 0x0AD0;
	// Set Type of WDOG Interrupt (GP)
	*pWDOG_CTL |= (0x0004);
	// Reset Watchdog Counter
	*pWDOG_CNT = 0x0;
	// Set Period of Interrupt
	*pWDOG_CNT &= period;
	// Enable WDOG Interrupt
	*pSIC_IMASK |= (0x00800000);
	// Enable Correspondong SIC_IAR Register (IVG8)
	*pSIC_IAR2 &= (~0xE00000000) 
	// Enable Corresponding EVT Interrupt (IVG8)
	*pIMASK |= (0x00000100);
	// Set given ISR to EVT
	*pEVT8 = &isr_func;
	// Force Write
	ssync();
}

// Start Watchdog Interrupts
void Start_WDOG_Int()
{
	// Turn on WDOG Timer
	*pWDOG_CTL &= (~0x0FF0);
	// Force Write
	ssync();
}

// Stop Switch Interrupts
void Stop_GPIO_Int()
{
	// Disable Interrupts for PF8-PF11
	*pFIO_MASKA_D &= (~0x0F00);
	// Force Write
	ssync();
}

// Setup Switch Interrupts
void Setup_GPIO_Int(void (*isr_func)(void))
{
	// Enable GPIO Interrupt
	*pSIC_IMASK |= 0x00080000;
	// Enable Corresponding SIC_IAR2 Register
	*pSIC_IAR2 &= (~0x0000F000);
	// Enable IVG7 Interrupt
	*pIMASK |= (0x00000080);
	// Set Given ISR to EVT7
	*pEVT7 = &isr_func;
	// Force Write
	ssync();
}

// Start Switch Interrupts
void Start_WDOG_Int()
{
	// Enable Interrupts for PF8-PF11
	*pFIO_MASKA_D |= (0x0F00);
	// Force Write
	ssync();
}