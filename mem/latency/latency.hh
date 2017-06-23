#ifndef LATENCY3OCT2013
#define LATENCY3OCT2013
/*
 * Single measurement of latency using n pages.
 * n pages = n*4096 bytes = n*64 cache lines.
 * Sets up a random cycle through n*64 cache lines.
 * npages[]: int array of size npages*4096/4 (npages*1024).
 * Returns avg number of cycles per access.
 */
double latency(int n, int *npages);
#endif

