#include "../utils/utils.hh"
#include "../proc-microk/asm4xnx4.hh"
#include "blockmult.hh"
using namespace std;

/*
 * a = 4x200 in column major format
 * b = 200x12, three successive 200 x 4 blocks each in row major format
 * c = 4x12 in skew form
 */
void mult4x200x12(double *a, double *b, double *c){
	asm4x200x4(a, b, c);
	asm4x200x4(a, b+800, c+16);
	asm4x200x4(a, b+1600, c+32);
}

void unpackC(double *c, double *C, int ldC){
	for(int i=0; i < 600; i+= 4)
		for(int ii=0; ii < 12; ii++)
			for(int iii=0; iii<4; iii++)
				C[i+iii+ii*ldC] += c[12*i+4*ii+iii];
}

/*
 * a = 600x200, 150 succ 4x200 blocks each in column major format
 * b = 200x12, 3 succ 200x4 blocks each in row major format
 * C = column major with ldC and skewed
 */
void mult600x200x12(double *a, double *b, 
		    double *C, int ldC,
		    double *scratch){
	double *c = scratch;
	for(int i=0; i < 7200; i++)
		c[i] = 0;
	for(int  i=0; i < 150; i++)
		mult4x200x12(a+i*800, b, c+i*48);
	unpackC(c, C, ldC);
}

void packA(double *A, int ldA, double *a){
	for(int j=0; j < 200; j++)
		for(int i=0; i < 150; i++)
			for(int ii=0; ii < 4; ii++)
				a[i*800+ii+j*4] = A[4*i+ii+j*ldA];
}

/*
 * A = 600x200, column major with ldA
 * b = 200x3000, 750 succ 200x4 blocks, each in row major format
 * C = 600x3000, column major with ldC, skewed
 */
void mult600x200x3000(double *A, int ldA,
		      double *b,
		      double *C, int ldC,
		      double *scratch){
	double *a = scratch;
	scratch += 600*200;
	packA(A, ldA, a);
	for(int i=0; i < 250; i++)
		mult600x200x12(a, b+i*2400, C+i*12*ldC, ldC, scratch);
}

void packB(double *B, int ldB, double *b){
	for(int j=0; j < 750; j++)
		for(int i=0; i < 200; i++)
			for(int jj=0; jj < 4; jj++){
				b[jj+i*4+j*800] = B[i+(4*j+jj)*ldB];
			}

}

/*
 * A, B, C in column major formats with ldA/ldB/ldC
 * C is skewed
 */
void mult3000x200x3000(double *A, int ldA,
		       double *B, int ldB,
		       double *C, int ldC,
		       double *scratch){
	double *b = scratch;
	scratch += 200*3000;
	packB(B, ldB, b);
	for(int i=0; i < 5; i++)
		mult600x200x3000(A+i*600, ldA, b, C+i*600, ldC, scratch);
}

void blockmult(double *A, double *B, double *C,
	       int l, int m, int n,
	       double *scratch){
	assrt((long)A%16 == 0);
	assrt((long)B%16 == 0);
	assrt((long)C%16 == 0);

	assrt(l%3000 == 0);
	assrt(m%200 == 0);
	assrt(n%3000 == 0);
  
	int ldA = l;
	int ldB = m;
	int ldC = l;
  
	l = l/3000;
	m = m/200;
	n = n/3000;
	for(int i=0; i < l; i++)
		for(int j=0; j < m; j++)
			for(int k=0; k < n; k++){
				double *AA = A + (i*3000)+(j*200)*ldA;
				double *BB = B + (j*200)+(k*3000)*ldB;
				double *CC = C + (i*3000)+(k*3000)*ldC;
				mult3000x200x3000(AA, ldA, BB, ldB, 
						  CC, ldC, scratch);
			}
}
