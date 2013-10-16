#include <stdio.h>
extern long fun1(long *p, long x1, long x2, long x3,
		long x4, long x5, long x6, long x7);

long fun0(){
  const long N = 1000*1000*1000;
  long local[N];
  long i;
  for(i=0; i < N; i++)
    local[i] = i;
  long ans = fun1(local, 1, 2, 3, 4, 5, 6, 7);
  return ans;
}

int main(){
  printf("ans = %d \n", fun0());
}
