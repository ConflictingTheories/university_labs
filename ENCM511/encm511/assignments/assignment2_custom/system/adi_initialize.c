/*
** adi_initialize.c source file generated on November 6, 2014 at 12:56:13.
**
** Copyright (C) 2000-2014 Analog Devices Inc., All Rights Reserved.
**
** This file is generated automatically. You should not modify this source file,
** as your changes will be lost if this source file is re-generated.
*/

#include <sys/platform.h>
#ifdef __ADI_HAS_SEC__
#include <services/int/adi_sec.h>
#endif

#include "adi_initialize.h"


int32_t adi_initComponents(void)
{
	int32_t result = 0;

#ifdef __ADI_HAS_SEC__
	result = adi_sec_Init();
#endif

	return result;
}

