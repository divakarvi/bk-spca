extern "C"{
void asm4x1x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
void asm4x2x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
void asm4x4x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
void asm4x30x4(double *a, double *b, double *c,
	      long int lda, long int ldb, long int ldc);
}

