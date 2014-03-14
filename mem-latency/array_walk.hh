/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

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
