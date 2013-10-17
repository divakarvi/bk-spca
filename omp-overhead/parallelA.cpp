#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "parallel.hh"
#include <omp.h>

extern void dummy();

void parallelA(int nthreads, StatVector& stats){
	TimeStamp clk;
	clk.tic();
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)
	{
		dummy();
	}
	double cycles = clk.toc();
	stats.insert(cycles);
}
