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
#ifndef __hstTimer24sept2014__
#define __hstTimer24sept2014__

class hstTimer{
private:
	cudaEvent_t start, stop;
public:
	hstTimer(){
		cudaEventCreate(&start);
		cudaEventCreate(&stop);
	}
	~hstTimer(){
		cudaEventDestroy(start);
		cudaEventDestroy(stop);
	}
	void tic(){
		cudaEventRecord(start, 0);
	}
	/*
	 * returns time in milliseconds
	 */
	float toc(){
		float time;
		cudaEventRecord(stop, 0);
		cudaEventSynchronize(start);
		cudaEventSynchronize(stop);
		cudaEventElapsedTime(&time, start, stop);
		return time;
	}
};

#endif
