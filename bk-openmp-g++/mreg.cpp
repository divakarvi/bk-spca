#include <cstdlib>

void mreg(long *a, long n){
  for(long i=0; i < 5; i++)
    a[i] = i;
  a[n-1] = n-1;
} 
