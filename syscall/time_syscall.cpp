#include <unistd.h>
#include <asm/unistd.h>
#include <stdio.h>
#include "TimeStamp.hh"
#include <iostream>
using namespace std;
extern void setdummy(int x);
int main(){
  int y;
  TimeStamp clk;
  int count = 1000*1000*100;
  clk.tic();
  for(int i=0; i < count; i++)
    y=syscall(__NR_set_dvflag,0);
  double cycles = clk.toc();
  printf("sys call ret val = %d \n",y);
  cout<<"cycles per sys call = "<<cycles/count<<endl;

  clk.tic();
  for(int i=0; i < count; i++)
    setdummy(0);
  cycles = clk.toc();
  cout<<"cycles per fn call = "<<cycles/count<<endl;
}
