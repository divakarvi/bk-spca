#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
#include "multasm.hh"
using namespace std;


void skew2x2(double *c, int m, int n){
  int ldc = m;
  for(int i=0; i < m; i+=2)
    for(int j=0; j < n; j+=2){
      double temp;
      temp = c[i+1+j*ldc];
      c[i+1+j*ldc] = c[i+1+(j+1)*ldc];
      c[i+1+(j+1)*ldc] = c[i+(j+1)*ldc];
      c[i+(j+1)*ldc] = temp;
    }
}

void transpose4x4(double *b, int m, int n, int ldb){
  for(int i=0; i < m; i+=4)
    for(int j=0; j < n; j+=4){
      double *bb = b+i+j*ldb;
      for(int ii=0; ii < 4; ii++)
	for(int jj=ii+1; jj<4; jj++){
	  double temp;
	  temp = bb[ii+jj*ldb];
	  bb[ii+jj*ldb] = bb[jj+ii*ldb];
	  bb[jj+ii*ldb] = temp;
	}
    }
}

void easymult(double *restrict a, double *restrict b, double *restrict c,
	      int m, int n, int p, 
	      int lda, int ldb, int ldc){
  for(int i=0; i < m; i++)
    for(int j=0; j < n; j++)
      for(int k=0; k < p; k++)
	c[i+k*ldc] += a[i+j*lda]*b[j+k*ldb];
}

void run4x1x4(){
  __declspec(align(16)) double a[4]={1,2,3,4};
  __declspec(align(16)) double b[4]={1,2,3,4};
  __declspec(align(16)) double c[16] = {0};
  for(int i=0; i < 16; i++)
    c[i] = -1;
  skew2x2(c, 4, 4);

  asm4x1x4(a, b, c, 4, 1, 4);
  
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);

  TimeStamp clk;
  
  clk.tic();
  for(int i=0; i < 1000*1000*1000; i++)
    asm4x1x4(a, b, c, 4,1, 4);
  double cycles = clk.toc();
  cout<<"cycles per 4x1x4 mult = "<<cycles/1000/1000/1000<<endl;
  cycles = cycles/1e9;
  cout<<"flops per cycle = "<<2.0*16/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
}

void run4x4x4(){
  __declspec(align(16)) double a[16];
  __declspec(align(16)) double b[16];
  __declspec(align(16)) double c[16];
  for(int i=0; i < 16; i++){
    a[i] = i+1;
    b[i] = i+1;
    c[i] = -1;
  }
  skew2x2(c, 4, 4);
  
  asm4x4x4(a, b, c, 4, 4, 4);
  
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  
  TimeStamp clk;
  
  clk.tic();
  for(int i=0; i < 1000*1000*1000; i++)
    asm4x4x4(a, b, c, 4,4, 4);
  double cycles = clk.toc();
  cout<<"cycles per 4x4x4 mult = "<<cycles/1000/1000/1000<<endl;
  cycles = cycles/1e9;
  cout<<"flops per cycle = "<<2.0*16*4/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  
}

void run4x36x4(){
  __declspec(align(16)) double a[4*36];
  __declspec(align(16)) double b[36*4];
  __declspec(align(16)) double c[16];
  for(int i=0; i < 4*36; i++){
    a[i] = i+1;
    b[i] = i+1;
  }
  for(int i=0; i < 16; i++)
    c[i] = -1;
  skew2x2(c, 4, 4);
  asm4x36x4(a, b, c, 4, 36, 4);
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);

  for(int i=0; i < 16; i++)
    c[i] = -1;
  transpose4x4(b, 36, 4, 36);
  easymult(a, b, c, 4, 36, 4, 4, 36, 4);
  cout<<endl<<endl;
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  

  TimeStamp clk;
  
  clk.tic();
  for(int i=0; i < 1000*1000*100; i++)
    asm4x36x4(a, b, c, 4,36, 4);
  double cycles = clk.toc();
  cout<<"cycles per 4x36x4 mult = "<<cycles/1000/1000/100<<endl;
  cycles = cycles/1e8;
  cout<<"flops per cycle = "<<2.0*16*36/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  
}

void run24x36x24(){
  __declspec(align(16)) double a[24*36];
  __declspec(align(16)) double b[36*24];
  __declspec(align(16)) double c[24*24];
  __declspec(align(16)) double cc[24*24];
  for(int i=0; i < 24*36; i++){
    a[i] = i+1;
    b[i] = i+1;
  }
  for(int i=0; i < 24*24; i++)
    c[i] = -1;
  skew2x2(c, 24, 24);
  mult24x36x24(a, b, c, 24, 36, 24);
  skew2x2(c, 24, 24);
  skew2x2(c, 24, 24);

  for(int i=0; i < 24*24; i++)
    cc[i] = -1;
  transpose4x4(b, 36, 24, 36);
  easymult(a, b, cc, 24, 36, 24, 24, 36, 24);
  cout<<endl<<endl;
  for(int i=0; i < 24; i++){
    for(int j=0; j < 24; j++)
      cout<<cc[i+j*24]-cc[i+j*24]<<" ";
    cout<<endl;
  }
  skew2x2(c, 24, 24);
 
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000; i++)
    mult24x36x24(a, b, c, 24,36, 24);
  double cycles = clk.toc();
  cout<<"cycles per 24x36x24 mult = "<<cycles/1000/1000<<endl;
  cycles = cycles/1e6;
  cout<<"flops per cycle = "<<2.0*24*36*24/cycles<<endl;
}

void run360(){
  __declspec(align(16)) double a[360*360];
  __declspec(align(16)) double b[360*360];
  __declspec(align(16)) double c[360*360];
  __declspec(align(16)) double cc[360*360];

  for(int i=0; i < 360*360; i++){
    a[i] = i+1;
    b[i] = i+1;
    c[i] = -1;
  }
  
  skew2x2(c, 360, 360);
  mult360(a, b, c, 360, 360, 360);
  skew2x2(c, 360, 360);
  skew2x2(c, 360, 360);

  for(int i=0; i < 360*360; i++)
    cc[i] = -1;
  transpose4x4(b, 360, 360, 360);
  easymult(a, b, cc, 360, 360, 360, 360, 360, 360);
  cout<<endl<<endl;
  for(int i=0; i < 360; i+=37){
    for(int j=0; j < 360; j+=31)
      cout<<cc[i+j*24]-cc[i+j*24]<<" ";
    cout<<endl;
  }
  skew2x2(c, 360, 360);

  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000; i++)
    mult360(a, b, c, 360, 360, 360);
  double cycles = clk.toc();
  cout<<"cycles per 360 mult = "<<cycles/1000<<endl;
  cycles = cycles/1e3;
  cout<<"flops per cycle = "<<2.0*360*360*360/cycles<<endl;
}

void time(){
  const int N = 360*10;
  __declspec(align(16)) double a[N*N];
  __declspec(align(16)) double b[N*N];
  __declspec(align(16)) double c[N*N];

  for(int i=0; i < N*N; i++){
    a[i] = i;
    b[i] = -i;
    c[i] = 0;
  }

  double cycles;
  TimeStamp clk;
  clk.tic();
  //multA(a,b,c,N,N,N);
  cycles = clk.toc();
  cout<<"flops per cycle = "<<2.0*N*N*N/cycles<<endl;

  clk.tic();
  multB(a,b,c,N,N,N);
  cycles = clk.toc();
  cout<<"flops per cycle = "<<2.0*N*N*N/cycles<<endl;

}

int main(){

  time();
  

}
