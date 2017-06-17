#ifndef ARRAYWALK3OCT2013
#define ARRAYWALK3OCT2013
/*
 * a[]: int array of 10**9 entries 
 * Returns sum of 10**9 entries.
 */
int unitstride(int *a);

/*
 * a[]: int array of 10**9 entries.
 * Only entries with index%16 == 0 are accessed and added.
 * Cache line assumed to be 64 bytes.
 * Only one access per cache line.
 */
int stride16(int *a);

/*
 * List[]: int array of size n
 * count: number of accesses
 * Returns sum of entries accessed.
 * index = List[index]%n and index = index - index%8 ensure
 * 1. Only first word in cache line is accessed (List must be 64 byte aligned).
 * 2. If List[...] is initialized appropriately and count is not too large
 *    each cache line is accessed just once.
 */
double chain_walk(long int *List, long int n, int count);
#endif

