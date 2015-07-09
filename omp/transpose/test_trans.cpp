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

#include "../../utils/utils.hh"
#include "transpose.hh"
#include <cstdlib>

void test1(){
	B = 2; /* B is a global */
	int nthreads = 5;

	assrt(10%B == 0);
	assrt(20%(nthreads*B) == 0);

	double a[200], b[200];
	for(int i=0; i < 200; i++)
		a[i] = i;


	blocktrans(a, b, 10, 20, nthreads);

	array_out(b, 20, 10);
}

void test2(int nthreads){
	B = 25;
	int m = B*nthreads*10;
	int n = B*nthreads*15;
#ifdef __MIC__
	assrt(3l*8*m*n <= 7l*1000*1000*1000);
#endif
	double *a = new double[m*n];
	double *b = new double[m*n];
	double *aa = new double[m*n];
#pragma omp parallel for			\
	num_threads(nthreads)
	for(int i=0; i < m*n; i++)
		a[i] = rand()*1.0/RAND_MAX-0.5;

	blocktrans(a, b, m, n, nthreads);
	blocktrans(b, aa, n, m, nthreads);

	array_diff(a, aa, m*n);
	double rerr = array_max(a, m*n)/array_max(aa, m*n);
	std::cout<<" nthreads = "<<nthreads<<std::endl;
	std::cout<<"        B = "<<B<<std::endl;
	std::cout<<"        m = "<<m<<std::endl;
	std::cout<<"        n = "<<n<<std::endl;	
	std::cout<<"rel error = "<<rerr<<std::endl;
	delete[] a;
	delete[] b;
	delete[] aa;
}	      

int main(){
	//test1();

#ifdef __MIC__
	assrt(getenv("MIC_OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("MIC_OMP_NUM_THREADS"));
#else
	assrt(getenv("OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("OMP_NUM_THREADS"));
#endif
	for(int i=1; i <= 4; i++)
		test2(i*nthreads);
}
