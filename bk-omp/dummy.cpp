#include <iostream>
using namespace std;

#ifdef __GNUC__
#define restrict __restrict
#endif

void dummy(){
}

int dummy(int& x){
  return x;
}

double dummy(double& x){
  return x;
}

void dummy(long * p){

}

void addx(int *restrict ptr, int *restrict list, int n){
  for(int i=0; i < n; i++)
    list[i] += *ptr;
}

void vaddx(volatile int *restrict ptr, int *restrict list, 
	   int n){
  for(int i=0; i < n; i++)
    list[i] += *ptr;
}

