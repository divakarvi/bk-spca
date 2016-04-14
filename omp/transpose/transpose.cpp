#include "../../utils/utils.hh"
#include <omp.h>
#include "transpose.hh"

/*
 * block size
 */
int B;

void easytrans(double *restrict a, double *restrict b, int ldb,
	       int m, int n){
	for(int i=0; i < m; i++)
		for(int j=0; j < n; j++)
			b[j+i*ldb] = a[i+j*m];
}

void blocktransx(double *restrict a, double *restrict b, 
		 int ldb, int m, int n){
	assrt(m%B == 0 && n%B == 0);
	for(int i=0; i < m; i+=B)
		for(int j=0; j < n; j+=B)
			for(int ii=0; ii < B; ii++)
				for(int jj=0; jj < B; jj++)
					b[j+jj+(i+ii)*ldb] = a[i+ii+(j+jj)*m];
}

void blocktrans(double *restrict a, double *restrict b,
		int m, int n, int nthreads){
	assrt(m%B == 0);
	assrt(n%(nthreads*B) == 0);
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(a, b, m, n, nthreads)			
	{
		int tnum = omp_get_thread_num();
		int nn = n/nthreads;
		int nfst = tnum*nn;
		int nlst = nfst+nn;
		int ldb = n;
		blocktransx(a+m*nfst, b+nfst, ldb, m, nlst-nfst); 
	}
}

