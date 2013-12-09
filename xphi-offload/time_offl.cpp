#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "../xphi-init/mic_init.hh"
#include "offl.hh"
#include <omp.h>

enum offl_xfer_enum {OFFL_IN, OFFL_OUT, OFFL_INOUT};

/* 6GB small enough for even nmic = 1 */
long nbytes = 6l*1000*1000*1000;
/*
 * return median number of cycles for transfer
 * v[0..n-1] = data xferred
 *      nmic = num of mic devices
 *      flag = in/out/inout xfer
 */
double time_xfer(int nmic, enum offl_xfer_enum flag){
	assrt(nmic >= 1);	
	double *v = (double *)_mm_malloc(nbytes, 64);
	long n = nbytes/8;

	int count = 20;
	StatVector stats(count);
	TimeStamp clk;
	dummy(v, n);

	long fst[nmic+1];
	for(int i=0; i <= nmic; i++)
		fst[i] = i*n/nmic;
	
	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload_transfer target(mic:mc)				\
	nocopy(v[shft:len]:align(64) alloc_if(1) free_if(0))
	}
	
	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case OFFL_IN:
			xfer_in(v, n, nmic);
			break;
		case OFFL_OUT:
			xfer_out(v, n, nmic);			
			break;
		case OFFL_INOUT:
			xfer_inout(v, n, nmic);
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
	}
	
	/*
	 * print avg of entries of v[] here to test
	 */
	std::cout<<"   flag = "<<flag<<std::endl;
	std::cout<<"   nmic = "<<nmic<<std::endl;
	
	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload_transfer target(mic:mc)				\
	nocopy(v[shft:len]:align(64) alloc_if(0) free_if(1))
	}

	_mm_free(v);

	return stats.median();
}


int main(){
	const char* rows[3] = {"IN", "OUT", "INOUT"};
	const char* cols[8] = {"cycs/byte-1mic", "bytes/cyc-1mic", 
			       "cycs/byte-2mic", "bytes/cyc-2mic", 
			       "cycs/byte-3mic", "bytes/cyc-3mic", 
			       "cycs/byte-4mic", "bytes/cyc-4mic"};

	int nmic;
	mic_init(nmic);
	assrt(nmic <= 4);
	double data[2*nmic*3];
	
	enum offl_xfer_enum flag[3] = {OFFL_IN, OFFL_OUT, OFFL_INOUT};
	for(int i = 0; i < 3; i++)
		for(int nm=1; nm <= nmic; nm++){
			double cycles = time_xfer(nm, flag[i]);
			data[i + 2*(nm-1)*3] = cycles/nbytes;
			data[i + (2*(nm-1)+1)*3] = nbytes/cycles;
		}

	
	verify_dir("DBG");
	link_cout("DBG/time_offl.txt");
	Table tbl;
	tbl.dim(3, 2*nmic);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("bw for offload xfers");
	unlink_cout();
	
}
