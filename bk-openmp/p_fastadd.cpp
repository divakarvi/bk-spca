#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "StatVector.hh"
#include "TimeStamp.hh"
using namespace std;

const int nthreads = 4;
typedef void (*fnlist_t[nthreads])(void *);
volatile fnlist_t fnlist;
typedef void *arglist_t[nthreads];
volatile arglist_t arglist;
volatile long master_count[nthreads];
volatile long slave_count[nthreads];

void addone(void *arg){
  long *p = (long *)(arg);
  *p += 1;
}

void addtwo(void *arg){
  long *p = (long *)(arg);
  *p += 2;
}

void *slave(void *arg){
  int tid = *((int *)arg);
 slave_start:
  while(slave_count[tid] == master_count[tid]);
  if(master_count[tid]==slave_count[tid]+1){
    (*(fnlist[tid]))(arglist[tid]);
    slave_count[tid] += 1;
  }
  else if(master_count[tid]==-1)
    return NULL;
  goto slave_start;
}

void master(long *list, int count){
  pthread_t plist[nthreads];
  int tidlist[nthreads];
  for(int i=0; i < nthreads; i++){
    master_count[i] = 0;
    slave_count[i] = 0;
    tidlist[i] = i;
    pthread_create(plist+i, NULL, slave, (void *)(tidlist+i));
  }
  for(int i=0; i < count; i++){
    for(int j=0; j < nthreads; j++){
      fnlist[j] = addone;
      master_count[j] += 1;
      arglist[j] = (void *)(list+j);
    }
    for(int j=0; j < nthreads; j++)
      while(master_count[j]>slave_count[j]);
    for(int j=0; j < nthreads; j++){
      fnlist[j] = addtwo;
      master_count[j] += 1;
      arglist[j] = (void *)(list+j);
    }
    for(int j=0; j < nthreads; j++)
      while(master_count[j]>slave_count[j]);
  }
  for(int i=0; i < nthreads; i++)
    master_count[i] = -1;
  for(int i=0; i < nthreads; i++){
    void *result;
    pthread_join(plist[i], &result);
  }
}

int main(){
  long list[nthreads];
  for(int i=0; i < nthreads; i++)
    list[i] = 0;
  int count = 1000*1000*10;
  TimeStamp clk;
  clk.tic();
  master(list, count);
  double cycles = clk.toc();
  cout<<"average per parallel region = "<<cycles/2/count<<endl;
  for(int i=0; i < nthreads; i++)
    cout<<list[i]<<endl;
}

