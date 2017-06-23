#include "../../utils/utils.hh"
#include "asm4xnx4.hh"
#include <cstdio>
#include <cstdlib>
/*
 * Skews 2x2 blocks of c[].
 * |a b| ---> |a c|
 * |c d|      |d b|
 * Skewing is a permutation of order 3.
 * Skew twice more to reverse skewing.
 */
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

void test4xnx4(int n){
	__declspec(align(16)) double a[4*n];
	__declspec(align(16)) double b[4*n];
	__declspec(align(16)) double c[16];
	double cc[16];
	double bb[4*n];
	
	for(int i=0; i < 16; i++)
		c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 4*n; i++){
		a[i] = rand()*1.0/RAND_MAX-0.5;
		b[i] = rand()*1.0/RAND_MAX-0.5;
	}
	
	skew2x2(c, 4, 4);
	for(int i=0; i < n; i++)
		for(int j=0; j < 4; j++)
			bb[i+j*n] = b[j+i*4]; 
	
 
	switch(n){
	case 1:
		asm4x1x4(a, b, c);
		break;
	case 4:
		asm4x4x4(a, b, c);
		break;	 
	case 20:
		asm4x20x4(a, b, c);
		break;
	case 40:
		asm4x40x4(a, b, c);
		break;
	case 100:
		asm4x100x4(a, b, c);
		break;	 
	case 200:
		asm4x200x4(a, b, c);
		break;
	default:
		assrt(0 == 1);
	}
	/*
	 * Unskews by skewing twice more.
	 */
	skew2x2(c, 4, 4);
	skew2x2(c, 4, 4);
	easymult(a, bb, cc, 4, n, 4);
	
	array_diff(c, cc, 16);
	double rerr = array_max(c, 16)/array_max(cc,16);
	
	printf("\t\tTesting asm4x%dx4\n", n);
	printf("\t\tinit with rand()\n");
	printf("\tRelative Error = %.2e\n\n", rerr);
}

int main(){
	test4xnx4(1);
	test4xnx4(4);
	test4xnx4(20);
	test4xnx4(40);
	test4xnx4(100);
	test4xnx4(200);
}

