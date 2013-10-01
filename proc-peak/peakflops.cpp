#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;






void peakC(double *a, long int nitns){
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  for(long int i=0; i < nitns; i++){
    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    
    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");
  }
}

void peakC_unroll4(double *a, long int nitns){
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  for(long int i=0; i < nitns/4; i++){
    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    
    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    
    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    
    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    
    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");
  }
}

void peakD(double *a, long int nitns){
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  for(long int i=0; i < nitns; i++){
    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0"); 
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);
  }
}

void peakD_unroll8(double *a, long int nitns){
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  for(long int i=0; i < nitns/8; i++){
    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0"); 
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    /** 2 ***/

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0"); 
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    /*** 4 ***/

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0"); 
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0"); 
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);

    loadxmm(a, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm2");
    storexmm("%xmm2", a+100);

    loadxmm(a+12, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm3");
    storexmm("%xmm3", a+200);

    loadxmm(a+24, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm4");
    storexmm("%xmm4", a+300);

    loadxmm(a+36, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm5");
    storexmm("%xmm5", a+400);

    loadxmm(a+48, "%xmm0");
    mulxmm("%xmm1", "%xmm0");
    addxmm("%xmm0", "%xmm6");
    storexmm("%xmm6", a+500);
    
  }
}

void runpeak(){
  __declspec(align(16)) double a[1024]={0};
  long int nitns = (long)1000*1000*1000;
  TimeStamp clk;
  double cycles;
  
  clk.tic();
  peakA(nitns);
  cycles = clk.toc();
  cout<<"peakA: number of cycles per iteration = "<<cycles/nitns<<endl;
  
  clk.tic();
  peakA_unroll10(nitns);
  cycles = clk.toc();
  cout<<"peakA_unroll10: number of cycles per iteration = "<<cycles/nitns<<endl;

  clk.tic();
  peakB(nitns);
  cycles = clk.toc();
  cout<<"peakB: number of cycles per iteration = "<<cycles/nitns<<endl;

  clk.tic();
  peakC(a, nitns);
  cycles = clk.toc();
  cout<<"peakC: number of cycles per iteration = "<<cycles/nitns<<endl;

  clk.tic();
  peakC_unroll4(a, nitns);
  cycles = clk.toc();
  cout<<"peakC_unroll4: number of cycles per iteration = "<<cycles/nitns<<endl;

  clk.tic();
  peakD(a, nitns);
  cycles = clk.toc();
  cout<<"peakD: number of cycles per iteration = "<<cycles/nitns<<endl;
  
  clk.tic();
  peakD_unroll8(a, nitns);
  cycles = clk.toc();
  cout<<"peakD_unroll8: number of cycles per iteration = "<<cycles/nitns<<endl;
}

int main(){
  //runaddreg();
  //runaddarray();
  //runfivecycles();
  runpeak();
  //runmacro();
}
