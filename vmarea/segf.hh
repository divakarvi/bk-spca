#ifndef __segf23Oct2013__
#define __segf23Oct2013__
/*
 * prints sum of p[0..len-1]
 * defined in induce_segf.cpp (not segf.cpp)
 * used to preclude compiler optimizations
 */
void sum_arr(long *p, long len);

/*
 * a0[0..999] = 0
 * a0[list[i]] = list[i]*list[i] for i = 0..(n-1)
 * returns sum of a0[0..999]
 */
void ff0(long *a0, long *list, long n);

/*
 * allocates a0[0..999] on the stack
 * calls ff0()
 */
void f0(long *list, long n);

/*
 * allocates 8MB to create more room on the stack
 * makes a single call of f0(list, n)
 * used by run2() and run3()
 */
void f1(long *list, long n);

/*
 * allocates 8 MB on the stack
 */
void f2();
#endif

