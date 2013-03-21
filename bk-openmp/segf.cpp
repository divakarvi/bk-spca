extern void sum_arr(long *, long);
extern void f0(long *list, long n);

void ff0(long *a0, long *list, long n){
  for(int i=0; i < 1000; i++)
    a0[i] = 0;
  for(long i=0; i < n; i++)
    a0[list[i]] = list[i]*list[i]; 
  sum_arr(a0, 1000);
}


void f1(long *list, long n){
  long a1[1000*1000];
  for(int i=0; i < 1000*1000; i++)
    a1[i] = 0;
  f0(list, n);
  sum_arr(a1, 1000*1000);
}


void f2(){
  long a1[1000*1000];
  for(int i=0; i < 1000*1000; i++)
    a1[i] = 0;
  sum_arr(a1, 1000*1000);
}
