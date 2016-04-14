#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/Table.hh"
#include "../init/mic_init.hh"
#include "asm_mult.hh"
#include <omp.h>
#include <iostream>

const long count = 1l*1000*1000*1000;

double timen(int n){
		int nthreads;
#pragma omp parallel
#pragma omp master
		nthreads = omp_get_num_threads();
		std::cout<<nthreads<<std::endl;

	__declspec(align(64)) double a[8*n], b[8*n], c[8*8*nthreads];
	for(int i=0; i < 64*nthreads; i++)
		c[i] = 0;

	for(int i=0; i < 8*n; i++)
		a[i] = b[i] = 1.0;

	TimeStamp clk;
	clk.tic();
#pragma omp parallel
	{
		int tid = omp_get_thread_num();
		double *cc = c + tid*64;
		#pragma omp for
		for(long i=0; i < count; i++){
			switch(n){
			case 24:
				asm8x24x8(a, b, cc);
				break;
			case 36:
				asm8x36x8(a, b, cc);
				break;
			case 48:
				asm8x48x8(a, b, cc);
				break;
			default:
				assrt(0==1);
				break;
			}
		}

	}
	return clk.toc();
}

int main(){
	const char* rows[3] = {"24", "36", "48"};
	int n[3] = {24, 36, 48};

	const char* cols[2] = {"flops/mic_cyc", "flops/host_cyc"};
	double data[6];

	for(int i=0; i < 3; i++){
		double cycles = timen(n[i]);
		data[i] = 2.0*64*n[i]*count/cycles;
		data[i+3] = data[i]/MIC_CYCLE_FACTOR;
	}
	
	char banner[200];
	int nthreads;
#pragma omp parallel
#pragma omp master
	nthreads = omp_get_num_threads();

	sprintf(banner, "peak flops/mic_cyc = 976, nthreads = %d", nthreads);
	
	verify_dir("DBG");
	link_cout("DBG/time_asm.txt");
	Table tbl;
	tbl.dim(3,2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print(banner);
	unlink_cout();
}
