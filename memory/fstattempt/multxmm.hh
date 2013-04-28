void runshuffle();
void multxmm2x4x4A(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc);

void multxmm2x4x4B(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc);

extern "C" {
  void multasm1(double *a, double *b, double *c, 
		long int lda, long int ldb, long int ldc);
}
