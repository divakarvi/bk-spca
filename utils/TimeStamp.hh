#ifndef math671oct2009
#define math671oct2009

#include <cmath>

class TimeStamp{
private:
	unsigned int a1, d1;
	unsigned int a2, d2;
public:
	TimeStamp(){};
	void tic(){//Does not serialize.
		asm volatile("rdtsc" : "=a" (a1), "=d" (d1));
	}
	double toc(){//Does not serialize.
		asm volatile("rdtsc" : "=a" (a2), "=d" (d2));
		return convert(a1, d1, a2, d2);
	}
private:
	double convert(unsigned int A1, unsigned int D1,
		       unsigned int A2, unsigned int D2){
		double val;
		val = D2-D1;
		val *= pow(2.0, 32.0);
		val = (val + A2) - A1;
		return val;
	}
};

#endif

