extern "C"{
void asm4x1x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
void asm4x4x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
void asm4x36x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
}
void mult24x36x24(double *a, double *b, double *c, 
		  long int lda, long int ldb, long int ldc);
void mult360(double *a, double *b, double *c, 
	     long int lda, long int ldb, long int ldc);
void multA(double *a, double *b, double *c, 
	   long int m, long int n, long int p);
void multB(double *a, double *b, double *c, 
	   long int m, long int n, long int p);

