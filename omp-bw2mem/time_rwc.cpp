#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "readwrcopy.hh"
#include <mkl.h>


enum rwc_flag_enum {RWC_READ, RWC_WRITE, RWC_COPY};

/*
 * returns bytes/cycle
 */
double time(enum rwc_flag_enum flag, int nthreads){
	const int count = 20;
	const long len = 2l*1000*1000*1000; //16GB array
	long nbytes = len*sizeof(double);
	double *list = (double *)MKL_malloc(nbytes, 64);
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

	MKL_free(list);
	return 1.0*nbytes/stats.median();
}

int main(){
	const char *rows[12] = {"1", "2", "3", "4", "5", "6",
			      "7", "8", "9", "10", "11", "12"};
	const char *cols[3] = {"read", "write", "copy"};
	double data[36];

	for(int i=0; i < 12; i++){
		int nth = i + 1;
		data[i] = time(RWC_READ, nth);
		data[i+12] = time(RWC_WRITE, nth);
		data[i+24] = time(RWC_COPY, nth);
	}

	verify_dir("DBG");
	link_cout("DBG/time_rwc.txt");
	Table tbl;
	tbl.dim(12, 3);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("b/w to mem in bytes per cycle, 1 to 12 threads, 16GB data");
	unlink_cout();
}
