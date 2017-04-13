#include "../../pyplot/pyhist.hh"
#include "latency.hh"

int main(){
	const int N = 1000*1000;
	double *cycles = new double[N];
	int *pages = (int *)_mm_malloc(1l*N*4096, 4096);

	for(int i=0; i < N; i++)
		cycles[i] = latency(1, pages + i*1024);
	
	PyHist hist("latency", PIPE_OFF);
	hist.hist(cycles, N);
	hist.bins(150);
	hist.title("latency to dram, each measurement used one page");
	hist.output();
	hist.savescript();

	_mm_free(pages);
	delete[] cycles;
}

