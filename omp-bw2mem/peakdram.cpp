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

#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <omp.h>
using namespace std;
extern double dummy(double& x);
const int LEN = 1000*1000*100;

double sum_onecore(double *list, int n){
  double ans = 0;
  for(int i=0; i < n; i++)
    ans += list[i];
  return ans;
}

void sum_manycore(int nthreads){
  int n = LEN*12/nthreads;
  double *glist = 
    (double *)_mm_malloc(1l*nthreads*n*sizeof(double), 
			 4096);
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist + tid*n;
    for(long i=0; i < n; i=i++)
      list[i] = 2.0*(tid+1)*(i%17);
#pragma omp barrier
    TimeStamp clk;
    clk.tic();
#pragma omp barrier 
    double sum=sum_onecore(list, n);
#pragma omp barrier
#pragma omp master
    {
      double cycles = clk.toc();
      cout<<"read bandwidth = "<<
	8.0*nthreads*n/cycles<<" bytes/cycle"<<endl;
      dummy(sum);
    }
  }
  _mm_free(glist);
}

void write_onecore(double *list, int n){
  for(int i=0; i < n; i++)
    list[i] = i;
}

void write_manycore(int nthreads){
  int n = LEN*12/nthreads;
  double *glist = (double *)_mm_malloc(1l*nthreads*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist + tid*n;
    for(long int i=0; i < n; i=i++)
	list[i] = 0.0;
#pragma omp barrier
    TimeStamp clk;
    clk.tic();
#pragma omp barrier 
    write_onecore(list, n);
#pragma omp barrier
#pragma omp master
    {
      double cycles = clk.toc();
      cout<<"write bandwidth = "<<
	8.0*nthreads*n/cycles<<" bytes/cycle"<<endl;
    }
  }
_mm_free(glist);
}

void copy_onecore(double *list, int n){
  for(int i=0; i < n/2; i++)
    list[i] = list[n/2+i];
}

void copy_manycore(int nthreads){
  int n = LEN*12/nthreads;
  double *glist = (double *)_mm_malloc(1l*nthreads*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist + tid*n;
    for(long int i=0; i < n; i=i++)
	list[i] = 0.0;
#pragma omp barrier
    TimeStamp clk;
    clk.tic();
#pragma omp barrier 
    copy_onecore(list, n);
#pragma omp barrier
#pragma omp master
    {
      double cycles = clk.toc();
      cout<<"copy bandwidth = "<<
	8.0*nthreads*n/cycles<<" bytes/cycle"<<endl;
    }
  }
_mm_free(glist);
}

int main(){
  for(int nth=1; nth<=12; nth++){
    cout<<"number of threads = "<<nth<<endl;
    sum_manycore(nth);
    write_manycore(nth);
    copy_manycore(nth);
    cout<<"**************************************************"<<endl;
  }
}
