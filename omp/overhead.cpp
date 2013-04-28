#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
#include <omp.h>
#include "StatVector.hh"

using namespace std;
extern void parallelA(int nthreads, StatVector& stats);
extern void parallelB(int nthreads, StatVector& stats);
extern void dummy();

double barrier(int nthreads, int countinner){
  double cycles;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(countinner, cycles) 
  {
    TimeStamp clk;
#pragma omp barrier
#pragma omp master
    clk.tic();
    for(int i=0; i < countinner; i++){
      dummy();
#pragma omp barrier    
    }
#pragma omp master
    cycles = clk.toc();
  }
  return cycles;
}

double nobarrier(int nthreads, int countinner){
  double cycles;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(countinner, cycles) 
  {
    TimeStamp clk;
#pragma omp barrier
#pragma omp master
    clk.tic();
    for(int i=0; i < countinner; i++){
      dummy();
    }
#pragma omp master
    cycles = clk.toc();
  }
  return cycles;
}



double barrier_overhead(int nthreads, long int countinner){
  double b = barrier(nthreads, countinner);
  double nb = nobarrier(nthreads, countinner);
  return (b-nb)/countinner;
}

double ompfor(int nthreads, int countinner, long int countouter){
  double cycles;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(countinner, countouter, cycles)
  {
    TimeStamp clk;
#pragma omp barrier
#pragma omp master
    clk.tic();
    for(long int j=0; j < countouter; j++){
#pragma omp for					\
  schedule(static)
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

double ompfor_overhead(int nthreads, int countinner, long int countouter){
  double ompcycles = ompfor(nthreads, countinner, countouter);
  double cppcycles = cppfor(countinner, countouter);
  return (ompcycles-cppcycles/nthreads)/countouter;
}

double ompfornowait(int nthreads, int countinner, long int countouter){
  double cycles;
  TimeStamp clk;
  clk.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(countinner, countouter, cycles)
  {
    TimeStamp clk;
#pragma omp barrier
#pragma omp master
    clk.tic();
    for(long int j=0; j < countouter; j++){
#pragma omp for					\
  schedule(static)				\
  nowait
      for(int i=0; i < countinner; i++)
	dummy();
    }
#pragma omp master 
    cycles = clk.toc();
   }
  return cycles;
}

double ompfornowait_overhead(int nthreads, long int countinner, long int countouter){
  double ompcycles = ompfornowait(nthreads, countinner, countouter);
  double cppcycles = cppfor(countinner, countouter);
  return (ompcycles-cppcycles/nthreads)/countouter;
}

double ompfordynamic(int nthreads, int countinner, long int countouter){
  double cycles;
  TimeStamp clk;
  clk.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(countinner, countouter, cycles)
  {
    TimeStamp clk;
#pragma omp barrier
#pragma omp master
    clk.tic();
    for(long int j=0; j < countouter; j++){
#pragma omp for					\
  schedule(dynamic)				
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

void output_alternating(int nthreads){
   int count = 1000*1000*100;
   StatVector stats(2*count);
   for(int i=0; i < count; i++){
     parallelA(nthreads, stats);
     parallelB(nthreads, stats);
   }
   char banner[200];
   sprintf(banner, "number of threads = %d ",nthreads);
   stats.print(banner);
   cout<<"first 20: "<<endl;
   for(int i=0; i < 20; i++)
     cout<<stats(i,-1)<<endl;
   cout<<"worst 20: "<<endl;
   for(int i=1; i < 20; i++)
     cout<<stats(2*count-i)<<endl;
   double median = stats.median();
   int i = 1;
   while(stats(2*count-i)>1.1*median)
     i++;
   cout<<"fraction of trials greater than 10% of median = "
       <<(i-1.0)/count/2<<endl;
}

void output_barrierforpp(){
  int nthreads[] = {1,2,3,4,5,6,7,8,9,10,11,12};
  int nnum = 12;
  int countinner = 1000;
  int countouter = 1000*1000*100;
  double overhead;
  for(int i=0; i < nnum; i++){
    cout<<"nthread = "<<nthreads[i]<<endl;
    overhead = barrier_overhead(nthreads[i], countinner*1000*100);
    cout<<"barrier overhead = "<<overhead<<endl;
    
    overhead = ompfor_overhead(nthreads[i], countinner, countouter);
    cout<<"omp for overhead = "<<overhead<<endl;
    
    overhead = ompfornowait_overhead(nthreads[i], countinner, countouter);
    cout<<"omp for nowait overhead = "<<overhead<<endl;
    
    overhead = ompfordynamic_overhead(nthreads[i], countinner, countouter);
    cout<<"omp for dynamic overhead = "<<overhead<<endl;
    cout<<"**************************************************"<<endl;
    cout<<endl<<endl;
  }
}



int main(){
  for(int nthreads=1; nthreads <= 12; nthreads++){
    output_alternating(nthreads);
    cout<<"**************************************************"<<endl;
  }
  output_barrierforpp();
}

