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

void easytrans(double *restrict a, double *restrict b, int m, int n){
	for(int i=0; i < m; i++)
		for(int j=0; j < n; j++)
			b[j+i*n] = a[i+j*m];
}


static void oneblock(double *restrict a, double *restrict b, int lda, int ldb){
	for(int i=0; i < B; i++)
		for(int j=0; j < B; j++)
			b[j+i*ldb] = a[i+j*lda];
}


void blocktrans(double *restrict a, double *restrict b, int m, int n){
	assrt((m%B==0)&&(n%B==0));
	for(int i=0; i < m; i+=B)
		for(int j=0; j < n; j+=B)
			oneblock(a+i+j*m, b+j+i*n, m, n);
}

void blocktransx(double *restrict a, double *restrict b, int m, int n){
	assrt((m%B==0)&&(n%B==0));
	for(int i=0; i < m; i+=B)
		for(int j=0; j < n; j+=B)
			for(int ii=0; ii < B; ii++)
				for(int jj=0; jj < B; jj++)
					b[j+jj+(i+ii)*n] = a[i+ii+(j+jj)*m];
}

void recursivetrans(double *restrict a, double *restrict b, 
		    int m, int n, int lda, int ldb){
	if((m==B)&&(n==B))
		oneblock(a, b, lda, ldb);
	else if(n>=m){
		int n1 = (n/B/2)*B;
		int n2 = n-n1;
		recursivetrans(a, b, m, n1, lda, ldb);
		recursivetrans(a+n1*lda, b+n1, m, n2, lda, ldb);
	}
	else{
		int m1 = (m/B/2)*B;
		int m2 = m-m1;
		recursivetrans(a, b, m1, n, lda, ldb);
		recursivetrans(a+m1, b+m1*ldb, m2, n, lda, ldb);
	}
}

void recursivetrans(double *restrict a, double *restrict b, int m, int n){
	assrt(m%B == 0 && n%B == 0);
	assrt(m >= B && n >= B);
	recursivetrans(a, b, m, n, m, n);
}

//m and n must equal a power of 2 times B (blk size)
void pow2trans(double *restrict a, double *restrict b, int n){
	int n1 = n/B;//n1 assumed to be power of 2
	int i=0, j=0;
	while((i!=n1-1)||(j!=n1-1)){
		oneblock(a+i*B+j*B*n, b+j*B+i*B*n, n, n);
		if(i%2==0)
			i += 1;
		else if(j%2==0){
			i -= 1;
			j += 1;
		}
		else{
			int f = 1;
			while((i%2==1)&&(j%2==1)){
				i = (i-1)/2;
				j = (j-1)/2;
				f = 2*f;
			}
			if(i%2==0)
				i += 1;
			else{
				i -= 1;
				j += 1;
			}
			i = i*f;
			j = j*f;
		}
	}
	oneblock(a+i*B+j*B*n, b+j*B+i*B*n, n, n);
}

