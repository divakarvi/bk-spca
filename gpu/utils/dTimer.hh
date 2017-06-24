#ifndef dTimer24sept2014
#define dTimer24sept2014


/*
 * Seems to read the special register %clock.
 * That is a 32 bit register that wraps around!
 * So this timer is mostly useless.
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

