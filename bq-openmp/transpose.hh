const int B = 125;
void easytrans(double *restrict a, double *restrict b, int ldb,
	       int m, int n);
void blocktransx(double *restrict a, double *restrict b, 
		 int ldb, int m, int n);
void blocktrans(double *restrict a, double *restrict b,
		int m, int n, int nthreads);
