#include "../utils/utils.hh"
#include "../xphi-init/mic_init.hh"
#include "mmult.hh"
#include <mkl.h>

void test_host(long dim){
	double *a = new double[dim*dim];
	double *b = new double[dim*dim];
	double *c = new double[dim*dim];

#pragma omp parallel for
	for(long i=0; i < dim*dim; i++)
		a[i] = b[i] = c[i] = 1;

	mmult(a, b, c, dim);

	array_show(c, dim*dim, "product matrix");

	delete[] a;
	delete[] b;
	delete[] c;
}


void test_offload(long dim){
	double *a = new double[dim*dim];
	double *b = new double[dim*dim];
	double *c = new double[dim*dim];

#pragma omp parallel for
	for(long i=0; i < dim*dim; i++)
		a[i] = b[i] = c[i] = 1;

#pragma offload target(mic)					\
	in(a:length(dim*dim) align(64) alloc_if(1) free_if(1))	\
	in(b:length(dim*dim) align(64) alloc_if(1) free_if(1))	\
	inout(c: length(dim*dim) align(64) alloc_if(1) free_if(1))
	mmult(a, b, c, dim);

	array_show(c, dim*dim, "product matrix");

	delete[] a;
	delete[] b;
	delete[] c;
}


void test_auto(long dim){
	double *a = new double[dim*dim];
	double *b = new double[dim*dim];
	double *c = new double[dim*dim];

#pragma omp parallel for
	for(long i=0; i < dim*dim; i++)
		a[i] = b[i] = c[i] = 1;
	mkl_mic_enable();
	mmult(a, b, c, dim);
	mkl_mic_disable();

	array_show(c, dim*dim, "product matrix");

	delete[] a;
	delete[] b;
	delete[] c;
}

int main(){
	int nmic;
	mic_init(nmic);

	test_host(7);
	test_offload(8);
	test_auto(9);

	mic_exit();
}
