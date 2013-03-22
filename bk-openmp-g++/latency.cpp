#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>

using namespace std;
const int n=10;

void latency(){
  int List[n*256];
  for(int i=0; i < n*256; i ++)
    List[i] = (i*66239)%(n*256);
  int LList[n*256];
  for(int i=0; i < n*256; i++)
    LList[List[i]]=List[(i+1)%(n*256)];
  //int is 4 bytes
  int FourPages[4096*n];
  for(int i=0; i < 256*n; i++)
    FourPages[16*i] = LList[i];
  //for(int i=0; i < 4096*n; i++)
  // _mm_clflush(FourPages+i);
  int index = 17;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 256*n; i++){
    index = FourPages[16*index];
  }
  double cycles = clk.toc();
  cout<<"index = "<<index<<endl;
  cout<<"cycles per access = "<<cycles/256/n<<endl;
}

int main(){
  
  latency();
  
}
