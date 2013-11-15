#include "../utils/utils.hh"
#include "../utils/Table.hh"
#include "../utils/StatVector.hh"
#include "../mem-latency/latency.hh"
#include <iostream>
#include <omp.h>

double measure_latency(int n, int *npages){
	int count = 100;
	StatVector stats(count);
	for(int i=0; i < count; i++){
		double cycles = latency(n, npages); /* call extern function */
		stats.insert(cycles);
	}
	return stats.median();
}

void nearfar(int n, double cycles[2]){
	int *npages = (int *)_mm_malloc(1l*n*4096, 4096);
#pragma omp parallel    \
	num_threads(2)	\
	shared(cycles, n, npages)
	{
		int tid = omp_get_thread_num();
#pragma omp master 
		for(int i=0; i < n*4096/4; i++)
			npages[i] = i;
#pragma omp barrier
#pragma omp critical
		cycles[tid] = measure_latency(n, npages); 
	}
	_mm_free(npages);
}

int main(){
	const char *rows[4] = {"4", "20", "50", "100"};
	int n[4] = {4, 20, 50, 100};
	const char *cols[2] = {"0", "1"}; //tid
	double data[8];

	double cycles[2];
	for(int i=0; i < 4; i++){
		nearfar(n[i], cycles);
		data[i] = cycles[0];
		data[4+i] = cycles[1];
	}

	verify_dir("DBG");
	link_cout("DBG/latency.txt");

	Table tbl;
	tbl.dim(4, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("latency to mem in cycles, n pages, thread 0 vs thread 1");

	unlink_cout();
}
