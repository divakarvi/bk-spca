#include "multasm.hh"

void mult24x36x24(double *a, double *b, double *c, 
		  long int lda, long int ldb, long int ldc){
  for(int i=0; i < 24; i+=4)
    for(int j=0; j < 24; j+=4)
      asm4x36x4(a+i, b+j*ldb, c+i+j*ldc, lda, ldb, ldc);
}

void mult360(double *a, double *b, double *c, 
	     long int lda, long int ldb, long int ldc){
  for(int j=0; j < 360; j+=36)
    for(int k=0; k < 360; k+=24)
      for(int i=0; i < 360; i+=24)
	mult24x36x24(a+i+k*lda, b+k+j*ldb, c+i+j*ldc, lda, ldb, ldc);
}

void mult720(double *a, double *b, double *c, 
	     long int lda, long int ldb, long int ldc){
  for(int j=0; j < 720; j+=360)
    for(int k=0; k < 720; k+=360)
      for(int i=0; i < 720; i+=360)
	mult360(a+i+k*lda, b+k+j*ldb, c+i+j*ldc, lda, ldb, ldc);
}



void multA(double *a, double *b, double *c, 
	   long int m, long int n, long int p){
  for(int j=0; j < n; j+=36)
    for(int k=0; k < p; k+=4)
      for(int i=0; i < m; i+=4)
	asm4x36x4(a+i+j*m, b+j+k*n, c+i+k*m, m, n, p);
}

void multB(double *a, double *b, double *c, 
	   long int m, long int n, long int p){
  for(int j=0; j < n; j+=360)
    for(int k=0; k < p; k+=360)
      for(int i=0; i < m; i+=360)
	mult360(a+i+j*m, b+j+k*n, c+i+k*m, m, n, p);
}
