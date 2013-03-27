#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "StatVector.hh"
#include "TimeStamp.hh"
using namespace std;

const int nthreads = 3;
void (*fnlist[nthreads])(void *);
void *arglist[nthreads];
int workflag[nthreads];
pthread_mutex_t mtx[nthreads-1];
pthread_t plist[nthreads-1];

void addone(void *arg){
  long *p = (long *)(arg);
  *p += 1;
}

void addtwo(void *arg){
  long *p = (long *)(arg);
  *p += 2;
}

void exitfn(void *arg){
  int tid = *((int *) arg);
  pthread_mutex_unlock(mtx+tid-1);
  pthread_exit(NULL);
}

void *worker(void *arg){
  int tid = *((int *) arg);
  while(1){
    pthread_mutex_lock(mtx+tid-1);
    if(workflag[tid]==1){
      (*(fnlist[tid]))(arglist[tid]);
      workflag[tid] = 0;
    }
    pthread_mutex_unlock(mtx+tid-1);
  }
  return NULL;
}

void spawn_workers(){
  static int tidlist[nthreads];
  for(int i=0; i < nthreads; i++){
    workflag[i] = 0;
    tidlist[i] = i;
    if(i>0)
      pthread_create(plist+i-1, NULL, worker, (void *)(tidlist+i));
  }
}

void shutdown_workers(){
  int tid;
  for(int i=1; i < nthreads; i++){
    while(1){
      pthread_mutex_lock(mtx+i-1);
      if(workflag[i]==0){
	fnlist[i] = exitfn;
	tid = i;
	arglist[i] = &tid;
	workflag[i] = 1;
	pthread_mutex_unlock(mtx+i-1);
	break;
      }
      pthread_mutex_unlock(mtx+i-1);
    }
    pthread_join(plist[i-1], NULL);
  }
}

void organizer(long *list, int count){
  spawn_workers();
  for(int i=1; i < nthreads; i++)
    pthread_mutex_init(mtx+i-1, NULL);
  for(int i=0; i < count; i++){
    for(int j=1; j < nthreads; j++){
      while(1){
	pthread_mutex_lock(mtx+j-1);
	if(workflag[j]==0){
	  fnlist[j] = (i%2==0)?addone:addtwo;
	  arglist[j] = (void *)(list+j);
	  workflag[j]=1;
	  pthread_mutex_unlock(mtx+j-1);
	  break;
	}
	pthread_mutex_unlock(mtx+j-1);
      }
    }
    workflag[0] = 0;
    fnlist[0] = (i%2==0)?addone:addtwo;
    arglist[0] = (void *)list;
    (*(fnlist[0]))(arglist[0]);
    workflag[0]=1;
  }
  shutdown_workers();
  for(int i=1; i < nthreads; i++)
    pthread_mutex_destroy(mtx+i-1);
}
 
int main(){
  long list[nthreads];
  for(int i=0; i < nthreads; i++)
    list[i] = 0;
  int count = 1000; 
  TimeStamp clk;
  clk.tic();
  organizer(list, count);
  double cycles = clk.toc();
  cout<<"average per parallel region = "<<cycles/count<<endl;
  for(int i=0; i < nthreads; i++)
    cout<<list[i]<<endl;
}
