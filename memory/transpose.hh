void easytrans(double *restrict a, double *restrict b, int m, int n);
void oneblock(double *restrict a, double *restrict b, int lda, int ldb);
void blocktrans(double *restrict a, double *restrict b, int m, int n);
void blocktransx(double *restrict a, double *restrict b, int m, int n);
void recursivetrans(double *restrict a, double *restrict b, 
			   int m, int n);
void pow2trans(double *restrict a, double *restrict b, int n);
const int B = 1000;
