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
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "latency.hh"
#include <cstdio>
#include <fstream>
#include <iostream>

#define NTRIALS 100


void measure_latency(int n, StatVector& stats){
	const int ntrials = NTRIALS;
	assrt(stats.getSize() >= ntrials);
	stats.flush();
	int *npages = (int *)_mm_malloc(1l*4096*n, 4096);
	for(int i=0; i < ntrials; i++){
		double cycles = latency(n, npages);
		stats.insert(cycles);
	}
	_mm_free(npages);
}

int main(){
	const int nrows = 12;
	int nlist[nrows] = {1, 2, 4, 
		       8, 16, 24, 
		       32, 40, 60, 
		       1000, 10*1000, 100*1000};
	const char *rows[nrows] =  {"1", "2", "4", 
				    "8", "16", "24", 
				    "32", "40", "60", 
				    "1000", "10*1000", "100*1000"};
	const int ncols = 3;
	const char *cols[ncols] = {"min", "median", "max"};
	
	double cyc2dram[nrows*ncols];
	StatVector stats(NTRIALS);
	
	for(int i=0; i < nrows; i++){
		measure_latency(nlist[i], stats);
		cyc2dram[i+0*nrows] = stats.min();
		cyc2dram[i+1*nrows] = stats.median();
		cyc2dram[i+2*nrows] = stats.max();
	}
	
	verify_dir("DBG");
#ifdef MEMWALK
	const char* fname = "DBG/latency_memwalk.txt";
#else
	const char* fname = "DBG/latency_clflush.txt";
#endif
	link_cout(fname);

	Table tbl;
	tbl.dim(nrows, ncols);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(cyc2dram);
	char banner[200];
	sprintf(banner, "cycles to dram, ntrials = %d, when N pages accessed",
		NTRIALS);
	tbl.print(banner);
	
	unlink_cout();
}
