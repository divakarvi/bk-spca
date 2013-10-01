#include "../utils/utils.hh"
#include "../utils/StatVector.hh"
#include "../utils/TimeStamp.hh"
#include "asm4xnx4.hh"
#include <cstdio>
#include <cstdlib>

void skew2x2(double *c, int m, int n){
	int ldc = m;
	for(int i=0; i < m; i+=2)
		for(int j=0; j < n; j+=2){
			double temp;
			temp = c[i+1+j*ldc];
			c[i+1+j*ldc] = c[i+1+(j+1)*ldc];
			c[i+1+(j+1)*ldc] = c[i+(j+1)*ldc];
			c[i+(j+1)*ldc] = temp;
		}
}

void easymult(double *restrict a, double *restrict b, double *restrict c,
	      int m, int n, int p){
	int lda = m;
	int ldb = n;
	int ldc = m;
	for(int i=0; i < m; i++)
		for(int j=0; j < n; j++)
			for(int k=0; k < p; k++)
				c[i+k*ldc] += a[i+j*lda]*b[j+k*ldb];
}

void test4x1x4(){
	__declspec(align(16)) double a[4];
	__declspec(align(16)) double b[4];
	__declspec(align(16)) double c[16];

	double cc[16];
	for(int i=0; i < 16; i++)
		c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 4; i++){
		a[i] = rand()*1.0/RAND_MAX-0.5;
		b[i] = rand()*1.0/RAND_MAX-0.5;
	}

	
	

}
