#include "../../utils/utils.hh"
#include "../../linking/fft/fft_mkl.hh"
#include "fft_thrd.hh"
#include <omp.h>

fft_thrd::fft_thrd(int ni, long counti, int nth)
	:n(ni), count(counti), nthreads(nth)
{
	
	typedef fft_mkl *fft_mkl_ptr;
	fftlist = new fft_mkl_ptr[nthreads];
	for(int i=0; i < nthreads; i++)
		fftlist[i] = new fft_mkl(n);
}

fft_thrd::~fft_thrd(){
	for(int i=0; i < nthreads; i++)
		delete fftlist[i];
	delete[] fftlist;
}

void fft_thrd::fwd(double *v){
	fft_thrd *self = this;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(v, self)
	{
		int nn = self->n;
		int nth = self->nthreads;
		int cnt = self->count;
		int tid = omp_get_thread_num();
		long first = cnt*tid/nth;
		long next = cnt*(tid+1)/nth;
		for(long i=first; i < next; i++)
			self->fftlist[tid]->fwd(v + i*(2*nn));
	}
}

void fft_thrd::bwd(double *v){
	fft_thrd *self = this;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(v, self)
	{
		int nn = self->n;
		int tid = omp_get_thread_num();
		long first = count*tid/nthreads;
		long next = count*(tid+1)/nthreads;
		for(long i=first; i < next; i++)
			self->fftlist[tid]->bwd(v + i*(2*nn));
	}
}

void fft_thrd::numa_init(double *v){
	fft_thrd *self = this;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(v, self)
	{
		int nn = self->n;
		int tid = omp_get_thread_num();
		long first = count*tid/nthreads;
		long next = count*(tid+1)/nthreads;
		for(long i=first; i < next; i++)
			for(int j=0; j < n; j++)
				v[2*j + i*(2*n)] = v[2*j+1 + i*(2*n)] = 0;
	}
}
