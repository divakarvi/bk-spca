#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
#include "multasm.hh"
using namespace std;

void transpose2x2(double *restrict a, int lda, int m, int n){
  for(int i=0; i < m; i+=2)
    for(int j=0; j < n; j+=2){
      double temp;
      temp = a[i+1+j*lda];
      a[i+1+j*lda] = a[i+(j+1)*lda];
      a[i+(j+1)*lda] = temp;
    }
}

void skew2x2(double *restrict a, int lda, int m, int n){
  for(int i=0; i < m; i+=2)
    for(int j=0; j < n; j+=2){
      double temp;
      temp = a[i+1+j*lda];
      a[i+1+j*lda] = a[i+1+(j+1)*lda];
      a[i+1+(j+1)*lda] = a[i+(j+1)*lda];
      a[i+(j+1)*lda] = temp;
    }
}

void run4x4x4(){
  __declspec(align(16)) double a[1000];
  __declspec(align(16)) double b[1000];
  __declspec(align(16)) double c[16] = {0};

  for(int i=0; i < 1000; i++)
    a[i] = b[i] = i+1;
  transpose2x2(b, 36, 36, 4);
  for(int i=0; i < 16; i++)
    c[i] = 0;
  skew2x2(c, 4, 4, 4);


  for(int i=0; i < 8; i+=1)
    cout<<a[i]<<" "<<b[i]<<endl;

  asm4x30x4(a, b, c, 4, 36, 4);
  
  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);

  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*100; i++)
    asm4x30x4(a, b, c, 4, 36, 4);
  double cycles = clk.toc();
  
  cout<<"cycles per 4x30x4 mult = "<<cycles/1000/1000/100<<endl;
  cycles = cycles/1e8;
  cout<<"flops per cycle = "<<2.0*16*36/cycles<<endl;

  skew2x2(c, 4, 4, 4);
  skew2x2(c, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4, 4);

}

int main(){

  run4x4x4();
  

}
