#ifndef __ARRAYWALK3OCT2013__
#define __ARRAYWALK3OCT2013__
/*
 * a = int array of 10**9 entries 
 * returns sum of 10**9 entries
 */
int unitstride(int *a);

/*
 * a = int array of 10**9 entries
 * only entries with index%16 == 0 are accessed and added
 * cache line assumed to be 64 bytes
 * only one access per cache line
 */
int stride16(int *a);

/*
 * List = int array of size n
 * count = number of accesses
 * returns sum of entries accessed
 * index = List[index]%n and index = index - index%8 ensure
 * 1. only first word in cache line is accessed (List must be 64 byte aligned)
 * 2. If List[...] is initialized appropriately and count is not too large
 *    each cache line is accessed just once.
 */
double chain_walk(long int *List, long int n, int count);
#endif
