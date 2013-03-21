#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <mkl.h>
using namespace std;
#undef MEMWALK
extern void dummy(double *a, int len);
extern void unitstride(int *a);
extern void stride16(int *a);
extern void accessList(long int *List, long int n, 
		       int count, double &x);
void time_unitstride(){
  int a[1000*1000*1000];
  for(int i=0; i < 1000*1000*1000; i++)
    a[i] = 0;
  TimeStamp clk;
  clk.tic();
  unitstride(a);
  double cycles = clk.toc();
  cout<<"cycles/access = "<<cycles/(1000*1000*1000)<<endl; 
}

void time_stride16(){
  int a[1000*1000*1000];
  for(int i=0; i < 1000*1000*1000; i++)
    a[i] = 0;
  TimeStamp clk;
  clk.tic();
  stride16(a);
  double cycles = clk.toc();
  cout<<"cycles/access = "<<cycles/(1000*1000*1000/16)<<endl; 
}



int countrepeats(long int *List, long int n, int count){
  long int *LList = (long int *)
    MKL_malloc(count*sizeof(long int), 64);
  LList[0] = 0;
  long int index = 0;
  for(long int i=1; i < count; i++){
    index = List[index]%n;
    index = index - index%8;
    LList[i] = index;
  }
  long int repeats = 0;
  for(int  i=1; i < count; i++){
    for(int j=0; j < i; j++)
      if(LList[j]==LList[i]){
	repeats++;
	break;
      }
  }
  MKL_free(LList);
  return repeats;
}

double probNoR(long int n, int count){
  double p = 1.0;
  n = n/8;
  for(int i=1; i < count; i++)
    p *= 1.0*(n-i)/n;
  return p;
}

void randomp(int *List, int len){
  for(int i=0; i < len; i++)
    List[i] = i;
  for(int i=0; i < len; i++){
    int j = rand()%(len-i)+i;
    int temp = List[j];
    List[j] = List[i];
    List[i] = temp;
  }
}

void latency(){
  int List[256];
  randomp(List,256); 
  int LList[256];
  for(int i=0; i < 256; i++)
    LList[List[i]]=List[(i+1)%256];
  //int is 4 bytes
  __declspec(align(4096)) int FourPages[4096];
  for(int i=0; i < 256; i++)
    FourPages[16*i] = LList[i];
#ifdef MEMWALK
  double a[1000*1000*100];
  dummy(a, 1000*1000*100);
#else
  for(int i=0; i < 4096; i++)
    _mm_clflush(FourPages+i);
#endif
  int index = 17;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 256; i++){
    index = FourPages[16*index];
  }
  double cycles = clk.toc();
  cout<<"index = "<<index<<endl;
  cout<<"cycles per access = "<<cycles/256<<endl;
}

int main(){
  time_unitstride();
  time_stride16();
  {
    cout<<"RAND_MAX="<<RAND_MAX<<endl;
    long int *List;
    long int n = 1000000000;
    cout<<"n/RAND_MAX = "<<1.0*n/RAND_MAX<<endl;
    List = (long int*)MKL_malloc(n*sizeof(long int), 64);
    for(long int i=0; i < n; i++)
      List[i]= rand();
    int count = 6000;  
    cout<<"num of repeats = "<<countrepeats(List, n, count)<<endl;
    for(long int i=0; i < n; i++)
      _mm_clflush(List + i);
    TimeStamp clk;
    clk.tic();
    double xx;
    accessList(List, n, count, xx);
    double cycles = clk.toc();
    cout<<"cycles per access = "<<cycles/count<<endl;
    cout<<"probability of no repeats  = "<<probNoR(n, count)<<endl;
    MKL_free(List);
  }
  latency();
}
