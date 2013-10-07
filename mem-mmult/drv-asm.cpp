#include <iostream>
#include <iomanip>
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

//here b is in packed format
void transpose200x4(double *bb, int ldbb, double *b){
  for(int i=0; i < 200; i++)
    for(int j=0; j < 4; j++){
      b[j+i*4] = bb[i+j*ldbb];
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

void test4x200x12(){
  __declspec(align(16)) double a[800];
  __declspec(align(16)) double b[200*12];
  __declspec(align(16)) double c[4*12];
  double bb[200*12];
  double cc[4*12];
  for(int i=0; i < 800; i++)
    a[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 200*12; i++)
    bb[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 4*12; i++)
    c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;
  skew2x2(c, 4, 12);
  transpose200x4(bb,200,b); 
  transpose200x4(bb+800,200,b+800); 
  transpose200x4(bb+1600,200,b+1600); 
  mult4x200x12(a, b, c);
  easymult(a, bb, cc, 4, 200 , 12);
  skew2x2(c, 4, 12);
  skew2x2(c, 4, 12);

  for(int i=0; i < 4; i++){
    for(int j=0; j < 12; j++)
      cout<<cc[i+j*4]-c[i+j*4]<<" ";
    cout<<endl;
  }
}

void run4x200x12(){
  __declspec(align(16)) double a[800*150];
  __declspec(align(16)) double b[2400];
  __declspec(align(16)) double c[48*150];
  TimeStamp clk;
  double cycles;
  for(int i=0; i < 2400; i++)
    b[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 48*150; i++)
    c[i] = 0;
  for(int i=0; i < 800*150; i++)
    a[i] = rand()*1.0/RAND_MAX;
  clk.tic();
  for(int i=0; i < 1000*1000*10; i++)
    mult4x200x12(a+800*(i%150), b, c+48*(i%150));
  cycles = clk.toc();
  cycles = cycles/1e7;
  cout<<"flops per cycle (4x200x12) = "<<2.0*16*200*3/cycles<<endl;
  double x=0;
  for(int i=0; i < 150; i++)
    x +=c[48*i];
  cout<<"x = "<<x<<endl;
}

void test600x200x12(){
  __declspec(align(16)) double a[600*200];
  __declspec(align(16)) double b[200*12];
  __declspec(align(16)) double C[600*12];
  __declspec(align(16)) double scratch[7200];
  
  double aa[600*200];
  double bb[200*12];
  double cc[600*12];
  
  for(int i=0; i < 600*200; i++)
    aa[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 200*12; i++)
    bb[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 600*12; i++)
    C[i] = cc[i] =  rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 600; i++)
    for(int j=0; j < 200; j++){
      a[(i/4)*4*200+i%4+j*4] = aa[i+j*600];
    }
 
  skew2x2(C, 600, 12);
  transpose200x4(bb,200,b); 
  transpose200x4(bb+800,200,b+800); 
  transpose200x4(bb+1600,200,b+1600); 
  mult600x200x12(a, b, C, 600, scratch);
  easymult(aa, bb, cc, 600, 200, 12);

  //test with slow unpack
  skew2x2(C, 600, 12);
  skew2x2(C, 600, 12);
  double max = 0;
  for(int i=0; i < 7200; i++)
    if(fabs(C[i]-cc[i])>max)
      max = fabs(C[i]-cc[i]);
  cout<<"max error = "<<max<<endl;
  

  /*//test with fast unpack
  skew2x2(C+48*141, 4, 12);
  skew2x2(C+48*141, 4, 12);
  for(int i=0; i < 48; i++)
    cout<<C[48*141+i]-cc[4*141+i%4+(i/4)*600]<<endl;
  */
}

void run600x200x12(){
  __declspec(align(16)) double a[600*200];
  __declspec(align(16)) double bb[200*12*1000];
  __declspec(align(16)) double C[600000*12*2];
  __declspec(align(16)) double scratch[7200];
  
  int ldC = 60000;
  for(int i=0; i < 600*12; i++)
    a[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 200*12*1000; i++)
    bb[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 600000*12*2; i++)
    C[i] = 0;
  

  int count = 1000*10;
  TimeStamp clk;
  double cycles;
  clk.tic();
  for(int i=0; i < count; i++)
    mult600x200x12(a, bb, C, 600, scratch);
  cycles = clk.toc();
  cycles /= count;
  cout<<"flops per cycle (600x200x12) (in cache) = "
      <<2.0*600*200*12/cycles<<endl;

  clk.tic();
  double x = 0;
  for(int i=0; i < count; i++){
     mult600x200x12(a, bb, C+(i%10000)*600, 6000, scratch);
     x += C[(i%10000)*600]; 
  }
  cycles = clk.toc();
  cycles /= count;
  cout<<"flops per cycle (600x200x12) (C out of cache) = "
      <<2.0*600*200*12/cycles<<endl;
  cout<<"x = "<<x<<endl;
}

void test600x200x3000(){
  __declspec(align(16)) double A[600*200];
  __declspec(align(16)) double b[200*3000];
  __declspec(align(16)) double C[600*3000];
  __declspec(align(16)) double scratch[600*200+7200];

  double CC[600*3000];
  double bb[200*3000];

  for(int i=0; i < 600*200; i++)
    A[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 200*3000; i++)
    bb[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 600*3000; i++)
    C[i] = CC[i] = rand()*1.0/RAND_MAX-0.5;

  for(int i=0; i < 750; i++)
    transpose200x4(bb+i*800,200,b+i*800);
  skew2x2(C, 600, 3000);
  mult600x200x3000(A, 600, b, C, 600, scratch);
  easymult(A, bb, CC, 600, 200, 3000);
  skew2x2(C, 600, 3000);
  skew2x2(C, 600, 3000);
  double max = 0;
  for(int i=0; i < 600*3000; i++){
    if(fabs(C[i]-CC[i])>max)
      max = fabs(C[i]-CC[i]);
  }
  cout<<"max = "<<max<<endl;
}

void run600x200x3000(){
  __declspec(align(16)) double aa[600*200*10*2];
  int ldA = 6000;
  __declspec(align(16)) double b[200*3000];
  __declspec(align(16)) double C[600*3000*10];
  int ldC = 1200;
  __declspec(align(16)) double scratch[7200+600*200];
  for(int i=0; i < 600*200*10*2; i++)
    aa[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 200*3000; i++)
    b[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 600*3000*10; i++)
    C[i] = 0;
  int count = 400;
  TimeStamp clk;
  double cycles;
  clk.tic();
  for(int i=0; i < count; i++)
    mult600x200x3000(aa, 600, b, C, 600, scratch);
  cycles = clk.toc();
  cycles /= count;
  cout<<"flops per cycle 600x200x3000 (in cache) = "
      <<2.0*600*200*3000/cycles<<endl;
  
  double x = 0;
  clk.tic();
  for(int i=0; i < count; i++){
    mult600x200x3000(aa+600*200*(i%5), 6000, b, C+600*3000*(i%8), 600, scratch);
    x += C[600*3000*(i%8)];
  }
  cycles = clk.toc();
  cycles /= count;
  cout<<"flops per cycle 600x200x3000 (out of cache) = "
      <<2.0*600*200*3000/cycles<<endl;
  cout<<"x = "<<x<<endl;
}

void test3000x200x3000(){
  __declspec(align(16)) double A[3000*200];
  int ldA = 3000;
  __declspec(align(16)) double B[200*3000];
  int ldB = 200;
  __declspec(align(16)) double C[3000*3000];
  __declspec(align(16)) double scratch[200*3000+600*200+7200];
  int ldC = 3000;
  double CC[3000*3000];
  for(int i=0; i < 3000*200; i++)
    A[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 200*3000; i++)
    B[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < 3000*3000; i++)
    C[i] = CC[i] = rand()*1.0/RAND_MAX-0.5;
  skew2x2(C, 3000, 3000);
  mult3000x200x3000(A, ldA, B, ldB, C, ldC, scratch);
  easymult(A, B, CC, 3000, 200, 3000);
  skew2x2(C, 3000, 3000);
  skew2x2(C, 3000, 3000);
  double max = 0;
  for(int i=0; i < 3000*3000; i++)
    if(max < fabs(C[i]-CC[i]))
      max = fabs(C[i]-CC[i]);
  cout<<"max error = "<<max<<endl;
}

void run3000x200x3000(){
  __declspec(align(16)) double A[3000*200];
  int ldA = 3000;
  __declspec(align(16)) double B[200*3000*10];
  int ldB = 2000;
  __declspec(align(16)) double C[3000*3000];
  int ldC = 3000;
  __declspec(align(16)) double scratch[600*12+600*200+200*3000];
  for(int i=0; i < 3000*200; i++)
    A[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 200*3000*10; i++)
    B[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < 3000*3000; i++)
    C[i] = 0;
  
  double x = 0;
  TimeStamp clk;
  double cycles;
  clk.tic();
  for(int i=0; i < 100; i++){
    mult3000x200x3000(A, 3000, B, 2000, C, 3000, scratch);
    x += C[1];
  }

  cycles = clk.toc();
  cycles /= 100;
  cout<<"flops per cycle 3000x200x3000 = "<<2.0*3000*200*3000/cycles<<endl;
  cout<<"x = "<<x<<endl;
}

void testblock(){
  const int l = 6000;
  const int m = 6000;
  const int n = 6000;
  int count = 10;
  __declspec(align(16)) double A[l*m];
  __declspec(align(16)) double B[m*n];
  __declspec(align(16)) double C[l*n];
  double CC[l*n];
  __declspec(align(16)) double scratch[600*12+600*200+200*3000];
  for(int i=0; i < l*m; i++)
    A[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < m*n; i++)
    B[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < l*n; i++){
    C[i] = CC[i] = rand()*1.0/RAND_MAX-0.5;
  }
  skew2x2(C, l, n);
  blockmult(A, B, C, l, m, n, scratch);
  easymult(A, B, CC, l, m, n);
  skew2x2(C, l, n);
  skew2x2(C, l, n);
  double max = 0;
  for(int i=0; i < 10; i++)
    if(max < fabs(C[i]-CC[i]))
      max = fabs(C[i]-CC[i]);
  cout<<"max error = "<<max<<endl;
}

void runblock(){
  const int l = 9000;
  const int m = 9000;
  const int n = 9000;
  int count = 10;
  __declspec(align(16)) double A[l*m];
  __declspec(align(16)) double B[m*n];
  __declspec(align(16)) double C[l*n];
  __declspec(align(16)) double scratch[600*12+600*200+200*3000];
  
  for(int i=0; i < l*m; i++)
    A[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < m*n; i++)
    B[i] = rand()*1.0/RAND_MAX;
  for(int i=0; i < l*n; i++)
    C[i] = 0.0;
  
  TimeStamp clk;
  double cycles;
  clk.tic();
  for(int i=0; i < count; i++)
    blockmult(A,B,C, l, m, n, scratch);
  cycles = clk.toc();
  cycles /= count;
  cout<<"flops per cycle = "<<2.0*l*m*n/cycles<<endl;
  cout<<"C[1] = "<<C[1]<<endl;
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
