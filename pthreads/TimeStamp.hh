#ifndef __math671oct2009__
#define __math671oct2009__

#include <cmath>

class TimeStamp{
private:
  unsigned int a1, d1;
  unsigned int a2, d2;
  int corr;//cpuid correction
public:
  TimeStamp(){
    tic();
    asm volatile("cpuid"::"a"(0):"ebx","ecx","edx");
    asm volatile("rdtsc" : "=a" (a2), "=d" (d2));
    asm volatile("cpuid"::"a"(0):"ebx","ecx","edx");
    corr = (int)convert(a1, d1, a2, d2);
    if(corr < 0)
      corr = 0;
  };
  void ticc(){//uses cpuid
    asm volatile("cpuid"::"a"(0):"ebx","ecx","edx");
    asm volatile("rdtsc" : "=a" (a1), "=d" (d1));
  }
  double tocc(){//uses cpuid
    asm volatile("cpuid"::"a"(0):"ebx","ecx","edx");
    asm volatile("rdtsc" : "=a" (a2), "=d" (d2));
    asm volatile("cpuid"::"a"(0):"ebx","ecx","edx");
    return convert(a1, d1, a2, d2)-corr;
  }
  void tic(){//does not use cpuid
    asm volatile("rdtsc" : "=a" (a1), "=d" (d1));
  }
  double toc(){//does not use cpuid
    asm volatile("rdtsc" : "=a" (a2), "=d" (d2));
    return convert(a1, d1, a2, d2);
  }
  int correction(){return corr;};
private:
  double convert(unsigned int A1, unsigned int D1, unsigned int A2, unsigned int D2){
    double val;
    val = D2-D1;
    val *= pow(2.0, 32.0);
    val = (val + A2) - A1;
    return val;
  }
};

#endif
