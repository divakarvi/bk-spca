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

#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include <omp.h>
#include <cmath>
#include <iostream>
#include <iomanip>

static int gl_blksize = -1;

void set_blksize(int B){
	gl_blksize = B;
}

int get_blksize(){
	return gl_blksize;
}

//handling diagonal blocks
void trans_diag_block(double *restrict b, int ld)
{
	int B = gl_blksize;
	__assume(B>0);
	for(int jj=0; jj<B; jj++)
		for(int ii=0; ii<jj; ii++){
			double tmp = b[ii+jj*ld];
			b[ii+jj*ld] = b[jj+ii*ld];
			b[jj+ii*ld] = tmp;
		}
}

//handling off-diagonal blocks, c is the symmetric block of b
void trans_block(double *restrict b, double *restrict c, int ld)
{
	int B = gl_blksize;
	__assume(B>0);
	double tmp=0;
	for(int jj=0; jj<B; jj++)
		for(int ii=0; ii<B; ii++){
			tmp = b[ii+jj*ld];
                        b[ii+jj*ld] = c[jj+ii*ld];
                        c[jj+ii*ld] = tmp;
		}
}

void blocktrans(double *restrict a, int N, int nthreads)
{
	int B = gl_blksize;
	assrt(B>0);
	__assume(B>0);
//handle diagonal blocks
#pragma omp parallel for                              \
	num_threads(nthreads)                         \
	schedule(static)                              \
	default(none)                                 \
	shared(a, N, B)
	for(int i=0; i<N; i+=B)
		trans_diag_block(a+i+i*N, N);

	int n = N/B;

	//setup (i,j) pairs
	int kthi[(n-1)*n/2], kthj[(n-1)*n/2];
	for (int k=0; k<(n-1)*n/2; k++){
		double al = -0.5+0.5*sqrt(1.0+8.0*k);
		kthj[k] = int(al+1+1.e-8);
		kthi[k] = int(k-kthj[k]*(kthj[k]-1)/2);
	}
	
//handle off-diagonal blocks
#pragma omp parallel for                              \
	num_threads(nthreads)                         \
        schedule(static)                              \
        default(none)                                 \
        shared(a, n, N, kthi, kthj, B)
	for(int k=0; k<(n-1)*n/2; k++){
		trans_block(a+kthi[k]*B+kthj[k]*B*N,a+kthj[k]*B+kthi[k]*B*N,N);
		}
}

void printmatrix(double *restrict a, int dim)
{
        int i,j;

        for(i=0; i<dim; i++){
		for(j=0; j<dim; j++)
			std::cout<<std::setw(7)<<a[i+j*dim];
		std::cout<<std::endl;
	}
}

void test_trans()
{
	int dim=10;
	double a[dim*dim];
	for(int i=0; i<dim*dim; i++)
		a[i] = i;
	std::cout<<"Original Matrix:"<<std::endl;
	printmatrix(a, dim);

	int nthreads = 12;
	set_blksize(5);
	blocktrans(a, dim, nthreads);

	std::cout<<"B= "<<get_blksize()<<std::endl;
	std::cout<<"nthreads= "<<nthreads<<std::endl;
	std::cout<<"New Matrix:"<<std::endl;
	printmatrix(a, dim);
}

/*
 * returns bw in bytes/cycle
 * blocksize = B
 */
double time_trans(int B)
{
	int N = 15625;
	int nthreads = 12;
	assrt(B > 0 && N%B == 0);
	set_blksize(B);

	double *a = (double *)_mm_malloc(1l*N*N*sizeof(double), 64);

	blocktrans(a, N, nthreads); //numa awareness
	for(int i=0; i < N*N; i++)
		a[i] = 0;

	int count = 10;
	StatVector stats(count);
	TimeStamp clk;
	for(int i=0; i < count; i++){
		clk.tic();
		blocktrans(a, N, nthreads);
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	_mm_free(a);
	return 8.0*N*N/stats.median();
}

void make_table(){
	const char* rows[6] = {"1", "5", "25", "125", "625", "3125"};
	int B[6] = {1, 5, 25, 125, 625, 3125};
	const char* cols[1] = {"bytes/cycle"};
	double data[6];
	
	for(int i=0; i < 6; i++)
		data[i] = time_trans(B[i]);

	verify_dir("DBG");
	link_cout("DBG/time_trans.txt");
	Table tbl;
	tbl.dim(6, 1);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("bw for in place transpose");
	unlink_cout();
}

int main(){
	//test_trans();
	make_table();
}
