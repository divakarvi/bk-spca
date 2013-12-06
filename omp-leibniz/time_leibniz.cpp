#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/Table.hh"
#include "leibniz.hh"
#include <omp.h>
#include <fstream>
#include <cstdio>
#include <cstdlib>

struct leib_struct{
	double pi;
	double cycles;
};

enum leib_enum {LEIB, PLL, PLLX, FOR, FORCHUNK, PLLFOR, SCTN};

struct leib_struct time_leibniz(long int n, int nthreads, enum leib_enum flag){
	TimeStamp clk;
	clk.tic();
	struct leib_struct ans;
	int chunk = 10;
	
	switch(flag){
	case LEIB:
		ans.pi = leibniz(n);
		break;
	case PLL:
		ans.pi = parallel(n, nthreads);
		break;
	case PLLX:
		ans.pi = parallel(n, nthreads);
		break;
	case FOR:
		ans.pi = ompfor(n, nthreads);
		break;
	case FORCHUNK:
		ans.pi = ompforchunk(n, nthreads, chunk);
		break;
	case PLLFOR:
		ans.pi = ompfor(n, nthreads);
		break;
	case SCTN:
		ans.pi = section(n);
		break;
	default:
		assrt(0 == 1);
	}
	ans.cycles = clk.toc();
	return ans;
}

int main(){
	enum leib_enum flag[7] = {LEIB, PLL, PLLX, 
				  FOR, FORCHUNK, PLLFOR, 
				  SCTN};
	const char* rows[7] = {"serial", "parallel", "parallelx",
			       "for", "forchunk", "parallelfor",
			       "section"};
	const char* cols[2] = {"pi", "cycles/term"};
#ifdef __MIC__
	const int nthreads = atoi(getenv("MIC_OMP_NUM_THREADS"));
#else
	const int nthreads = atoi(getenv("OMP_NUM_THREADS"));
#endif
	std::cout<<"num of threads = "<<nthreads<<std::endl;

	const long n = 1l*1000*1000*1000*10;
	double data[14];
	struct leib_struct ans;
	for(int i=0; i < 7; i++){
		ans = time_leibniz(n, nthreads, flag[i]);
		data[i] = ans.pi;
		data[i+7] = ans.cycles/n;
	}

	Table tbl;
	tbl.dim(7, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	verify_dir("DBG");
	link_cout("DBG/time_leibniz.txt");
	char banner[200];
	sprintf(banner, "sum of %ld terms of Leibniz", n);
	tbl.print(banner);
	unlink_cout();
}
