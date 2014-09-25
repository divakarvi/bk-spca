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
#ifndef __dTimer24sept2014__
#define __dTimer24sept2014__


/*
 * this seems to read the special register %clock
 * that is a 32 bit register that wraps around!
 * so this timer is mostly useless
 */
class dTimer{
private:
	clock_t start;
public:
	__device__ dTimer(){start = clock();}
	__device__ void tic(){start = clock();}
	__device__ double toc(){
		double ans = clock()-start;
		return ans;
	}
};

#endif
