#include "../utils/utils.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "latency.hh"
#include <cstdio>
#include <fstream>
#include <iostream>

static const int ntrials = 100;
static StatVector stats(ntrials);

void measure_latency(n, StatVector& stobj){
	assrt(stobj.getSize() >= ntrials);
	stobj.flush();
	for(int i=0; i < ntrials; i++){
		double cycles = latency(n);
		stobj.insert(cycles);
	}
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
	
	for(int i=0; i < nrows; i++){
		measure_latency(nlist[i], stats);
		cyc2dram[i+0*nrows] = stats.min();
		cyc2dram[i+1*nrows] = stats.median();
		cyc2dram[i+2*nrows] = stats.max();
	}
	
	int ntrials = 100;

	std::streambuf *sbuf_backup;
	sbuf_backup = cout.rdbuf();
	ofstream ofile;
	verify_dir("DBG");
#ifdef MEMWALK
	ofile.open("DBG/latency_memwalk.txt");
#else
	ofile.open("DBG/latency_clflush.txt");
#endif
	cout.rdbuf(ofile.rdbuf());

	Table tbl;
	tbl.dim(nrows, ncols);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(cyc2dram);
	char banner[200];
	sprintf(banner, "cycles to dram, ntrials = %d, when N pages accessed",
		ntrials);
	tbl.print(banner);
	
	cout.rdbuf(sbuf_backup);
}
