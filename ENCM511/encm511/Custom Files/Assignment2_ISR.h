/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		Assignment2_ISR.h		*
\***********************************/

#ifndef _ASSN2_ISR_H
#define _ASSN2_ISR_H

// WDOG TIMER PERIOD (FIGURE OUT)
#define WDOG_PERIOD		0xFFFF

// WDOG ISR Prototype
void ISR_WDog_Function(void);

// GPIO ISR Prototype
void ISR_GPIO_Function(void);

#endif