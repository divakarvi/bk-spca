#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "TimeStamp.hh"
using namespace std;


const int nthreads = 2;
typedef void (*fnlist_t[nthreads])(void *);
volatile fnlist_t fnlist;
typedef void *arglist_t[nthreads];
volatile arglist_t arglist;
volatile long work_count[nthreads];
volatile long done_count[nthreads];

void addone(void *arg){
  long *p = (long *)(arg);
  *p += 1;
}

void addtwo(void *arg){
  long *p = (long *)(arg);
  *p += 2;
}

void exitfn(void *arg){
  pthread_exit(NULL);
}

void *worker(void *arg){
  int tid = *((int *)arg);
  while(1){
    while(work_count[tid] == done_count[tid]);
    if(work_count[tid]==done_count[tid]+1){
      (*(fnlist[tid]))(arglist[tid]);
      asm volatile("cpuid"::"a"(0x01):"ebx","ecx","edx");
      done_count[tid] += 1;
    }
  }
}

void spawn_workers(){
  pthread_t plist[nthreads-1];
  static int tidlist[nthreads];
  for(int i=0; i < nthreads; i++){
    work_count[i] = 0;
    done_count[i] = 0;
    tidlist[i] = i;
    if(i>0){
      pthread_create(plist+i-1, NULL, worker, (void *)(tidlist+i));
      pthread_detach(plist[i-1]);
    }
  }
}

void shutdown_workers(){
  for(int i=1; i < nthreads; i++){
    fnlist[i] = exitfn;
    asm volatile("cpuid"::"a"(0x01):"ebx","ecx","edx");
    work_count[i] += 1;
  }
}

void organizer(long *list, int count){
  spawn_workers();
  for(int i=0; i < count; i++){
    for(int j=0; j < nthreads; j++){
      fnlist[j] = (i%2==0)?addone:addtwo;
      arglist[j] = (void *)(list+j);
      asm volatile("cpuid"::"a"(0x01):"ebx","ecx","edx");
      work_count[j] += 1;
    }
    (*(fnlist[0]))(arglist[0]);
    done_count[0] += 1;
    for(int j=0; j < nthreads; j++)
      while(work_count[j]>done_count[j]);
  }
  shutdown_workers();
}

int main(){
  long list[nthreads];
  for(int i=0; i < nthreads; i++)
    list[i] = 0;
  int count = 1000*1000*10; //count = 1000; 
  TimeStamp clk;
  clk.tic();
  organizer(list, count);
  double cycles = clk.toc();
  cout<<"average per parallel region = "<<cycles/count<<endl;
  for(int i=0; i < nthreads; i++)
    cout<<list[i]<<endl;
}

