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
#include "transpose.hh"

enum transpose_enum {EASY, BLOCK, BLOCKX, RECURSIVE, POW2};

/*
 * returns b/w in bytes per cycle
 */
double  time(double *a, double *b, int m, int n, enum transpose_enum flag){
	const  int count = 10;
	
	TimeStamp clk;
	StatVector stats(count);

	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case EASY:
			easytrans(a, b, m, n);
			break;
		case BLOCK:
			blocktrans(a, b, m, n);
			break;
		case BLOCKX:
			blocktransx(a, b, m, n);
			break;
		case RECURSIVE:
			recursivetrans(a, b, m, n);
			break;
		case POW2:
			assrt(m == n);
			assrt(n%B == 0);
			int nn = n;
			while(nn > 1){
				assrt(nn%2 == 0);
				nn = nn/2;
			}
			pow2trans(a, b, n);
			break;
		}

		double cycles = clk.toc();
		stats.insert(cycles);
	}
	return 16.0*m*n/stats.median();
}

/*
 * table with m = 20000 and n = 30000
 */
void table1(){
	int m = 20000;
	int n = 30000;
	long nbytes = 1l*m*n*8;
	double *a = (double *)_mm_malloc(nbytes, 64);
	double *b = (double *)_mm_malloc(nbytes, 64);

	for(int i=0; i < m*n; i++)
		a[i] = i;

	const char* rows[4] = {"easy", "block", "blockx", "recursv"};
	const char* cols[1] = {"bytes/cycle"};
	double bw[4];
	
	bw[0] = time(a, b, m, n, EASY);
	bw[1] = time(a, b, m, n, BLOCK);
	bw[2] = time(a, b, m, n, BLOCKX);
	bw[3] = time(a, b, m, n, RECURSIVE);

	char fname[200];
	verify_dir("DBG");
	sprintf(fname, "DBG/time_trans_B_%d.txt", B);
	link_cout(fname);

	Table tbl;
	tbl.dim(4, 1);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(bw);
	char banner[200];
	sprintf(banner, "B = %d, m = %d, n = %d \n", B, m, n);
	tbl.print(banner);
	
	_mm_free(a);
	_mm_free(b);

	unlink_cout();
}

/*
 * table with m = n = 2^14
 */
void table2(){
	const int m = 1024*16;
	const int n = 1024*16;

	/*
	 * check B is a power of 2
	 */
	int BB = B;
	while(BB > 1){
		assrt(BB%2 == 0);
		BB = BB/2;
	}
		

	long nbytes = 1l*m*n*8;
	double *a = (double *)_mm_malloc(nbytes, 64);
	double *b = (double *)_mm_malloc(nbytes, 64);

	for(int i=0; i < m*n; i++)
		a[i] = i;

	double bw[5];
	bw[0] = time(a, b, m, n, EASY);
	bw[1] = time(a, b, m, n, BLOCK);
	bw[2] = time(a, b, m, n, BLOCKX);
	bw[3] = time(a, b, m, n, RECURSIVE);
	bw[4] = time(a, b, m, n, POW2);


	const char* rows[5] = {"easy", "block", "blockx", "recursv", "pow2"};
	const char* cols[1] = {"bytes/cycle"};

	char fname[200];
	verify_dir("DBG");
	sprintf(fname, "DBG/time_pow2_B_%d.txt", B);
	link_cout(fname);

	Table tbl;
	tbl.dim(5, 1);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(bw);
	char banner[200];
	sprintf(banner, "B = %d, m = %d, n = %d \n", B, m, n);
	tbl.print(banner);

	_mm_free(a);
	_mm_free(b);

	unlink_cout();
}


int main(){
	table1(); //B = 4, 8, 10, 20, 40, 50, 80, 100, 125, 200, 500, 1000
	table2(); //B = 4, 8, 16, 32, 64, 128
}
