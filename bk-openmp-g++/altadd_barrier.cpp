#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "TimeStamp.hh"
using namespace std;

const int nthreads = 2;
void (*fnlist[nthreads-1])(void *);
void *arglist[nthreads-1];
pthread_barrier_t barrier;
pthread_t pthrd[nthreads-1];

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
		pthread_barrier_wait(&barrier);
		pthread_barrier_wait(&barrier);
		(*(fnlist[tid-1]))(arglist[tid-1]);
	}
}

void spawn_workers(){
	static int tidlist[nthreads-1];
	pthread_barrier_init(&barrier, NULL, nthreads);
	for(int i=0; i < nthreads-1; i++){
		tidlist[i] = i+1;
		pthread_create(pthrd+i, NULL, worker, tidlist+i);
	}
}

void manager(long *list, int count){
	for(int i=0; i < count; i++){
		pthread_barrier_wait(&barrier);
		for(int j=0; j < nthreads-1; j++){
			fnlist[j] = (i%2==0)?addone:addtwo;
			arglist[j] = (void *)(list+j+1);
		}
		pthread_barrier_wait(&barrier);
		if(i%2==0)
			addone((void *)list);
		else
			addtwo((void *)list);
	}
}

void shutdown(){
	pthread_barrier_wait(&barrier);
	for(int i=0; i < nthreads-1; i++){
		fnlist[i] = exitfn;
		arglist[i] = NULL;
	}
	pthread_barrier_wait(&barrier);
	for(int i=0; i < nthreads-1; i++)
		pthread_join(pthrd[i], NULL);
	pthread_barrier_destroy(&barrier);
}


void altadd12(long *list, int count){	
	spawn_workers();
	manager(list, count);
	shutdown();
}

int main(){
	long list[nthreads]={0};
	int count = 10000; 
	TimeStamp clk;
	clk.tic();
	altadd12(list, count);
	double cycles = clk.toc();
	cout<<"average per parallel region = "<<cycles/count<<endl;
	for(int i=0; i < nthreads; i++)
		 cout<<list[i]<<endl;
}
