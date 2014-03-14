/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../kernel-syscall/dvmesg.h"
#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include <cstdlib>
using namespace std;

#undef DV_KERNEL_MESG
#ifdef DV_KERNEL_MESG
#undef TIEBREAK 
#else 
#define TIEBREAK 1
#endif

const int nthreads = 8;
const int nprocs = 4;


void (*fnlist[nthreads-1])(void *);
void *arglist[nthreads-1];
int workflag[nthreads-1];

pthread_spinlock_t spin[nthreads-1];
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
	int tid = *((int *) arg);
	pthread_spin_unlock(spin+tid-1);
	pthread_exit(NULL);
}

extern void dummy();

void *worker(void *arg){
	int tid = *((int *) arg);
#ifdef TIEBREAK
	srand((tid+1)*28887);
#endif
	while(1){
		pthread_spin_lock(spin+tid-1);
		if(workflag[tid-1]==1){
			(*(fnlist[tid-1]))(arglist[tid-1]);
			workflag[tid-1] = 0;
		}
		pthread_spin_unlock(spin+tid-1);
#ifdef TIEBREAK
		int count = rand()%TIEBREAK;
		for(int i=0; i < count; i++)
			dummy();
#endif
	}
	return NULL;
}

void spawn_workers(){
	static int tidlist[nthreads-1];
	for(int i=0; i < nthreads-1; i++){
		pthread_spin_init(spin+i, PTHREAD_PROCESS_PRIVATE);
		workflag[i] = 0;
		tidlist[i] = i+1;
		pthread_create(pthrd+i, NULL, worker, (void *)(tidlist+i));
	}
}

void shutdown_workers(){
	static int tidlist[nthreads-1];
	for(int i=0; i < nthreads-1; i++){
		while(1){
			pthread_spin_lock(spin+i);
			if(workflag[i]==0){
				fnlist[i] = exitfn;
				tidlist[i] = i+1;
				arglist[i] = tidlist+i;
				workflag[i] = 1;
				pthread_spin_unlock(spin+i);
				break;
			}
			pthread_spin_unlock(spin+i);
			
		}
		pthread_join(pthrd[i], NULL);
		pthread_spin_destroy(spin+i);
	}
}

void assignwork(int i, int tid, long *list){
	int j = tid-1;
	while(1){
		pthread_spin_lock(spin+j);
		if(workflag[j]==0){
			fnlist[j] = (i%2==0)?addone:addtwo;
			arglist[j] = (void *)(list+tid);
			workflag[j]=1;
			pthread_spin_unlock(spin+j);
			return;
		}
		pthread_spin_unlock(spin+j);
#ifdef TIEBREAK
		int count = rand()%TIEBREAK;
		for(int i=0; i < count; i++)
			dummy();
#endif
	}
}

void manager(long *list, int count){
	spawn_workers();
#ifdef DV_KERNEL_MESG
	set_dvflag(400);
#endif
	for(int i=0; i < count; i++){
		for(int tid=1; tid < nthreads; tid++)
			assignwork(i, tid, list);
		if(i%2==0)
			addone((void *)list);
		else
			addtwo((void *)list);
	}
#ifdef DV_KERNEL_MESG
	set_dvflag(0);
#endif
	shutdown_workers();
}

int main(){
	long list[nthreads];
	for(int i=0; i < nthreads; i++)
		list[i] = 0;
	int count = (nthreads<=nprocs)?1000*1000*10:100; 
#ifdef DV_KERNEL_MESG
	count = 6;
#endif
	TimeStamp clk;
	clk.tic();
#ifdef DV_KERNEL_MESG
	set_dvflag(400);
#endif
	manager(list, count);
#ifdef DV_KERNEL_MESG
	set_dvflag(0);
#endif
	double cycles = clk.toc();
#ifndef DV_KERNEL_MESG     
	verify_dir("DBG");
	ofstream ofile("DBG/altadd_spin.txt", ios_base::app);
	ofile<<"nprocs = "<<nprocs<<endl;
	ofile<<"nthreads = "<<nthreads<<endl;
	ofile<<"count = "<<count<<endl;
#ifdef TIEBREAK
	ofile<<"TIEBREAK = "<<TIEBREAK<<endl;
#else
	ofile<<"TIEBREAK = "<<0<<endl;
#endif
	ofile<<"average per parallel region = "<<cycles/count<<endl<<endl;
	ofile.close();
#endif
	cout<<"nprocs = "<<nprocs<<endl;
	cout<<"nthreads = "<<nthreads<<endl;
	cout<<"count = "<<count<<endl;
#ifdef TIEBREAK
	cout<<"TIEBREAK = "<<TIEBREAK<<endl;
#else
	cout<<"TIEBREAK = "<<0<<endl;
#endif
	cout<<"average per parallel region = "<<cycles/count<<endl<<endl;
	cout<<"tgid = "<<getpid()<<endl;
	for(int i=0; i < nthreads; i++)
		cout<<list[i]<<endl;
}
