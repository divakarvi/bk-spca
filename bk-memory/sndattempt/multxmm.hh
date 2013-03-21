void multxmm4x1x4(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc);

void multxmm4x1x4R(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc);
void multxmm4x1x4RU5(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc);
void multxmm4x1x4RU(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc);

extern "C" {
  void multasm1(double *a, double *b, double *c, 
		long int lda, long int ldb, long int ldc);
}
