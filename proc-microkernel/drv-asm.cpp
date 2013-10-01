#include "../utils/StatVector.hh"
#include "../utils/TimeStamp.hh"
#include "asm4xnx4.hh"
#include <cstdio>
#include <cmath>
#include <cassert>

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

void easymult(double *restrict a, double *restrict b, double *restrict c,
	      int m, int n, int p){
  int lda = m;
  int ldb = n;
  int ldc = m;
  for(int i=0; i < m; i++)
    for(int j=0; j < n; j++)
      for(int k=0; k < p; k++)
	c[i+k*ldc] += a[i+j*lda]*b[j+k*ldb];
}

void run4x1x4(){
  __declspec(align(16)) double a[4]={1,2,3,4};
  __declspec(align(16)) double b[4]={1,2,3,4};
  __declspec(align(16)) double c[16] = {0};
  double cc[16];
  for(int i=0; i < 16; i++)
    c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 4; i++){
    a[i] = rand()*1.0/RAND_MAX-0.5;
    b[i] = rand()*1.0/RAND_MAX-0.5;
  }
  skew2x2(c, 4, 4);
  asm4x1x4(a, b, c);
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  easymult(a, b, cc, 4, 1, 4);

  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]-cc[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*1000; i++)
    asm4x1x4(a, b, c);
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
  double bb[16], cc[16];
  for(int i=0; i < 16; i++){
    a[i] = rand()*1.0/RAND_MAX-0.5;
    b[i] = rand()*1.0/RAND_MAX-0.5;
    c[i] = cc[i] = (rand()/RAND_MAX*1.0-0.5);
  }
  for(int i=0; i < 4; i++)
    for(int j=0; j < 4; j++){
      bb[i+4*j] = b[j+4*i];
    }
  skew2x2(c, 4, 4);
  asm4x4x4(a, b, c);
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  easymult(a, bb, cc, 4, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]-cc[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*1000; i++)
    asm4x4x4(a, b, c);
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


void run4x20x4(){
  __declspec(align(16)) double a[80];
  __declspec(align(16)) double b[80];
  __declspec(align(16)) double c[16];
  for(int i=0; i < 80; i++){
    a[i] = 1;
    b[i] = 1;
  }
  for(int i=0; i < 16; i++)
    c[i] = 0;
  skew2x2(c, 4, 4);
  asm4x20x4(a, b, c);
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
  for(int i=0; i < 1000*1000*100; i++)
    asm4x20x4(a, b, c);
  double cycles = clk.toc();
  cout<<"cycles per 4x20x4 mult = "<<cycles/1000/1000/100<<endl;
  cycles = cycles/1e8;
  cout<<"flops per cycle = "<<2.0*16*20/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
}



void run4x40x4(){
  __declspec(align(16)) double a[160];
  __declspec(align(16)) double b[160];
  __declspec(align(16)) double c[16];
  double bb[160], cc[16];
  for(int i=0; i < 160; i++){
    a[i] = rand()*1.0/RAND_MAX-0.5;
    b[i] = rand()*1.0/RAND_MAX-0.5;
  }
  for(int i=0; i < 16; i++)
    c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 40; i++)
    for(int j=0; j < 4; j++)
      bb[i+j*40] = b[j+i*4];
  skew2x2(c, 4, 4);
  asm4x40x4(a, b, c);
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  easymult(a, bb, cc, 4, 40, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]-cc[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*100; i++)
    asm4x40x4(a, b, c);
  double cycles = clk.toc();
  cout<<"cycles per 4x40x4 mult = "<<cycles/1000/1000/100<<endl;
  cycles = cycles/1e8;
  cout<<"flops per cycle = "<<2.0*16*40/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
}


void run4x100x4(){
  __declspec(align(16)) double a[400];
  __declspec(align(16)) double b[400];
  __declspec(align(16)) double c[16];
  double bb[400], cc[16];
  for(int i=0; i < 400; i++){
    a[i] = rand()*1.0/RAND_MAX-0.5;
    b[i] = rand()*1.0/RAND_MAX-0.5;
  }
  for(int i=0; i < 16; i++)
    c[i] = cc[i] = (rand()*1.0/RAND_MAX-0.5);
  for(int i=0; i < 100; i++)
    for(int j=0; j < 4; j++)
      bb[i+j*100] = b[j+i*4];
  skew2x2(c, 4, 4);
  asm4x100x4(a, b, c);
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  easymult(a, bb, cc, 4, 100, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]-cc[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*100; i++)
    asm4x100x4(a, b, c);
  double cycles = clk.toc();
  cout<<"(A in L2) cycles per 4x100x4 mult = "<<cycles/1000/1000/100<<endl;
  cycles = cycles/1e8;
  cout<<"flops per cycle = "<<2.0*16*100/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);

  __declspec(align(16)) double aa[400*100];
  for(int i=0; i < 40000; i++)
    aa[i] = 1;
  clk.tic();
  for(int i=0; i < 1000*1000*10; i++)
    asm4x100x4(aa+400*(i%100), b, c);
  cycles = clk.toc();
  cout<<"cycles per 4x100x4 mult = "<<cycles/1000/1000/10<<endl;
  cycles = cycles/1e7;
  cout<<"flops per cycle = "<<2.0*16*100/cycles<<endl;
  skew2x2(c, 4, 4);
  skew2x2(c, 4, 4);
  for(int i=0; i < 4; i++){
    for(int j=0; j < 4; j++)
      cout<<c[i+j*4]<<" ";
    cout<<endl;
  }
  skew2x2(c, 4, 4);
  
}


void run4x200x4(){
  __declspec(align(16)) double a[800*150];
  __declspec(align(16)) double b[800];
  __declspec(align(16)) double c[16*150];
  for(int i=0; i < 800; i++)
    b[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 800*150; i++)
    a[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 16; i++)
    c[i] = 0;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*10; i++)
    asm4x200x4(a+(i%150)*800, b, c+(i%150)*16);
  double cycles = clk.toc();
  cycles = cycles/1e7;
  cout<<"(4x200x4)flops per cycle = "<<2.0*16*200/cycles<<endl;
  double x = 0;
  for(int i=0; i < 16*150; i++)
    x += c[i];
  cout<<"x = "<<x<<endl;
}



int main(){
  //run4x20x4();
  //run4x40x4();
  //run4x100x4();
  run4x200x4();
  //test4x200x12();
  run4x200x12();
  //test600x200x12();
  run600x200x12();
  //test600x200x3000();
  run600x200x3000();
  //test3000x200x3000();
  run3000x200x3000();
  //testblock();
  runblock();
}
