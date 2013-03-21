#include <iostream>
extern void dummy(long *a);

int main(){
  long a[1000*1000*1000];
  for(long i=0; i < 1000*1000*1000; i++)
    a[i] = 0;
  dummy(a);
}
