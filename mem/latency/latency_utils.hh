#ifndef LATENCYUTILS3OCT2013
#define LATENCYUTILS3OCT2013

/*
 * List[]: int array of size n (permutation of 0..n-1)
 * count: number of accesses
 * Initially, index is 0.
 * There after index = List[index]%n.
 * Returns number of repeats in *count* chained accesses.
 */
int countrepeats(long int *List, long int n, int count);

/*
 * n: size of array
 * count: number of accesses
 * Returns probability of no repeat in chained access.
 */
double probNoR(long int n, int count);

/*
 * list[]: int array of size n
 * list[0..n-1] initialized to random permutation of 0..n-1.
 */
void random_perm(int *list, int n);

/*
 * list[]: int array of size n
 * list[0..n-1]: initialized to random CYCLE
 */
void random_cycle(int *list, int n);
#endif

