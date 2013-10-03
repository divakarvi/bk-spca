#ifndef __LATENCYUTILS3OCT2013__
#define __LATENCYUTILS3OCT2013__

/*
 * List = int array of size n (permutation of 0..n-1)
 * count = number of accesses
 * index = 0 initially
 * there after index = List[index]%n
 * returns number of repeats in first count accesses
 */
int countrepeats(long int *List, long int n, int count);

/*
 * n = size of array
 * count = number of accesses
 * return probability of no repeat access
 */
double probNoR(long int n, int count);

/*
 * List[] = int array of size n
 * List[0..n-1] initialized to random permutation of 0..n-1
 */
void randomp(int *List, int n);
#endif
