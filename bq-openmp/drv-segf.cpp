#include <cstdio>
extern void ff0(long *a0, long *list, long n);
extern void f1(long *list, long n);
extern void f2();

void sum_arr(long *p,long len){
  long ans=0;
  for(long i=0; i < len; i++)
    ans += p[i];
  printf("sum = %ld\n",ans);
}

void f0(long *list, long n){
  long a0[1000];
  ff0(a0, list, n);
}

void run1(){
  long list[2000];
  for(int i=0; i < 2000; i++)
    list[i] = i;
  f0(list, 2000);
}


void run2(){
  long list[2000];
  for(int i=0; i < 2000; i++)
    list[i] = i;
  f1(list, 2000);
}


void run3(){
  long list[2000];
  for(int i=0; i < 2000; i++)
    list[i] = i+10000;
  f1(list, 2000);
}

void run4(){
  long list[2000];
  for(int i=0; i < 2000; i++)
    list[i] = -i;
  f0(list, 2000);
}

void run5(){
  long list[2000];
  for(int i=0; i < 2000; i++)
    list[i] = -i-1000*100;
  f2();
  f0(list, 2000);
}


int main(){
  printf("run1(): upward from st ptr, beyond stack_end\n");
  printf("run2(): upward from st ptr, within stack_end\n");
  printf("run3(): upward from st ptr, within stack_end avoiding %rip\n");
  printf("run4(): downward from st ptr, beyond stack_begin\n");
  printf("run5(): downward from st ptr, within stack_begin\n");

  int i;
  printf("run = ");
  scanf("%d", &i);
  switch(i){
  case 1:
    run1();
    break;
  case 2:
    run2();
    break;
  case 3:
    run3();
    break;
  case 4:
    run4();
    break;
  case 5:
    run5();
    break;
  }
}


