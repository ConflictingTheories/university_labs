/*
** ADSP-BF533 startup code generated on Oct 13, 2014 at 18:04:11.
*/
/*
** Copyright (C) 2000-2014 Analog Devices Inc., All Rights Reserved.
**
** This file is generated automatically based upon the options selected
** in the System Configuration utility. Changes to the Startup Code configuration
** should be made by modifying the appropriate options rather than editing
** this file. To access the System Configuration utility, double-click the
** system.svc file from a navigation view.
**
** Custom additions can be inserted within the user-modifiable sections,
** these are bounded by comments that start with "$VDSG". Only changes
** placed within these sections are preserved when this file is re-generated.
**
** Product      : CrossCore Embedded Studio 1.1.0.0
** Tool Version : 6.0.3.2
*/

#include <sys/platform.h>
#include <sys/anomaly_macros_rtl.h>
#include <adi_osal.h>
#include <sys/fatal_error_code.h>
#include <sys/exception.h>

#define LOADIMM32REG(R,VAL) R ## .L = LO(VAL); R ## .H = HI(VAL);

#define INTERRUPT_BITS (EVT_IVG15)

#define UNASSIGNED_VAL 0x81818181

// The requiredForROMBoot file attribute is included here as this source
// defines code and data that are used before, or as part of, the meminit
// memory initialization support.
.FILE_ATTR requiredForROMBoot;

.SECTION/DOUBLEANY program;
.ALIGN 2;

start:
      // The assembler warning for anomaly 05-00-0312, issued when interrupts
      // are enabled and an an SSYNC, CSYNC or loop register load is used, is
      // not needed till interrupts are enabled. So we suppress it.
      .MESSAGE/SUPPRESS 5515;


/*$VDSG<insert-code-very-beginning>                             */
.start_of_user_code_very_beginning:
      // Insert additional code to be executed before any other startup code here.
      // This code is preserved if the CRT is re-generated.
.end_of_user_code_very_beginning:
/*$VDSG<insert-code-very-beginning>                             */

      // Disable CPLBs as they might be enable by initialization code
      // or still be enabled after a software reset.
      .EXTERN __disable_cplbs;
      .TYPE __disable_cplbs,STT_FUNC;
      CALL.X __disable_cplbs;

#if WA_05000229
      // Avoid Anomaly 05000229: SPI Slave Boot Mode Modifies Registers from
      //                         Reset Value
      R0.L = 0x400;
#if defined(__ADSPBF538__) || defined(__ADSPBF539__)
      LOADIMM32REG(P0, SPI0_CTL)
#else
      LOADIMM32REG(P0, SPI_CTL)
#endif
      W[P0] = R0.L;         // SPI_CTL reset explicitly to 0x0400
      P0.L = LO(DMA5_CONFIG);
                            // P0.H is the same for SPI_CTL and DMA5_CONFIG
      R0.L = 0;
      W[P0] = R0.L;         // DMA5_CONFIG reset explicitly to 0

#endif /* WA_05000229 */

      // Set registers to unassigned value.
      LOADIMM32REG(R0, UNASSIGNED_VAL)

      // Initialize the stack.
      // Note: this points just past the end of the stack memory.
      // So the first write must be with [--SP].
      .EXTERN ldf_stack_end;
      .TYPE ldf_stack_end,STT_OBJECT;
      LOADIMM32REG(SP, ldf_stack_end)
      USP = SP;

      // Push UNASSIGNED_VAL as RETS and old FP onto the stack to terminate
      // the call stack.
      [--SP] = R0;
      [--SP] = R0;

      // Initialize FP to point to the UNASSIGNED_VAL old FP value.
      FP = SP;

      // And make space for incoming "parameters" for functions
      // we call from here.
      SP += -12;

      // Initialize loop counters to zero, to make sure that
      // hardware loops are disabled (it can be really baffling
      // if the counters and bottom regs are set, and we happen
      // to run into them).
      R7 = 0;
      LC0 = R7;
      LC1 = R7;

      // Clear the DAG Length regs so that it's safe to use I-regs
      // without them wrapping around as required by the Blackfin C ABI.
      L0 = R7;
      L1 = R7;
      L2 = R7;
      L3 = R7;

      // Zero the ITEST_COMMAND and DTEST_COMMAND registers
      // (in case they have unintialized values in them that
      // cause a write somewhere when we enable cache).
      LOADIMM32REG(I0, ITEST_COMMAND)
      LOADIMM32REG(I1, DTEST_COMMAND)
      [I0] = R7;
      [I1] = R7;
      CSYNC;

      // Initialize the Event Vector Table (EVT) entries other than
      // EVT0 (Emulation) and EVT1 (Reset).
      LOADIMM32REG(P0, EVT2)

      // Set EVT2 (NMI) handler to our NMI interrupt dispatcher
      .EXTERN __nmi_int_dispatcher;
      .TYPE __nmi_int_dispatcher,STT_FUNC;
      LOADIMM32REG(R1, __nmi_int_dispatcher)
      [P0++] = R1;          // write &nmi_int_dispatcher to EVT2.

      // Set IVG3's (EVX) handler to our exception dispatcher
      .EXTERN __exc_dispatcher;
      .TYPE __exc_dispatcher,STT_FUNC;
      LOADIMM32REG(R1, __exc_dispatcher)
      [P0++] = R1;          // write &exc_dispatcher to EVT3.

      // Install cec_int_dispatcher into each EVT4-EVT14 slot so that all
      // core interrupts are handled by the dispatcher support.
      .EXTERN __cec_int_dispatcher;
      .TYPE __cec_int_dispatcher,STT_FUNC;
      LOADIMM32REG(R1, __cec_int_dispatcher)
      P1 = 11;
      LSETUP (.ivt, .ivt) LC0 = P1;
.ivt:  [P0++] = R1;

      // Set IVG15's handler to be the start of the mode-change
      // code. Then, before we return from the Reset back to user
      // mode, we'll raise IVG15. This will mean we stay in supervisor
      // mode, and continue from the mode-change point at the
      // lowest priority.
      LOADIMM32REG(P1, supervisor_mode)
      [P0] = P1;

      // Configure SYSCFG.
      R1 = SYSCFG;

      BITSET (R1, SYSCFG_CCEN_P);     // Enable the cycle counter.

      SYSCFG = R1;

      // __install_default_handlers is called to allow the opportunity
      // to install event handlers before main(). The default version of this
      // function provided in the libraries just returns the mask passed in.
      R0 = INTERRUPT_BITS (Z);
      .EXTERN __install_default_handlers;
      .TYPE __install_default_handlers,STT_FUNC;
      CALL.X __install_default_handlers;  // get the enable mask
      R4 = R0;              // hold the modified mask preserved regiter R4

      // Initialize the jump target tables used by the interrupt dispatcher.
      .EXTERN __init_dispatch_tables;
      .TYPE __init_dispatch_tables,STT_FUNC;
      CALL.X __init_dispatch_tables;


/*$VDSG<insert-code-early-startup>                              */
.start_of_user_code1:
      // Insert additional code to be executed before main here.
      // This code is preserved if the CRT is re-generated.
.end_of_user_code1:
/*$VDSG<insert-code-early-startup>                              */

      // Switch from reset to handling IVG15. This is Done before CPLB
      // initialization so that CPLB events can be handled as soon as
      // they are enabled.

      // We are about to enable interrupts so stop suppressing the assembler
      // warning for 05-00-0312.
      .MESSAGE/RESTORE 5515;

      // Enable interrupts using the mask returned from the call to
      // __install_default_handlers.
      STI R4;
      RAISE 15;             // handled by supervisor_mode

      // Move the processor into user mode.
      LOADIMM32REG(P0, still_interrupt_in_ipend)
      RETI = P0;

still_interrupt_in_ipend:
      // Execute RTI instructions until we've `finished` servicing 
      // all interrupts of priority higher than IVG15. Normally one
      // would expect to only have the reset interrupt in IPEND
      // being serviced, but occasionally when debugging this may
      // not be the case - if restart is hit when servicing an
      // interrupt.
      //
      // When we clear all bits from IPEND, we'll enter user mode,
      // then we'll automatically jump to supervisor_mode to start
      // servicing IVG15 (which we will 'service' for the whole
      // program, so that the program is in supervisor mode.
      //
      // Need to do this to 'finish' servicing the reset interrupt.
      .MESSAGE/SUPPRESS 1056 FOR 1 LINES;  // Suppress stall information message
      RTI;

supervisor_mode:
      [--SP] = RETI;        // re-enables the interrupt system

      #include "cplb.h"
      // Invoke register_dispatched_handler for each exception code supported,
      // passing the event type parameter in the callback value so we can
      // avoid all of the conditional checking in the handler itself.
      // As the vector table is freshly initialized, we don't need to worry
      // about running out of space so don't check the return codes to avoid
      // the overhead.
      //
      // There is no support provided for data access multiple CPLB hits (0x27)
      // and Instruction fetch CPLB protection violation (0x2B). If these 
      // exception occurs they will be treated as an unhandled exception.
      //
      // The code below calls the underlying RTL support rather than OSAL to
      // avoid startup overheads.
      .EXTERN _adi_rtl_register_dispatched_handler;
      .TYPE _adi_rtl_register_dispatched_handler,STT_FUNC;
      .EXTERN _cplb_dhandler;
      .TYPE _cplb_dhandler,STT_FUNC;
      // 0x23 - Data access CPLB protection violation
      LOADIMM32REG(R0, ADI_EXC_DATA_PROT_VIOLATION)
      LOADIMM32REG(R1, _cplb_dhandler)
      R2 = CPLB_EVT_DCPLB_WRITE;
      R5 = R1;
      CALL.X _adi_rtl_register_dispatched_handler;
      // 0x26 - Data access CPLB miss
      LOADIMM32REG(R0, ADI_EXC_DATA_CPLB_MISS)
      R1 = R5;
      R2 = CPLB_EVT_DCPLB_MISS;
      CALL.X _adi_rtl_register_dispatched_handler;
      // 0x2C - Instruction fetch CPLB miss
      LOADIMM32REG(R0, ADI_EXC_INSTR_CPLB_MISS)
      R1 = R5;
      R2 = CPLB_EVT_ICPLB_MISS;
      CALL.X _adi_rtl_register_dispatched_handler;
      // 0x2D - Instruction fetch multiple CPLB hits
      LOADIMM32REG(R0, ADI_EXC_INSTR_CPLB_MULTI_HIT)
      R1 = R5;
      R2 = CPLB_EVT_ICPLB_DOUBLE_HIT;
      CALL.X _adi_rtl_register_dispatched_handler;

      // initialize the CPLBs if they're needed. This was not possible
      // before we set up the stacks.
      R0 = 57;              // cplb_ctrl = 57
      .EXTERN _cplb_init;
      .TYPE _cplb_init,STT_FUNC;
      CALL.X _cplb_init;

      // Define and initialize the CPLB control variable.
      .SECTION/DOUBLEANY cplb_data;
      .ALIGN 4;
      .BYTE4 ___cplb_ctrl = 57;
      .GLOBAL ___cplb_ctrl;
      .TYPE ___cplb_ctrl,STT_OBJECT;

      .PREVIOUS;            // revert back to the code section
      .ALIGN 2;


/*$VDSG<insert-code-before-device-initialization>               */
.start_of_user_code2:
      // Insert additional code to be executed before OSAL initialization here.
      // This code is preserved if the CRT is re-generated.
.end_of_user_code2:
/*$VDSG<insert-code-before-device-initialization>               */

      // Call the OSAL init function.
      .EXTERN _adi_osal_Init;  // ADI_OSAL_STATUS adi_osal_Init(void);
      .TYPE _adi_osal_Init,STT_FUNC;
      CALL.X _adi_osal_Init;

      R1 = E_ADI_OSAL_SUCCESS;
      CC = R0 == R1;
      IF !CC JUMP .osal_Init_failed;

      // Call constructors for C++ global scope variables.
      .EXTERN ___ctorloop;
      .TYPE ___ctorloop,STT_FUNC
      CALL.X ___ctorloop;


/*$VDSG<insert-code-before-main-entry>                          */
.start_of_user_code3:
      // Insert additional code to be executed before main here.
      // This code is preserved if the CRT is re-generated.
.end_of_user_code3:
/*$VDSG<insert-code-before-main-entry>                          */

      // Call the application program.
      .EXTERN _main;
      .TYPE _main,STT_FUNC;
      CALL.X _main;

      // Call the standard C exit function, passing main's return value.
      .EXTERN _exit;
      .TYPE _exit,STT_FUNC;
      CALL.X _exit;         // doesn't return 

      // The call to _adi_osal_Init returned an error so call adi_fatal_error.
      .EXTERN _adi_fatal_error;
      .TYPE _adi_fatal_error,STT_FUNC;
.osal_Init_failed:
      R2 = R0;              // pass adi_osal_Init result value
      R0 = _AFE_G_LibraryError;
      R1 = _AFE_S_adi_osal_Init_failure;
      JUMP.X _adi_fatal_error;  // doesn't return

.start.end: // End label required by the linker to find the size of the start
            // as necessary for absolute placement.
      .GLOBAL start;
      .type start,STT_FUNC;

      // This is a NULL terminated table of functions pointers for C++
      // constructor calls before main(). The LDF should contiguously map this
      // ctor.SECTION first, then others and then ctorl. The ctorl.SECTION
      // contains the NULL terminator.
      // We need to define some data at the start of the.SECTION here so that
      // the start label is placed correctly by the linker. The data could be
      // anything as it is unused. We set it to the address of the ctor end
      // .SECTION label to force that section end label to always be required.
      // This avoids unknowingly not having the ctorl defined NULL terminator
      // linked and the various unexpected results that could cause.
.SECTION/DOUBLEANY ctor;
      .ALIGN 4;
      .GLOBAL ___ctor_table;
      .type ___ctor_table,STT_OBJECT;
      .EXTERN ___ctor_end;
      .type ___ctor_end,STT_OBJECT;
      .BYTE4 ___ctor_table = ___ctor_end;

      // The .gdt sections (global dispatch table) are used by the C++ exception
      // runtime library support to determine which area of code to which a
      // particular address belongs. These sections must be mapped contiguously
      // into memory by the LDF starting with this one and followed by .gdtl.
.SECTION/DOUBLEANY .gdt;
      .ALIGN 4;
      .GLOBAL ___eh_gdt;
      .TYPE ___eh_gdt,STT_OBJECT;
      .EXTERN ___eh_gdt_end;
      .type ___eh_gdt_end,STT_OBJECT;
      .BYTE4 ___eh_gdt = ___eh_gdt_end;

