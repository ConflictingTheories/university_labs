/*
** ADSP-BF533 user heap source file generated on Oct 13, 2014 at 18:04:12.
*/
/*
** Copyright (C) 2000-2014 Analog Devices Inc., All Rights Reserved.
**
** This file is generated automatically based upon the options selected
** in the System Configuration utility. Changes to the Heap configuration
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

#ifdef _MISRA_RULES
#pragma diag(push)
#pragma diag(suppress:misra_rule_1_1)
#pragma diag(suppress:misra_rule_2_2)
#pragma diag(suppress:misra_rule_6_3)
#pragma diag(suppress:misra_rule_8_10)
#pragma diag(suppress:misra_rule_10_1_a)
#pragma diag(suppress:misra_rule_11_3)
#pragma diag(suppress:misra_rule_12_7)
#else
#pragma diag(suppress:1124)
#endif /* _MISRA_RULES */


extern "asm" unsigned long ldf_heap_space;
extern "asm" unsigned long ldf_heap_length;
extern "asm" int CoffeePot1_Addr_space;
extern "asm" int CoffeePot1_Addr_length;
extern "asm" int CoffeePot2_Addr_space;
extern "asm" int CoffeePot2_Addr_length;
extern "asm" int CoffeePot3_Addr_space;
extern "asm" int CoffeePot3_Addr_length;
extern "asm" int CoffeePot4_Addr_space;
extern "asm" int CoffeePot4_Addr_length;

struct heap_table_t
{
  void          *base;
  unsigned long  length;
  long int       userid;
};

#pragma file_attr("libData=HeapTable")
#pragma section("constdata")
struct heap_table_t heap_table[6] =
{

  { &ldf_heap_space, (unsigned long) &ldf_heap_length, 0 },
  { &CoffeePot1_Addr_space, (unsigned long) &CoffeePot1_Addr_length, 1 },
  { &CoffeePot2_Addr_space, (unsigned long) &CoffeePot2_Addr_length, 2 },
  { &CoffeePot3_Addr_space, (unsigned long) &CoffeePot3_Addr_length, 3 },
  { &CoffeePot4_Addr_space, (unsigned long) &CoffeePot4_Addr_length, 4 },

  { 0, 0, 0 }
};

#ifdef _MISRA_RULES
#pragma diag(pop)
#endif /* _MISRA_RULES */

