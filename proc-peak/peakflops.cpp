#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;






void runfivecycles(){
  
  cout<<"fivecyclesA: number of cycles per iteration = "<<cycles/nitns<<endl;
  clk.tic();
  fivecyclesB(nitns);
  cycles = clk.toc();
  cout<<"fivecyclesB: number of cycles per iteration = "<<cycles/nitns<<endl;
}

void peakA(long int nitns){
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  zeroxmm("%xmm7");
  zeroxmm("%xmm8");
  zeroxmm("%xmm9");
  zeroxmm("%xmm10");
  zeroxmm("%xmm11");
  zeroxmm("%xmm12");
  zeroxmm("%xmm13");
  zeroxmm("%xmm14");
  zeroxmm("%xmm15");
  for(long int i=0; i < nitns; i++){
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
  }
}

void peakA_unroll10(long int nitns){
  long int  i;
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  zeroxmm("%xmm7");
  zeroxmm("%xmm8");
  zeroxmm("%xmm9");
  zeroxmm("%xmm10");
  zeroxmm("%xmm11");
  zeroxmm("%xmm12");
  zeroxmm("%xmm13");
  zeroxmm("%xmm14");
  zeroxmm("%xmm15");
  for(i=0; i < nitns/10; i++){
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
    
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");

    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
    
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");

    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
    
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");

    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
    
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");

    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
    
    addxmm("%xmm0", "%xmm1");
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm3", "%xmm4");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm6", "%xmm7");
    mulxmm("%xmm7", "%xmm8");
    addxmm("%xmm9", "%xmm10");
    mulxmm("%xmm10", "%xmm11");
    addxmm("%xmm12", "%xmm13");
    mulxmm("%xmm13", "%xmm14");
  }
}

void peakB(long int nitns){
  long int  i;
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  zeroxmm("%xmm4");
  zeroxmm("%xmm5");
  zeroxmm("%xmm6");
  zeroxmm("%xmm7");
  zeroxmm("%xmm8");
  zeroxmm("%xmm9");
  zeroxmm("%xmm10");
  zeroxmm("%xmm11");
  zeroxmm("%xmm12");
  zeroxmm("%xmm13");
  zeroxmm("%xmm14");
  zeroxmm("%xmm15");
  for(i=0; i < nitns; i++){
    mulxmm("%xmm0", "%xmm1");
    addxmm("%xmm1", "%xmm10");
    mulxmm("%xmm2", "%xmm3");
    addxmm("%xmm1", "%xmm11");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm5", "%xmm12");
    mulxmm("%xmm6", "%xmm7");
    addxmm("%xmm5", "%xmm13");
    mulxmm("%xmm8", "%xmm9");
    addxmm("%xmm9", "%xmm10");

    mulxmm("%xmm0", "%xmm1");
    addxmm("%xmm9", "%xmm11"); 
    mulxmm("%xmm2", "%xmm3");
    addxmm("%xmm3", "%xmm12");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm3", "%xmm13");
    mulxmm("%xmm6", "%xmm7");
    addxmm("%xmm7", "%xmm10");
    mulxmm("%xmm8", "%xmm9");
    addxmm("%xmm7", "%xmm11");

    mulxmm("%xmm0", "%xmm1");
    addxmm("%xmm1", "%xmm12");
    mulxmm("%xmm2", "%xmm3");
    addxmm("%xmm1", "%xmm13");
    mulxmm("%xmm4", "%xmm5");
    addxmm("%xmm5", "%xmm10");
    mulxmm("%xmm6", "%xmm7");
    addxmm("%xmm5", "%xmm11");
    mulxmm("%xmm8", "%xmm9");
    addxmm("%xmm9", "%xmm12");
  }
}

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

void runmacro(){
  __declspec(align(16)) double a[2]={1,2};
  __declspec(align(16)) double b[2]={-1,-2};
  loadxmm(a, "%xmm0");
  loadxmm(b, "%xmm1");
  addxmm("%xmm1", "%xmm0");
  storexmm("%xmm0", a);
  printf("%f %f \n", a[0], a[1]);
}

int main(){
  //runaddreg();
  //runaddarray();
  //runfivecycles();
  runpeak();
  //runmacro();
}
