#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
using namespace std;


void cpuid01h(){
  cout<<endl<<endl;
  cout<<"CPUID with code 01h"<<endl;
  unsigned int eax;
  asm volatile("cpuid":"=a"(eax):"a"(0x01):"ebx", "ecx","edx");
  printf("(deciphered below) eax = %x \n", eax);
  printf("extended family = %x\n", 0xFF & (eax>>20));
  printf("extended model = %x\n", 0xF & (eax>>16));
  printf("processor type = %x\n", 0x3 & (eax>>12));
  printf("family code = %x\n", 0xF & (eax>>8));
  printf("model number = %x\n", 0xF&(eax>>4));
  printf("stepping id = %x\n", 0xF & eax);  
}

void cpuid02h(){
  cout<<endl<<endl;
  cout<<"CPUID with code 02h"<<endl;
  unsigned int eax, ebx, ecx, edx;
  asm volatile("cpuid":"=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx):"a"(0x02));
  cout<<"number of calls necessary = "<<(0xFF&eax)<<endl;
  //printf("eax, ebx, ecx, edx = %x %x %x %x \n", eax, ebx, ecx, edx);
  if(((eax<<1)&0x1)==0){
    cout<<"eax is valid"<<endl;
    printf("codes = %x %x %x\n", 
	   (eax>>24)&0xFF,(eax>>16)&0xFF,(eax>>8)&0xFF);
	   
  }
  if(((ebx<<1)&0x1)==0){
    cout<<"ebx is valid"<<endl;
    printf("codes = %x %x %x %x \n", 
	   (ebx>>24)&0xFF,(ebx>>16)&0xFF,(ebx>>8)&0xFF,ebx&0xFF);
	   
  }
  if(((ecx<<1)&0x1)==0){
    cout<<"ecx is valid"<<endl;
    printf("codes = %x %x %x %x \n", 
	   (ecx>>24)&0xFF,(ecx>>16)&0xFF,(ecx>>8)&0xFF,ecx&0xFF);
	   
  }
  if(((edx<<1)&0x1)==0){
    cout<<"edx is valid"<<endl;
    printf("codes = %x %x %x %x \n", 
	   (edx>>24)&0xFF,(edx>>16)&0xFF,(edx>>8)&0xFF,edx&0xFF);
	   
  }
  cout<<"from cpuid manual"<<endl;
  cout<<"ca = 2nd level tlb, 512 entries, 4 way associative"<<endl;
  cout<<"b0 = instruction tlb 128 entries, 4 way associative"<<endl;
  cout<<"f0 = 64 byte prefetch"<<endl;
  cout<<"03 = 64 entry 4 way dtlb"<<endl;
  cout<<"5a and 55 apply to very large page sizes"<<endl;
  cout<<"ff is not listed"<<endl;
}


void cpuid04h(){
  cout<<endl<<endl;
  cout<<"CPUID with code 04h"<<endl;
  unsigned int eax, ebx, ecx;
  for(int i=0;;i++){
    asm volatile("cpuid"
		 :"=a"(eax), "=b"(ebx), "=c"(ecx)
		 :"a"(0x04), "c"(i):"edx");
    if((eax&0xF)==0)
      break;
    printf("cache type = %x\n",eax&0xF);
    printf("cache level = %x\n", (eax>>5)&(0x7));
    printf("ways of associativity = %u\n",
	   ((ebx>>22)&0xFFF)+1);
    printf("physical line partitions = %x\n", 
	   ((ebx>>12)&0x3FF)+1);
    printf("cache line size = %u\n",(ebx&0xFFF)+1);
    printf("number of sets = %u\n",ecx+1);
    printf("cache size in bytes = %u\n\n",
	   (((ebx>>22)&0xFFF)+1)* //ways of associativity
	   (((ebx>>12)&0x3FF)+1)* //physical line partns
	   ((ebx&0xFFF)+1)* //cache line size
	   (ecx+1)); //number of sets
  }
}

void cpuid0Ah(){
  cout<<endl<<endl;
  cout<<"CPUID with code 0Ah"<<endl;
  unsigned int eax, ebx, edx;
  asm volatile("cpuid"
	       :"=a"(eax), "=b"(ebx), "=d"(edx)
	       :"a"(0x0A)
	       :"ecx");
  printf("(deciphered below) eax = %x \n", eax);
  printf("(events supported) ebx = %x \n", ebx);
  printf("(fixed counters) edx = %x \n", edx);
  unsigned int mask = 0xFF;
  unsigned int result;
  result = mask & eax;
  cout<<"arch perfmon version = "<<result<<endl;
  result = mask & (eax>>8);
  cout<<"number of counters per core = "<<result<<endl;
  result = mask & (eax>>16);
  cout<<"counter width in bits = "<<result<<endl;
  result = mask & (eax>>24);
  cout<<"number of arch events supported = "<<result<<endl;
}


void cpuidHT(){//check hyper threading
  cout<<endl<<endl;
  cout<<"CPUID to check HT"<<endl;
  unsigned int eax, ebx;
  asm volatile("cpuid":"=a"(eax),"=b"(ebx):"a"(0x01):"ecx","edx");
  int numofcores = (ebx>>16)&&0xFF;
  cout<<"num of cores = "<<numofcores<<endl<<endl;
  for(int i=0;i < 6;i++){
    asm volatile("cpuid":"=a"(eax):"a"(0x04), "c"(i):"ebx","edx");
    if((eax&0xF)==0)
      break;
    int numofapic = (eax>>26)&0x3F;
    numofapic++;
    int numofthreads = (eax>>14)&0xFFF;
    numofthreads++;
    cout<<"num of apic ids reserved = "<<numofapic<<endl;
    cout<<"num of threads = "<<numofthreads<<endl;
    cout<<endl;
  }

}

int main(){
  // cpuid01h();
  cpuid02h();
  cpuid04h();
  //cpuid0Ah();
  //cpuidHT();
}
