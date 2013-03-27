#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "TimeStamp.hh"
using namespace std;

const int nthreads=2;
void (*fnlist[nthreads])(void *);
void *arglist[nthreads];
pthread_mutex_t wrklock[nthreads-1];
pthread_cond_t cv_work[nthreads-1];
pthread_cond_t cv_free[nthreads-1];
pthread_t pthrd[nthreads-1];
int workflag[nthreads-1];

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
	pthread_mutex_unlock(wrklock+tid-1);
	pthread_exit(NULL);
}

void *worker(void *arg){
	int tid = *((int *)(arg));
	while(1){
		pthread_mutex_lock(wrklock+tid-1);
		if(workflag[tid-1]==0)
			pthread_cond_wait(cv_work+tid-1, wrklock+tid-1);
		(*(fnlist[tid-1]))(arglist[tid-1]);
		workflag[tid-1]=0;
		pthread_cond_signal(cv_free+tid-1);
		pthread_mutex_unlock(wrklock+tid-1);
	}
	return NULL;
}

void spawn_workers(){
	static  int tidlist[nthreads-1];
	for(int i=0; i < nthreads-1; i++){
		workflag[i] = 0;
		tidlist[i] = i+1;
		pthread_mutex_init(wrklock+i,NULL);
		pthread_cond_init(cv_work+i, NULL);
		pthread_cond_init(cv_free+i, NULL);
		pthread_create(pthrd+i,NULL,worker, tidlist+i); 
	}
}

void manager(long *list, int count){
	for(int i=0; i < count;i++){
		for(int j=0; j < nthreads-1; j++){
			pthread_mutex_lock(wrklock+j);
			if(workflag[j]==1)
				pthread_cond_wait(cv_free+j, wrklock+j);
			fnlist[j] = (i%2==0)?addone:addtwo;
			arglist[j] = (void *)(list+j+1);
			workflag[j]=1;
			pthread_cond_signal(cv_work+j);
			pthread_mutex_unlock(wrklock+j);
		}
		if(i%2==0)
			addone((void *)list);
		else
			addtwo((void *)list);
	}
}

void shutdown(){
	static int tidlist[nthreads-1];
	for(int i=0; i < nthreads-1; i++){
		pthread_mutex_lock(wrklock+i);
		if(workflag[i]==1)
			pthread_cond_wait(cv_free+i, wrklock+i);
		tidlist[i] = i+1;
		fnlist[i] = exitfn;
		arglist[i] = tidlist+i;
		workflag[i]=1;
		pthread_cond_signal(cv_work+i);
		pthread_mutex_unlock(wrklock+i);

	}
	for(int i=0; i < nthreads-1; i++){
		pthread_join(pthrd[i], NULL);
		pthread_mutex_destroy(wrklock+i);
		pthread_cond_destroy(cv_work+i);
		pthread_cond_destroy(cv_free+i);
	}
}

void altadd12(long *list, int count){	
	spawn_workers();
	manager(list, count);
	shutdown();
}

int main(){
	long list[nthreads]={0};
	int count = 1000*1000; 
	TimeStamp clk;
	clk.tic();
	altadd12(list, count);
	double cycles = clk.toc();
	cout<<"average per parallel region = "<<cycles/count<<endl;
	for(int i=0; i < nthreads; i++)
		 cout<<list[i]<<endl;
}
