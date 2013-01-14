#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;
#include "multxmm.hh"


void skew2x2(double *restrict c, int ldc, int m, int n){
  for(int i=0; i < m; i+=2)
    for(int j=0; j < n; j+=2){
      double temp;
      temp = c[i+1+j*ldc];
      c[i+1+j*ldc] = c[i+1+(j+1)*ldc];
      c[i+1+(j+1)*ldc] = c[i+(j+1)*ldc];
      c[i+(j+1)*ldc] = temp;
    }
}

int main(){

  
  __declspec(align(16)) double a[1024] = {0};
  __declspec(align(16)) double b[1024] = {0};
  __declspec(align(16)) double c[16] = {0};

  for(int i=0; i < 1024; i++)
    a[i]=b[i]=i+1;
  for(int i=0; i < 16; i++)
    c[i] = 0;
  skew2x2(c, 4, 4, 4);

  for(int i=0; i < 4; i+=1)
    cout<<a[i]<<" "<<b[i]<<endl;

  multxmm4x1x4(a, b, c, -4, 1, 4);
  
  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);
  
  TimeStamp clk;
  double cycles;

  clk.tic();
  multxmm4x1x4(a, b, c, -4, 1, 4);
  cycles = clk.toc();
  cout<<endl
      <<"number of cycles per iteration of A1 = "<<cycles/1000/1000/1000<<endl;
  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);


  clk.tic();
  multxmm4x1x4R(a, b, c, -4, 1, 4);
  cycles = clk.toc();
  cout<<endl
      <<"number of cycles per iteration of U1 = "<<cycles/1000/1000/1000<<endl;
  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);

  
  clk.tic();
  multxmm4x1x4RU2(a, b, c, 4, 20, 4);
  cycles = clk.toc();
  cout<<endl<<
    "number of cycles per iteration of U5 = "<<cycles/1000/1000/1000<<endl;
  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);


  clk.tic();
  multxmm4x1x4RU5(a, b, c, 4, 20, 4);
  cycles = clk.toc();
  cout<<endl<<
    "number of cycles per iteration of U5 = "<<cycles/1000/1000/1000<<endl;
  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);
  
 }
