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

