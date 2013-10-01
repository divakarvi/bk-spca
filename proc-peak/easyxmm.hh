#ifndef __EASYXMM01OCT2013__
#define __EASYXMM01OCT2013__

/*
 * 1. these macros provide an easy means to use the xmm registers.
 * 2. they can easily lead to incorrect code when used within loops.
 * 3. it is natural to use these macros to subject the xmm registers
 *    to a sequence of arithmetic operations. 
 *    the compiler may use xmm registers to store temp data in-between
 *    macros.
 *    that is especially likely to happen when the macros are used inside
 *    for or while loops.
 * 4. when these macros are used the ASSEMBLY MUST BE INSPECTED TO ensure
 *    that the compiler generated code does not reuse xmm registers for
 *    temp data.
 */

//R must be "%xmmi" 0<=i<=15
#define zeroxmm(R)				\
  asm volatile("xorps %" R ", %" R "\n\t":::R);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define addxmm(R1, R2)					\
  asm volatile("addpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define mulxmm(R1, R2)					\
  asm volatile("mulpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define loadxmm(a, R)					\
  asm volatile("movaps %0, %" R "\n\t"::"m"(*(a)):R);	

//R = "%xmmi" 0<=i<=15xmm
//a = double * (16 byte aligned)
#define storexmm(R, a)					\
  asm volatile("movaps %" R ", %0 \n\t":"=m"(*(a))::R);	

#endif
