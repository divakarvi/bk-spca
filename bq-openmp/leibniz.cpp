#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
#include <omp.h>
using namespace std;

double leibniz(long int n){
  long int i;
  double ans=4.0;
  for(i=1; i < n; i=i+2){
    ans -= 4.0/(2.0*i+1);
    ans += 4.0/(2.0*i+3);
  }
  return ans;
}


double parallel(long int n, int nthreads){
  assert(nthreads%2==0);
  double ans=0;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, nthreads, ans)
  {
    double sum=0;
    int offset = omp_get_thread_num();
    for(long int i=offset; i < n; i=i+nthreads)
      sum += 4.0/(2*i+1);
  #pragma  omp critical
    if(offset%2==0)
      ans += sum;
    else
      ans -= sum;
  }
  return ans; 
}

void partialsum(int offset, long int n, int nthreads, 
		double & ans){
  double sum = 0;
  for(long int i=offset; i < n; i=i+nthreads)
      sum += 4.0/(2*i+1);
  #pragma  omp critical
    if(offset%2==0)
      ans += sum;
    else
      ans -= sum;
}

double parallelX(long int n, int nthreads){
  assert(nthreads%2==0);
  double ans=0;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, nthreads, ans)
  {
    int offset = omp_get_thread_num();
    partialsum(offset, n, nthreads, ans);
  }
  return ans; 
}


double ompfor(long int n,  int nthreads){
  double ans=0;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, ans)				
  {
    double sum=0;
  #pragma omp for				\
    schedule(static)
    for(long int i=0; i < n; i = i+2)
      {
	sum += 4.0/(2*i+1);
	sum -= 4.0/(2*i+3);
      }
  #pragma omp critical
    ans += sum;
  }
  return ans;
}


double ompforchunk(long int n,  int nthreads, int chunk){
  double ans=0;
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(n, ans, chunk)		   
  {
    double sum = 0;
  #pragma omp for				\
    schedule(static, chunk)
    for(long int i=0; i < n; i = i+2)
      {
	sum += 4.0/(2*i+1);
	sum -= 4.0/(2*i+3);
      }
  #pragma omp critical
    ans += sum;
  }
  return ans;
}




double parallelfor(long int n, int nthreads){
  double ans=0;
#pragma omp parallel for			\
  num_threads(nthreads)				\
  schedule(static)				\
  default(none)					\
  shared(n)					\
  reduction(+:ans)
  for(long int i=0; i < n; i = i+2)
  {
    ans += 4.0/(2*i+1);
    ans -= 4.0/(2*i+3);
  }
  return ans;
}

double section(long int n){
  double ans=0;
#pragma omp parallel				\
  num_threads(2)				\
  default(none)					\
  shared(n, ans)                                
  {
    double sum=0;
  #pragma omp sections
    {
    #pragma omp section
      for(int i=0; i < n; i=i+2)
	sum += 4.0/(2*i+1);
    #pragma omp section
      for(int i=1; i < n; i=i+2)
	sum -= 4.0/(2*i+1);
    }
  #pragma omp critical
    ans += sum;
  }
  return ans;
}

