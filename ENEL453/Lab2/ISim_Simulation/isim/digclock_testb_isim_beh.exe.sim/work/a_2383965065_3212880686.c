/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1048c146 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//engfs.eng.ad.ucalgary.ca/home/kderbyma/ENEL453/Lab2/Gencounter.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2383965065_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(38, ng0);

LAB3:    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 2240);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 2188);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2383965065_3212880686_p_1(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    unsigned int t16;
    unsigned int t17;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 660U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2196);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(43, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t5 = t1;
    memset(t5, (unsigned char)2, 5U);
    t6 = (t0 + 2276);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2312);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1052U);
    t5 = *((char **)t1);
    t1 = (t0 + 4048U);
    t11 = (25 - 1);
    t12 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t5, t1, t11);
    if (t12 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 4048U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t15, t2, t1, 1);
    t6 = (t15 + 12U);
    t16 = *((unsigned int *)t6);
    t17 = (1U * t16);
    t3 = (5U != t17);
    if (t3 == 1)
        goto LAB13;

LAB14:    t7 = (t0 + 2276);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t13 = *((char **)t10);
    memcpy(t13, t5, 5U);
    xsi_driver_first_trans_fast(t7);

LAB11:    goto LAB8;

LAB10:    xsi_set_current_line(49, ng0);
    t6 = xsi_get_transient_memory(5U);
    memset(t6, 0, 5U);
    t7 = t6;
    memset(t7, (unsigned char)2, 5U);
    t8 = (t0 + 2276);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t13 = (t10 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t6, 5U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB11;

LAB13:    xsi_size_not_matching(5U, t17, 0);
    goto LAB14;

}


extern void work_a_2383965065_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2383965065_3212880686_p_0,(void *)work_a_2383965065_3212880686_p_1};
	xsi_register_didat("work_a_2383965065_3212880686", "isim/digclock_testb_isim_beh.exe.sim/work/a_2383965065_3212880686.didat");
	xsi_register_executes(pe);
}
