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

#ifndef __LATENCY3OCT2013__
#define __LATENCY3OCT2013__
/*
 * single measurement of latency using n pages
 * n pages = n*4096 bytes = n*64 cache lines
 * sets up a random cycle through n*64 cache lines
 * npages = int array of size npages*4096/4 (npages*1024)
 * returns avg number of cycles per access
 */
double latency(int n, int *npages);
#endif
