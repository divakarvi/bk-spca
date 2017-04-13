#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "../../utils/utils.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/TimeStamp.hh"


void *addone(void *arg){
	long *p = (long *)(arg);
	*p += 1;
	return NULL;
}

void addone2list(long *list, int nthreads){
	pthread_t *plist = new pthread_t[nthreads-1];
	*list += 1;

	for(int i=0; i < nthreads-1; i++)
		pthread_create(plist+i, NULL, addone, (void *)(list+i+1));
	
	for(int i=0; i < nthreads-1; i++){
		void *result;
		pthread_join(plist[i], &result);
	}
	
	delete[] plist;
}

int main(){
	int nthreads = num_cpu();
	long *list = new long[nthreads];
	for(int i=0; i < nthreads; i++)
		list[i] = 0;
	
	TimeStamp clk;
	int count = 10000;
	StatVector stats(count);

	verify_dir("DBG");
	link_cout("DBG/thrd_create_ovhd.txt");

	std::cout<<"First five:"<<std::endl;
	for(int i=0; i < count; i++){
		clk.tic();
		addone2list(list, nthreads);
		double cycles=clk.toc();
		stats.insert(cycles);
		if(i < 5)
			std::cout<<"\t\t"<<cycles<<std::endl;
	}
	stats.print();

	std::cout<<std::endl<<"worst 5: "<<std::endl;
	for(int i=1; i < 6; i++)
		std::cout<<"\t\t"<<stats(count-i)<<std::endl;

	unlink_cout();
}

