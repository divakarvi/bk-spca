#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "readwrcopy.hh"
#include <omp.h>

enum rwc_flag_enum {RWC_READ, RWC_WRITE, RWC_COPY};

/*
 * returns bytes/cycle
 */
double time(enum rwc_flag_enum flag, int nthreads){
	const int count = 20;
#ifndef __MIC__
	const long len = 2l*1000*1000*1000; //16GB array
#else
	const long len = 1l*1000*1000*200; //1.6GB array
#endif
	long nbytes = len*sizeof(double);
	double *list = (double *)_mm_malloc(nbytes, 64);

	
	init_manycore_cheap(list, len, nthreads);

	StatVector stats(count);
	TimeStamp clk;
	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case RWC_READ:
			sum_manycore(list, len, nthreads);
			break;
		case RWC_WRITE:
			write_manycore(list, len, nthreads);
			break;
		case RWC_COPY:
			copy_manycore(list, len, nthreads);
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	std::cout<<"done"<<std::endl;
	_mm_free(list);

	return 1.0*nbytes/stats.median();
}

int main(){
	kmp_set_defaults("KMP_AFFINITY=compact");

	const int nthreads = num_cpu();

	int nth[2] = {1, nthreads};
	char rows[2][100];
	char *rrows[2];
	for(int i=0; i < 2; i++){
		sprintf(rows[i], "%d", nth[i]);
		rrows[i] = rows[i];
	}
	const char *cols[3] = {"read", "write", "copy"};
	double data[6];

	for(int i=0; i < 2; i++){
		std::cout<<i<<std::endl;
		data[i] = time(RWC_READ, nth[i]);
		data[i+2] = time(RWC_WRITE, nth[i]);
		data[i+4] = time(RWC_COPY, nth[i]);

	}

	verify_dir("DBG");
	link_cout("DBG/time_rwc.txt");
	Table tbl;
	tbl.dim(2, 3);
	tbl.rows((const char**)rrows);
	tbl.cols(cols);
	tbl.data(data);
	char banner[200];
	sprintf(banner, "b/w to mem in bytes per cycle, 1/%d threads,"
		" 1.6/16GB data", nthreads);
	tbl.print();
	unlink_cout();
}
