#include "../../utils/TimeStamp.hh"
#include "overhead.hh"
#include <omp.h>

extern void dummy();

double ompfor(int nthreads, int countinner, long int countouter){
	double cycles;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(countinner, countouter, cycles)
	{
		TimeStamp clk;
/* barrier to protect clock. */
#pragma omp barrier
#pragma omp master
		clk.tic();
		for(long int j=0; j < countouter; j++){
#pragma omp for	schedule(static)
			for(int i=0; i < countinner; i++)
				dummy();
		}
#pragma omp master
		cycles = clk.toc();
	}
	return cycles;
}

double cppfor(int countinner, long int countouter){
	TimeStamp clk;
	clk.tic();
	for(long int j=0; j < countouter; j++){
		for(int i=0; i < countinner; i++)
			dummy();
	}
	double cycles = clk.toc();
	return cycles;
}

//overhead.hh
double ompfor_overhead(int nthreads, int countinner, long int countouter){
	double ompcycles = ompfor(nthreads, countinner, countouter);
	double cppcycles = cppfor(countinner, countouter);
	/*
	 * cppcycles divided by nthreads to account for parallelism of omp for
	 */
	return (ompcycles-cppcycles/nthreads)/countouter;
}

double ompfornowait(int nthreads, int countinner, long int countouter){
	double cycles;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(countinner, countouter, cycles)
	{
		TimeStamp clk;
/* barrier to protect clk. */
#pragma omp barrier
#pragma omp master
		clk.tic();
		for(long int j=0; j < countouter; j++){
#pragma omp for	schedule(static) nowait
			for(int i=0; i < countinner; i++)
				dummy();
		}
#pragma omp master 
		cycles = clk.toc();
	}
	return cycles;
}

//overhead.hh
double ompfornowait_overhead(int nthreads, long int countinner, 
			     long int countouter){
	double ompcycles = ompfornowait(nthreads, countinner, countouter);
	double cppcycles = cppfor(countinner, countouter);
	return (ompcycles-cppcycles/nthreads)/countouter;
}

double ompfordynamic(int nthreads, int countinner, long int countouter){
	double cycles;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(countinner, countouter, cycles)
	{
		TimeStamp clk;
#pragma omp barrier
#pragma omp master
		clk.tic();
		for(long int j=0; j < countouter; j++){
#pragma omp for	schedule(dynamic)				
			for(int i=0; i < countinner; i++)
				dummy();
		}
#pragma omp master 
		cycles = clk.toc();
	}
	return cycles;
}

double ompfordynamic_overhead(int nthreads, long int countinner, 
			      long int countouter){
	double ompcycles = ompfordynamic(nthreads, countinner, countouter);
	double cppcycles = cppfor(countinner, countouter);
	return (ompcycles-cppcycles/nthreads)/countouter;
}

