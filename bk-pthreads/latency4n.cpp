#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include "StatVector.hh"
#define MEMWALK
using namespace std;
extern void dummy(double *a, int len);

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

double latency(int n){
  int *List=new int[n*256];
  randomp(List, n*256);
  int *LList=new int[n*256];
  for(int i=0; i < n*256; i++)
    LList[List[i]]=List[(i+1)%(n*256)];
  //int is 4 bytes
  int *FourNPages= (int *)malloc(4096*4*n);
  for(int i=0; i < 256*n; i++)
    FourNPages[16*i] = LList[i];
  //cout<<"okk"<<endl;
  //return 3;
#ifdef MEMWALK
  double* a=new  double[1000*1000*10];;
  dummy(a, 1000*1000*10);
#else
  for(int i=0; i < 4096*n; i++)
    _mm_clflush(FourNPages+i);
#endif
  int index = 17;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 256*n; i++){
    index = FourNPages[16*index];
  }
  double cycles = clk.toc();
  if(index != 17){
    cout<<"something wrong"<<endl;
    abort();
  }
  delete[] List;
  delete[] LList;
  free(FourNPages);
#ifdef MEMWALK
  delete[] a;
#endif
  return cycles/256/n;
}

int main(){
  int nlist[] = {1, 4, 8, 10, 25, 100, 1000};
  for(int j=0; j < 7; j++){
    int n = nlist[j];
    int count = 100;
    if(n < 0)
      return -1;
    if(n>1000)
      count = 5;
    cout<<endl<<endl<<n*4<<" pages"<<endl;
    StatVector stats(count);
    for(int i=0; i < count; i++){
      double cycles = latency(n);
      stats.insert(cycles);
      if(i<5)
	cout<<"latency = "<<cycles<<endl;
    }
#ifdef MEMWALK
    char banner[20] = "MEMWALK";
#else
    char banner[20] = "CACHE FLUSH";
#endif
    stats.print(banner);
  }
}
