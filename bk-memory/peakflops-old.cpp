#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <xmmintrin.h>
#include <emmintrin.h>
using namespace std;

//R must be "%xmmi" 0<=i<=15
#define zeroxmm(R)				\
  asm volatile("xorps %" R ", %" R "\n\t":::R);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define addxmm(R1, R2)					\
  asm volatile("addpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define mulxmm(R1, R2)					\
  asm volatile("mulpd %" R1 ", %" R2 "\n\t":::R1, R2);	

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define loadxmm(a, R)					\
  asm volatile("movaps %0, %" R "\n\t"::"m"(*(a)):R);	

//R = "%xmmi" 0<=i<=15xmm
//a = double * (16 byte aligned)
#define storexmm(R, a)					\
  asm volatile("movaps %" R ", %0 \n\t":"=m"(*(a))::R);	



// a[0..2] += nitns*b[0..2]
//(expect 3 clock ticks per iteration)
void peak0(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(b, "%xmm1");
  for(i=0; i < nitns; i++)
    addxmm("%xmm0","%xmm1");
  storexmm("%xmm1", a);
}

// a[0..3] += nitns*b[0..3]
//(expect 3 clock ticks per iteration)
void peak1(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(b, "%xmm2");
  loadxmm(b+2, "%xmm3");
  for(i=0; i < nitns; i++){
    addxmm("%xmm2", "%xmm0");
    addxmm("%xmm3", "%xmm1");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
}


// a[0..3] *= b[0..3]^nitns
//(expect 5 clock ticks per iteration)
void peak2(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(b, "%xmm2");
  loadxmm(b+2, "%xmm3");
  for(i=0; i < nitns; i++){
    mulxmm("%xmm2", "%xmm0");
    mulxmm("%xmm3", "%xmm1");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
}

//a[0..3] += nitns*b[0..3]
//a[4..7] *= b[4..7]^nitns
//(expect 5 clock ticks per  iteration)
void peak3(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(a+4, "%xmm2");
  loadxmm(a+6, "%xmm3");
  loadxmm(a+8, "%xmm4");
  loadxmm(b, "%xmm5");
  loadxmm(b+2, "%xmm6");
  loadxmm(b+4, "%xmm7");
  loadxmm(b+6, "%xmm8");
  loadxmm(b+8, "%xmm9");
  for(i=0; i < nitns; i++){
    addxmm("%xmm5", "%xmm0");
    addxmm("%xmm6", "%xmm1");
    addxmm("%xmm7", "%xmm2");
    mulxmm("%xmm8", "%xmm3");
    mulxmm("%xmm9", "%xmm4");
    addxmm("%xmm5", "%xmm0");
    addxmm("%xmm6", "%xmm1");
    addxmm("%xmm7", "%xmm2");
    mulxmm("%xmm8", "%xmm3");
    mulxmm("%xmm9", "%xmm4");
    addxmm("%xmm5", "%xmm0");
    addxmm("%xmm6", "%xmm1");
    addxmm("%xmm7", "%xmm2");
    mulxmm("%xmm8", "%xmm3");
    mulxmm("%xmm9", "%xmm4");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
  storexmm("%xmm2", a+4);
  storexmm("%xmm3", a+6);
  storexmm("%xmm4", a+8);
}

//a[0..7] += nitns*b[0..7]
//(expect 4 clock ticks per iteration)
void peak4(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(a+4, "%xmm2");
  loadxmm(a+6, "%xmm3");
  loadxmm(b, "%xmm4");
  loadxmm(b+2, "%xmm5");
  loadxmm(b+4, "%xmm6");
  loadxmm(b+6, "%xmm7");
  for(i=0; i < nitns; i++){
    addxmm("%xmm4", "%xmm0");
    addxmm("%xmm5", "%xmm1");
    addxmm("%xmm6", "%xmm2");
    addxmm("%xmm7", "%xmm3");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
  storexmm("%xmm2", a+4);
  storexmm("%xmm3", a+6);
}

//a[0..5] += nitns*b[0..5]
//a[6..15] *= b[6..15]^nitns
//(expect 5 clock ticks per iteration)
void peak5(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(a+4, "%xmm2");
  loadxmm(a+6, "%xmm3");
  loadxmm(a+8, "%xmm4");
  loadxmm(a+10, "%xmm5");
  loadxmm(a+12, "%xmm6");
  loadxmm(a+14, "%xmm7");
  loadxmm(b, "%xmm8");
  loadxmm(b+2, "%xmm9");
  loadxmm(b+4, "%xmm10");
  loadxmm(b+6, "%xmm11");
  loadxmm(b+8, "%xmm12");
  loadxmm(b+10, "%xmm13");
  loadxmm(b+12, "%xmm14");
  loadxmm(b+14, "%xmm15");
  for(i=0; i < nitns; i++){
    addxmm("%xmm8", "%xmm0");
    addxmm("%xmm9", "%xmm1");
    addxmm("%xmm10", "%xmm2");
    mulxmm("%xmm11", "%xmm3");
    mulxmm("%xmm12", "%xmm4");
    mulxmm("%xmm13", "%xmm5");
    mulxmm("%xmm14", "%xmm6");
    mulxmm("%xmm15", "%xmm7");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
  storexmm("%xmm2", a+4);
  storexmm("%xmm3", a+6);
  storexmm("%xmm4", a+8);
  storexmm("%xmm5", a+10);
  storexmm("%xmm6", a+12);
  storexmm("%xmm7", a+14);
}


//a[0..5] += nitns*b[0..5]*5/3
//a[6..15] *= b[6..15]^nitns
//(expect 15 clock ticks per iteration)
//Reordering the statements does not make a difference.
void peak8(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(a+4, "%xmm2");
  loadxmm(a+6, "%xmm3");
  loadxmm(a+8, "%xmm4");
  loadxmm(a+10, "%xmm5");
  loadxmm(a+12, "%xmm6");
  loadxmm(a+14, "%xmm7");
  loadxmm(b, "%xmm8");
  loadxmm(b+2, "%xmm9");
  loadxmm(b+4, "%xmm10");
  loadxmm(b+6, "%xmm11");
  loadxmm(b+8, "%xmm12");
  loadxmm(b+10, "%xmm13");
  loadxmm(b+12, "%xmm14");
  loadxmm(b+14, "%xmm15");
  for(i=0; i < nitns; i++){
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");

    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
  storexmm("%xmm2", a+4);
  storexmm("%xmm3", a+6);
  storexmm("%xmm4", a+8);
  storexmm("%xmm5", a+10);
  storexmm("%xmm6", a+12);
  storexmm("%xmm7", a+14);
}

//a[0..5] += nitns*b[0..5]*5/3
//a[6..15] *= b[6..15]^nitns
//(expect 90 clock ticks per iteration)
//By unrolling the loop we get to within 2% of the peak performance!
void peak9(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(a+2, "%xmm1");
  loadxmm(a+4, "%xmm2");
  loadxmm(a+6, "%xmm3");
  loadxmm(a+8, "%xmm4");
  loadxmm(a+10, "%xmm5");
  loadxmm(a+12, "%xmm6");
  loadxmm(a+14, "%xmm7");
  loadxmm(b, "%xmm8");
  loadxmm(b+2, "%xmm9");
  loadxmm(b+4, "%xmm10");
  loadxmm(b+6, "%xmm11");
  loadxmm(b+8, "%xmm12");
  loadxmm(b+10, "%xmm13");
  loadxmm(b+12, "%xmm14");
  loadxmm(b+14, "%xmm15");
  for(i=0; i < nitns; i++){
    /* 1st block of 30 ops */
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
    /* 2nd block of 30 ops */
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
    /* 3rd block of 30 ops */
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
    /* 4th block of 30 ops */
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
    /* 5th block of 30 ops */
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
    /* 6th block of 30 ops */
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm11","%xmm3");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm12","%xmm4");
    addxmm("%xmm10","%xmm2");
    mulxmm("%xmm13","%xmm5");
    addxmm("%xmm8","%xmm0");
    mulxmm("%xmm14","%xmm6");
    addxmm("%xmm9","%xmm1");
    mulxmm("%xmm15","%xmm7");
    addxmm("%xmm10","%xmm2");
  }
  storexmm("%xmm0", a);
  storexmm("%xmm1", a+2);
  storexmm("%xmm2", a+4);
  storexmm("%xmm3", a+6);
  storexmm("%xmm4", a+8);
  storexmm("%xmm5", a+10);
  storexmm("%xmm6", a+12);
  storexmm("%xmm7", a+14);
}



int main(int argc, char** argv){
  if(argc < 2){
    cout<<"Usage: "<<argv[0]<<" nitns"<<endl;
    return -1;
  }
  int count = atoi(*++argv);
  long int nitns = count*1000;
  cout<<"nitns = "<<nitns<<endl;
  __declspec(align(16)) double a[300];//8 xmm registers totally for a
  __declspec(align(16)) double b[300];//8 more for b
  //printf("a b = %p %p \n", a, b);
  TimeStamp clkticks;

  {//call peak0
    a[0]=0; a[1] = 1; 
    b[0]=1; b[1] = 2; 
    clkticks.tic();
    peak0(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 0) number of cycles per iteration = "<<ticks/nitns<<endl;
    cout<<"a = "<<a[0]<<" "<<a[1]<<endl;
  }

  {//call peak1
    a[0]=0; a[1] = 1; a[2] = 2; a[3] = 3;
    b[0]=1; b[1] = 2; b[2] = 3; b[3] = 4;
    clkticks.tic();
    peak1(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 1) number of cycles per iteration = "<<ticks/nitns<<endl;
    cout<<"a = "<<a[0]<<" "<<a[1]<<" "<<a[2]<<" "<<a[3]<<endl;
  }

  {//call peak2
    a[0]=1; a[1] = 2; a[2] = 3; a[3] = 6;
    b[0]=1+1e-9; b[1] = 1+1e-9; b[2] = 1+2e-9; b[3] = 1+2e-9;
    clkticks.tic();
    peak2(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 2) number of cycles per iteration = "<<ticks/nitns<<endl;
    cout<<"a = "<<a[0]<<" "<<a[1]<<" "<<a[2]<<" "<<a[3]<<endl;
  }

  {//call peak3
    for(int i=0; i < 4; i++){
      a[i] = i+1;
      b[i] = 1+1e-9*(i+1);
      a[i+6] = i+1;
      b[i+6] = 1 + 1e-9*(i+1);
    }
    a[4]=4; a[5]=5;
    b[4]=1+4e-9; b[5]=1+5e-9;
    clkticks.tic();
    peak3(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 3) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 10; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;

  }


  {//call peak4
    for(int i=0; i < 8; i++){
      a[i] = i+1;
      b[i] = i+1;
    }
    clkticks.tic();
    peak4(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 4) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 8; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;
  }


  {//call peak5
    for(int i=0; i < 16; i++){
      if(i<6){
	a[i] = i+1;
	b[i] = i+1;
      }
      else{
	a[i] = i+1;
	b[i] = 1 + 1e-9*(i+1);
      }
    }
    clkticks.tic();
    peak5(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 5) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 16; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;
  }
  
  return 1;

  /*{//call peak6
    for(int i=0; i < 16; i++){
      if(i<6){
	a[i] = i+1;
	b[i] = i+1;
      }
      else{
	a[i] = i+1;
	b[i] = 1 + 1e-9*(i+1);
      }
    }
    clkticks.tic();
    peak6(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 6) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 16; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;
      }

  {//call peak7
    for(int i=0; i < 16; i++){
      if(i<6){
	a[i] = i+1;
	b[i] = i+1;
      }
      else{
	a[i] = i+1;
	b[i] = 1 + 1e-9*(i+1);
      }
    }
    clkticks.tic();
    peak7(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 7) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 16; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;
      }*/
  {//call peak8
    for(int i=0; i < 16; i++){
      if(i<6){
	a[i] = i+1;
	b[i] = i+1;
      }
      else{
	a[i] = i+1;
	b[i] = 1 + 1e-9*(i+1);
      }
    }
    clkticks.tic();
    peak8(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 8) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 16; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;
  }
  {//call peak9
    for(int i=0; i < 16; i++){
      if(i<6){
	a[i] = i+1;
	b[i] = i+1;
      }
      else{
	a[i] = i+1;
	b[i] = 1 + 1e-9*(i+1);
      }
    }
    clkticks.tic();
    peak9(a, b, nitns);
    double ticks = clkticks.toc();
    cout<<"(peak 9) number of cycles per iteration = "<<ticks/nitns<<endl;
    for(int i=0; i < 16; i++)
      cout<<"a["<<i<<"] = "<<a[i]<<endl;
  }
  
}
