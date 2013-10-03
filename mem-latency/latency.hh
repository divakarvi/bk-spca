#ifndef __LATENCY3OCT2013__
#define __LATENCY3OCT2013__
/*
 * single measurement of latency using n pages
 * n pages = n*4096 bytes = n*64 cache lines
 * sets up a random cycle through n*64 cache lines
 * returns avg number of cycles per access
 */
double latency(int n)
#endif
