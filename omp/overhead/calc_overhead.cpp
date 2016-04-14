#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/Table.hh"
#include "overhead.hh"
#include "omp.h"
#include <fstream>
#include <iostream>

int main(){
	const char *rows[2] = {"1", "max"};
	const char *cols[4] = {"barrier", "for", "for nowait", "for dyn"};
	double data[48];
	
	int countinner = 10000;
	int countouter = 1000*1000;
	int count = countouter;
	int nthreads = num_cpu();
	printf("nthreads = %d\n", nthreads);
	kmp_set_defaults("KMP_AFFINITY=compact");//compact or scatter

	for(int i=0; i <2; i++){
		int nth;
		nth = (i==0)? 1:nthreads;
		data[i] = barrier_overhead(nth, count);
		data[i+2] = ompfor_overhead(nth, countinner, countouter);
		data[i+4] = ompfornowait_overhead(nth, countinner, 
						       countouter);
		data[i+6] = ompfordynamic_overhead(nth, countinner/100, 
							countouter/1000);
	}

	Table tbl;
	tbl.dim(2, 4);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	
	verify_dir("DBG");
	link_cout("DBG/overhead.txt");
	
	std::cout<<"\t     count inner = "<<countinner<<std::endl;
	std::cout<<"\t     count outer = "<<countouter<<std::endl;
	std::cout<<"\t count [barrier] = "<<count<<std::endl;
	char banner[200];
	sprintf(banner, "overhead  in cycles, 1/%d threads", nthreads);
	tbl.print(banner);

	unlink_cout();
}
