double sum(double *restrict a, long int n);
double sumstride(double *restrict a, long int n, int stride);
double sumconststride(double *restrict a, long int n);
void copy(double *restrict a, double *restrict b, long int n);
void copyconststride(double *restrict a, double *restrict b, long int n);
const int STR=8;
