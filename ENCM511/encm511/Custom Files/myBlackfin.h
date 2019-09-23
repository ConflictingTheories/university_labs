/***********************************\     
*	ENCM 511 - Assignment 2 		*
*									*
*	Author: Kyle Derby MacInnis		*
*	Date:	November 5, 2014		*
*									*
*************************************
*		myBlackfin.h				*
\***********************************/

#ifndef _MY_BLACKFIN_H
#define _MY_BLACKFIN_H

/*##################################/*
#									#
#   REGISTER ADDRESS DECLARATIONS  	#  
#									#
#									#
/*#################################*/

//## IO PROGRAMMABLE REGISTERS

// LED CONTROL REGISTER ADDRESSES
#define LED_IO_STAT_REG		0x202E0001
#define LED_IO_SET_REG		0x202E0005
#define LED_IO_DIR_REG		0x202E0007

//## PROGRAMMABLE FLAG REGISTERS

// FIO_FLAG REGISTERS
#define	FIO_FLAG_D			0xFFC00700
#define FIO_FLAG_C			0xFFC00704
#define FIO_FLAG_S			0xFFC00708
#define FIO_FLAG_T			0xFFC0070C
// FIO_MASKA REGISTERS
#define FIO_MASKA_D			0xFFC00710
#define FIO_MASKA_C			0xFFC00714
#define FIO_MASKA_S			0xFFC00718
#define FIO_MASKA_T			0xFFC0071C
// FIO_MASKB REGISTERS
#define FIO_MASKB_D			0xFFC00720
#define FIO_MASKB_C			0xFFC00724
#define FIO_MASKB_S			0xFFC00728
#define FIO_MASKB_T			0xFFC0072C
// FIO
#define FIO_DIR				0xFFC00730
#define	FIO_POLAR			0xFFC00734
#define FIO_EDGE			0xFFC00738
#define FIO_BOTH			0xFFC0073C
#define FIO_INEN			0xFFC00740

//## PHASE LOCK LOOP REGISTERS
#define PLL_CTL				0xFFC00000
#define PLL_DIV				0xFFC00004
#define VR_CTL				0xFFC00008
#define PLL_STAT			0xFFC0000C
#define PLL_LOCKCNT			0xFFC00010

//## SYSTEM INTERRUPT REGISTERS

#define SWRST				0xFFC00100
#define SYSCR				0xFFC00104
#define SIC_IMASK			0xFFC0010C
#define	SIC_IAR0			0xFFC00110
#define SIC_IAR1			0xFFC00114
#define SIC_IAR2			0xFFC00118
#define SIC_ISR				0xFFC00120
#define SIC_IWR				0xFFC00124

//## PPI CONTROLLER REGISTERS

#define PPI_CONTROL			0xFFC01000
#define PPI_STATUS			0xFFC01004
#define PPI_COUNT			0xFFC01008
#define PPI_DELAY			0xFFC0100C
#define PPI_FRAME			0xFFC01010

//## SPI CONTROLLER REGISTERS

#define SPI_CTL				0xFFC00500
#define SPI_FLG				0xFFC00504
#define SPI_STAT			0xFFC00508
#define SPI_TDBR			0xFFC0050C
#define SPI_RDBR			0xFFC00510
#define SPI_BAUD			0xFFC00514
#define SPI_SHADOW			0xFFC00518

//## GP TIMER PROGRAMMABLE REGISTERS

#define TIMER_ENABLE		0xFFC00640
#define TIMER_DISABLE		0xFFC00644
#define TIMER_STATUS		0xFFC00648
// TIMER0 REGISTERS
#define TIMER0_CONFIG		0xFFC00600
#define TIMER0_COUNTER		0xFFC00604
#define TIMER0_PERIOD		0xFFC00608
#define TIMER0_WIDTH		0xFFC0060C
// TIMER1 REGISTERS
#define TIMER1_CONFIG		0xFFC00610
#define TIMER1_COUNTER		0xFFC00614
#define TIMER1_PERIOD		0xFFC00618
#define TIMER1_WIDTH		0xFFC0061C
// TIMER2 REGISTERS
#define TIMER2_CONFIG		0xFFC00620
#define TIMER2_COUNTER		0xFFC00624
#define TIMER2_PERIOD		0xFFC00628
#define TIMER2_WIDTH		0xFFC0062C

//## WATCHDOG TIMER PROGRAMMABLE REGISTERS

#define WDOG_CTL			0xFFC00200
#define WDOG_CNT			0xFFC00204
#define WDOG_STAT			0xFFC00208

//## REAL-TIME CLOCK PROGRAMMABLE REGISTERS

#define RTC_STAT			0xFFC00300
#define RTC_ICTL			0xFFC00304
#define RTC_ISTAT			0xFFC00308
#define RTC_SWCNT			0xFFC0030C
#define RTC_ALARM			0xFFC00310
#define RTC_PREN			0xFFC00314

//## EBIU PROGRAMMABLE REGISTERS

#define EBIU_AMGCTL			0xFFC00A00
#define EBIU_AMBCTL0		0xFFC00A04
#define EBIU_AMBCTL1		0xFFC00A08
#define EBIU_SDGCTL			0xFFC00A10
#define EBIU_SDBCTL			0xFFC00A14
#define EBIU_SDSTAT			0xFFC00A1C
#define EBIU_SDRRC			0xFFC00A18

//## CORE EVENT VECTOR TABLE REGISTERS
#define EVT0				0xFFE02000
#define EVT1				0xFFE02004
#define EVT2				0xFFE02008
#define EVT3				0xFFE0200C
#define EVT4 				0xFFE02010
#define EVT5				0xFFE02014
#define EVT6				0xFFE02018
#define EVT7				0xFFE0201C
#define EVT8				0xFFE02020
#define EVT9				0xFFE02024
#define EVT10				0xFFE02028
#define EVT11				0xFFE0202C
#define EVT12				0xFFE02030
#define EVT13				0xFFE02034
#define EVT14				0xFFE02038
#define EVT15				0xFFE0203C

//## CORE EVENT CONTROLLER REGISTERS

#define IMASK 				0xFFE02104
#define IPEND				0xFFE02108
#define ILAT				0xFFE0210C
#define IPRIO				0xFFE02110

//## CORE TIMER PROGRAMMABLE REGISTERS

#define TCNTL				0xFFE03000
#define TPERIOD 			0xFFE03004
#define TSCALE				0xFFE03008
#define TCOUNT 				0xFFE0300C


/*##################################/*
#									#
#   REGISTER POINTER DECLARATIONS  	#  
#									#
#									#
/*#################################*/

// LED CONTROL REGISTER POINTERS
#define pLED_IO_STAT_REG	((volatile long *)LED_IO_STAT_REG)
#define pLED_IO_SET_REG		((volatile long *)LED_IO_SET_REG)
#define pLED_IO_DIR_REG		((volatile long *)LED_IO_DIR_REG)

// FIO_FLAG REGISTERS
#define	pFIO_FLAG_D			((volatile long *)FIO_FLAG_D)
#define pFIO_FLAG_C			((volatile long *)FIO_FLAG_C)
#define pFIO_FLAG_S			((volatile long *)FIO_FLAG_S)
#define pFIO_FLAG_T			((volatile long *)FIO_FLAG_T)
// FIO_MASKA REGISTERS
#define pFIO_MASKA_D		((volatile long *)FIO_MASKA_D)
#define pFIO_MASKA_C		((volatile long *)FIO_MASKA_C)
#define pFIO_MASKA_S		((volatile long *)FIO_MASKA_S)
#define pFIO_MASKA_T		((volatile long *)FIO_MASKA_T)
// FIO_MASKB REGISTERS
#define pFIO_MASKB_D		((volatile long *)FIO_MASKB_D)
#define pFIO_MASKB_C		((volatile long *)FIO_MASKB_C)
#define pFIO_MASKB_S		((volatile long *)FIO_MASKB_S)
#define pFIO_MASKB_T		((volatile long *)FIO_MASKB_T)
// FIO
#define pFIO_DIR			((volatile long *)FIO_DIR)
#define	pFIO_POLAR			((volatile long *)FIO_POLAR)
#define pFIO_EDGE			((volatile long *)FIO_EDGE)
#define pFIO_BOTH			((volatile long *)FIO_BOTH)
#define pFIO_INEN			((volatile long *)FIO_INEN)

//## PHASE LOCK LOOP REGISTERS
#define pPLL_CTL			((volatile long *)PLL_CTL)
#define pPLL_DIV			((volatile long *)PLL_DIV)
#define pVR_CTL				((volatile long *)VR_CTL)
#define pPLL_STAT			((volatile long *)PLL_STAT)
#define pPLL_LOCKCNT		((volatile long *)PLL_LOCKCNT)

//## SYSTEM INTERRUPT REGISTERS

#define pSWRST				((volatile long *)SWRST)
#define pSYSCR				((volatile long *)SYSCR)
#define pSIC_IMASK			((volatile long *)SIC_IMASK)
#define	pSIC_IAR0			((volatile long *)SIC_IAR0)
#define pSIC_IAR1			((volatile long *)SIC_IAR1)
#define pSIC_IAR2			((volatile long *)SIC_IAR2)
#define pSIC_ISR			((volatile long *)SIC_ISR)
#define pSIC_IWR			((volatile long *)SIC_IWR)

//## PPI CONTROLLER REGISTERS

#define pPPI_CONTROL		((volatile long *)PPI_CONTROL)
#define pPPI_STATUS			((volatile long *)PPI_STATUS)
#define pPPI_COUNT			((volatile long *)PPI_COUNT)
#define pPPI_DELAY			((volatile long *)PPI_DELAY)
#define pPPI_FRAME			((volatile long *)PPI_FRAME)

//## SPI CONTROLLER REGISTERS

#define pSPI_CTL			((volatile long *)SPI_CTL)
#define pSPI_FLG			((volatile long *)SPI_FLG)
#define pSPI_STAT			((volatile long *)SPI_STAT)
#define pSPI_TDBR			((volatile long *)SPI_TDBR)
#define pSPI_RDBR			((volatile long *)SPI_RDBR)
#define pSPI_BAUD			((volatile long *)SPI_BAUD)
#define pSPI_SHADOW			((volatile long *)SPI_SHADOW)

//## GP TIMER PROGRAMMABLE REGISTERS

#define pTIMER_ENABLE		((volatile long *)TIMER_ENABLE)
#define pTIMER_DISABLE		((volatile long *)TIMER_DISABLE)
#define pTIMER_STATUS		((volatile long *)TIMER_STATUS)
// TIMER0 REGISTERS
#define pTIMER0_CONFIG		((volatile long *)TIMER0_CONFIG)
#define pTIMER0_COUNTER		((volatile long *)TIMER0_COUNTER)
#define pTIMER0_PERIOD		((volatile long *)TIMER0_PERIOD)
#define pTIMER0_WIDTH		((volatile long *)TIMER0_WIDTH)
// TIMER1 REGISTERS
#define pTIMER1_CONFIG		((volatile long *)TIMER1_CONFIG)
#define pTIMER1_COUNTER		((volatile long *)TIMER1_COUNTER)
#define pTIMER1_PERIOD		((volatile long *)TIMER1_PERIOD)
#define pTIMER1_WIDTH		((volatile long *)TIMER1_WIDTH)
// TIMER2 REGISTERS
#define pTIMER2_CONFIG		((volatile long *)TIMER2_CONFIG)
#define pTIMER2_COUNTER		((volatile long *)TIMER2_COUNTER)
#define pTIMER2_PERIOD		((volatile long *)TIMER2_PERIOD)
#define pTIMER2_WIDTH		((volatile long *)TIMER2_WIDTH)

//## WATCHDOG TIMER PROGRAMMABLE REGISTERS

#define pWDOG_CTL			((volatile long *)WDOG_CTL)
#define pWDOG_CNT			((volatile long *)WDOG_CNT)
#define pWDOG_STAT			((volatile long *)WDOG_STAT)

//## REAL-TIME CLOCK PROGRAMMABLE REGISTERS

#define pRTC_STAT			((volatile long *)RTC_STAT)
#define pRTC_ICTL			((volatile long *)RTC_ICTL)
#define pRTC_ISTAT			((volatile long *)RTC_ISTAT)
#define pRTC_SWCNT			((volatile long *)RTC_SWCNT)
#define pRTC_ALARM			((volatile long *)RTC_ALARM)
#define pRTC_PREN			((volatile long *)RTC_PREN)

//## EBIU PROGRAMMABLE REGISTERS

#define pEBIU_AMGCTL		((volatile long *)EBIU_AMGCTL)
#define pEBIU_AMBCTL0		((volatile long *)EBIU_AMBCTL0)
#define pEBIU_AMBCTL1		((volatile long *)EBIU_AMBCTL1)
#define pEBIU_SDGCTL		((volatile long *)EBIU_SDGCTL)
#define pEBIU_SDBCTL		((volatile long *)EBIU_SDBCTL)
#define pEBIU_SDSTAT		((volatile long *)EBIU_SDSTAT)
#define pEBIU_SDRRC			((volatile long *)EBIU_SDRRC)

//## CORE EVENT CONTROLLER REGISTERS

#define pIMASK 				((volatile long *)IMASK)
#define pIPEND				((volatile long *)IPEND)
#define pILAT				((volatile long *)ILAT)
#define pIPRIO				((volatile long *)IPRIO)

//## CORE EVENT VECTOR TABLE REGISTERS
#define pEVT0				((volatile long *)EVT0)
#define pEVT1				((volatile long *)EVT1)
#define pEVT2				((volatile long *)EVT2)
#define pEVT3				((volatile long *)EVT3)
#define pEVT4 				((volatile long *)EVT4)
#define pEVT5				((volatile long *)EVT5)
#define pEVT6				((volatile long *)EVT6)
#define pEVT7				((volatile long *)EVT7)
#define pEVT8				((volatile long *)EVT8)
#define pEVT9				((volatile long *)EVT9)
#define pEVT10				((volatile long *)EVT10)
#define pEVT11				((volatile long *)EVT11)
#define pEVT12				((volatile long *)EVT12)
#define pEVT13				((volatile long *)EVT13)
#define pEVT14				((volatile long *)EVT14)
#define pEVT15				((volatile long *)EVT15)

//## CORE TIMER PROGRAMMABLE REGISTERS

#define pTCNTL				((volatile long *)TCNTL)
#define pTPERIOD 			((volatile long *)TPERIOD)
#define pTSCALE				((volatile long *)TSCALE)
#define pTCOUNT 			((volatile long *)TCOUNT)

/*##################################/*
#									#
#   SELECTED BITMASK DECLARATIONS  	#  
#									#
#									#
/*#################################*/

// LED BITMASKS
#define LED1_BITMASK		0x1
#define LED2_BITMASK		0x2
#define LED3_BITMASK		0x4
#define LED4_BITMASK		0x8
#define LED5_BITMASK		0x10
#define LED6_BITMASK		0x20

// SWITCH BITMASKS

#define SW1_BITMASK			0x0100
#define SW2_BITMASK			0x0200
#define SW3_BITMASK			0x0400
#define SW4_BITMASK			0x0800

// OTHERS CAN BE DEFINED BELOW IF NECESSARY


/*##################################/*
#									#
#   LIBRARY FUNCTION DECLARATIONS  	#  
#									#
#									#
/*#################################*/

// TTCOS FUNCTION DECLARATIONS WILL BE PLACED BELOW

// Initialize Flash Memory
void Init_Flash();

// Initialize LEDS
void Init_LED();

// Read LEDS
unsigned char Read_LED();

// Write LEDS
void Write_LED(unsigned char MASK);

// Initialize GPIO Switches
void Init_Switches();

// Enable GPIO Switches
void Enable_Switches();

// Disable GPIO Switches
void Disable_Switches();

// Read Switches
unsigned short int Read_Switches();

// Stop Watchdog Interrupts
void Stop_WDOG_Int();


// Setup Watchdog Interrupts (Passes Function, and Period)
void Setup_WDOG_Int(void (*isr_func)(void), unsigned long period );

// Start Watchdog Interrupts
void Start_WDOG_Int();

// Stop Switch Interrupts
void Stop_GPIO_Int();

// Setup Switch Interrupts
void Setup_GPIO_Int(void (*isr_func)(void));

// Start Switch Interrupts
void Start_WDOG_Int();

// SSYNC() Declaration
#define ssync() \
	__asm__("ssync;")

//IDLE() Declaration
#define idle() \
	__asm__("idle;")

#endif