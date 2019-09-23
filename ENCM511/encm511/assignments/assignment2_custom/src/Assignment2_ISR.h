/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		Assignment2_ISR.h		*
\***********************************/
#include <sys\exception.h>
#include <cdefbf533.h>
#ifndef _ASSN2_ISR_H
#define _ASSN2_ISR_H

// WDOG TIMER PERIOD (FIGURE OUT)
#define TIMER_PERIOD		0x00FFFFFF

EX_INTERRUPT_HANDLER(ISR_WDog_Function);
// WDOG ISR Prototype
//#pragma interrupt
//void ISR_WDog_Function(void);

EX_INTERRUPT_HANDLER(ISR_GPIO_Function);
// GPIO ISR Prototype
//#pragma interrupt
//void ISR_GPIO_Function(void);

EX_INTERRUPT_HANDLER(ISR_CoreTimer_Function);
// Core Timer ISR Prototype
//#pragma interrupt
//void ISR_CoreTimer_Function(void);

#endif
