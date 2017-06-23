#ifndef segf23Oct2013
#define segf23Oct2013
/*
 * Prints sum of p[0..len-1].
 * Defined in induce_segf.cpp (not segf.cpp) to preclude compiler optimizations.
 */
void sum_arr(long *p, long len);

/*
 * a0[0..999] = 0.
 * Then a0[list[i]] = list[i]*list[i] for i = 0..(n-1).
 * Returns sum of a0[0..999].
 */
void ff0(long *a0, long *list, long n);

/*
 * Allocates a0[0..999] on the stack.
 * Calls ff0().
 */
void f0(long *list, long n);

/*
 * Allocates 8 MB to create more room on the stack.
 * Makes a single call of f0(list, n).
 * Then accesses 8 MB on stack yet again.
 * Called by run2() and run3().
 */
void f1(long *list, long n);

/*
 * Allocates 8 MB on the stack.
 * Then accesses it.
 */
void f2();
#endif

