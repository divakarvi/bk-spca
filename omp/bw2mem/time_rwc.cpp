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

#ifdef __MIC__
	assrt(getenv("MIC_OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("MIC_OMP_NUM_THREADS"));
#else
	assrt(getenv("OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("OMP_NUM_THREADS"));
#endif

	int nth[4] = {nthreads/4, nthreads/2, 
			     3*nthreads/4, nthreads};
	char rows[4][100];
	char *rrows[4];
	for(int i=0; i < 4; i++){
		sprintf(rows[i], "%d", (i+1)*nthreads/4);
		rrows[i] = rows[i];
	}
	const char *cols[3] = {"read", "write", "copy"};
	double data[12];

	for(int i=0; i < 4; i++){
		std::cout<<i<<std::endl;
		data[i] = time(RWC_READ, nth[i]);
		data[i+4] = time(RWC_WRITE, nth[i]);
		data[i+8] = time(RWC_COPY, nth[i]);
	}

	verify_dir("DBG");
	link_cout("DBG/time_rwc.txt");
	Table tbl;
	tbl.dim(4, 3);
	tbl.rows((const char**)rrows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("b/w to mem in bytes per cycle, 1 to 12 threads,"
		  " 1.6/16GB data");
	unlink_cout();
}
