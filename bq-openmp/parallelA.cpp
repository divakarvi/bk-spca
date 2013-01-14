#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
#include <omp.h>
#include "StatVector.hh"
extern void dummy();

void parallelA(int nthreads, StatVector& stats){
  TimeStamp clk;
  clk.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)
  {
    dummy();
  }
  double cycles = clk.toc();
  stats.insert(cycles);
}

