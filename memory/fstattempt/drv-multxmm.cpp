#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;
#include "multxmm.hh"

int main(){
  //runshuffle();
  
  __declspec(align(16)) double a[8] = {1,2,3,4,5,6,7,8};
  __declspec(align(16)) double b[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  __declspec(align(16)) double c[8] = {1,4,2,3,1,4,2,3};

  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;

  multxmm2x4x4A(a, b, c, 2, 4, 2);
  cout<<c[0]<<"  "<<c[3]<<" "<<c[4]<<" "<<c[7]<<endl;
  cout<<c[2]<<" "<<c[1]<<" "<<c[6]<<"  "<<c[5]<<endl;

  
  TimeStamp clk;
  double cycles;

  clk.tic();
  multxmm2x4x4A(a, b, c, 2, 4, 2);
  cycles = clk.toc();
  cout<<"number of cycles per iteration of A1 = "<<cycles/1000/1000/1000<<endl;
  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;
 


  clk.tic();
  multxmm2x4x4A(a, b, c, 2, 4, 2);
  cycles = clk.toc();
  cout<<"number of cycles per iteration of A2 = "<<cycles/1000/1000/1000<<endl;
  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;

  clk.tic();
  multxmm2x4x4B(a, b, c, 2, 4, 2);
  cycles = clk.toc();
  cout<<"number of cycles per iteration of B1 = "<<cycles/1000/1000/1000<<endl;
  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;
 


  clk.tic();
  multxmm2x4x4B(a, b, c, 2, 4, 2);
  cycles = clk.toc();
  cout<<"number of cycles per iteration of B2 = "<<cycles/1000/1000/1000<<endl;
  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;

  clk.tic();
  multasm1(a, b, c, 2, 4, 2);
  cycles = clk.toc();
  cout<<"number of cycles per iteration of asm1 = "<<cycles/1000/1000/1000<<endl;
  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;
 


  clk.tic();
  multasm1(a, b, c, 2, 4, 2);
  cycles = clk.toc();
  cout<<"number of cycles per iteration of asm1 = "<<cycles/1000/1000/1000<<endl;
  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<" "<<c[i]<<" "<<b[i+8]<<endl;
}
