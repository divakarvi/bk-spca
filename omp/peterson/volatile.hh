#ifndef __volatile16Oct2013__
#define __volatile16Oct2013__

/*
 * each function does list[i] += *ptr for 0 <= i < n
 */
void addx(int *restrict ptr, int *restrict list, int n);
void vaddx(volatile int *restrict ptr, int *restrict list, int n);
#endif

