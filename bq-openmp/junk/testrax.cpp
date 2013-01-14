#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
using namespace std;

//a = void * 
#define loadrax(a)					\
  asm volatile("movq %0, %%rax \n\t"::"m"(*(a)):"%rax");
#define storerax(a)					\
  asm volatile("movq %%rax, %0 \n\t":"=m"(*(a))::"%rax");
#define incrax					\
  asm volatile("incq %%rax":::"%rax");

int main(){
 long int a=2;
 long int b=-2;
 loadrax(&a);
 incrax;
 incrax;
 incrax;
 storerax(&b);
 printf("%ld\n",b);
 return 0;
}
