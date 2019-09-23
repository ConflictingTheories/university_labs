/*
** ADSP-BF533 CPLB table definitions generated on Oct 13, 2014 at 18:04:12.
*/
/*
** Copyright (C) 2000-2014 Analog Devices Inc., All Rights Reserved.
**
** This file is generated automatically based upon the options selected
** in the System Configuration utility. Changes to the CPLB configuration
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
#include <cplbtab.h>
#include <cplb.h>

#ifdef _MISRA_RULES
#pragma diag(push)
#pragma diag(suppress:misra_rule_2_2)
#pragma diag(suppress:misra_rule_8_10)
#pragma diag(suppress:misra_rule_10_1_a)
#endif /* _MISRA_RULES */

#define CACHE_MEM_MODE (CPLB_DNOCACHE)

#pragma section("cplb_data")

cplb_entry dcplbs_table[] = {


   // L1 Data A & B, (set write-through bit to avoid 1st write exceptions)
   {0xFF800000, (PAGE_SIZE_4MB | CPLB_DNOCACHE | CPLB_LOCK | CPLB_WT | CPLB_L1SRAM)}, 

   // Async Memory Bank 2 (Second)
   // Async Memory Bank 1 (Prim B)
   // Async Memory Bank 0 (Prim A)
   {0x20200000, (PAGE_SIZE_1MB | CPLB_DNOCACHE)}, 
   {0x20100000, (PAGE_SIZE_1MB | CPLB_DNOCACHE)}, 
   {0x20000000, (PAGE_SIZE_1MB | CPLB_DNOCACHE)}, 

      // 128 MB (Maximum) SDRAM memory space (32/64 MB populated on Ez-kit)
   {0x00000000, (PAGE_SIZE_4MB | CACHE_MEM_MODE | CPLB_DIRTY | CPLB_LOCK)}, 
   {0x00400000, (PAGE_SIZE_4MB | CACHE_MEM_MODE | CPLB_DIRTY | CPLB_LOCK)}, 
   {0x00800000, (PAGE_SIZE_4MB | CACHE_MEM_MODE | CPLB_DIRTY | CPLB_LOCK)}, 
   {0x00C00000, (PAGE_SIZE_4MB | CACHE_MEM_MODE | CPLB_DIRTY | CPLB_LOCK)}, 
   
   /* CPLBs covering 48MB */
   {0x01000000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x01400000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x01800000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x01c00000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x02000000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x02400000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x02800000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x02c00000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x03000000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x03400000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x03800000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},
   {0x03c00000, (PAGE_SIZE_4MB | CACHE_MEM_MODE)},

   // Async Memory Bank 3
   {0x20300000, (PAGE_SIZE_1MB | CPLB_DNOCACHE)}, 

   // end of section - termination
   {0xffffffff, 0}, 
}; /* dcplbs_table */

#pragma section("cplb_data")

cplb_entry icplbs_table[] = {


   // L1 Code
   {0xFFA00000, (PAGE_SIZE_1MB | CPLB_I_PAGE_MGMT | CPLB_L1SRAM)}, 

   // Async Memory Bank 2 (Secnd)
   // Async Memory Bank 1 (Prim B)
   // Async Memory Bank 0 (Prim A)
   {0x20200000, (PAGE_SIZE_1MB | CPLB_INOCACHE)}, 
   {0x20100000, (PAGE_SIZE_1MB | CPLB_IDOCACHE)}, 
   {0x20000000, (PAGE_SIZE_1MB | CPLB_IDOCACHE)}, 

   // 128 MB (Maximum) SDRAM memory space (32/64 MB populated on Ez-kit)
   
   /* CPLBs covering 64MB */
   {0x00000000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x00400000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x00800000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x00c00000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x01000000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x01400000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x01800000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x01c00000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x02000000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x02400000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x02800000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x02c00000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x03000000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x03400000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x03800000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},
   {0x03c00000, (PAGE_SIZE_4MB | CPLB_IDOCACHE)},

   // Async Memory Bank 3 
   {0x20300000, (PAGE_SIZE_1MB | CPLB_INOCACHE)}, 

   // end of section - termination
   {0xffffffff, 0}, 
}; /* icplbs_table */


#ifdef _MISRA_RULES
#pragma diag(pop)
#endif /* _MISRA_RULES */

