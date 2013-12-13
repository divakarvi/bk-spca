void fma(double *restrict a, double *restrict b, double *restrict c){
#pragma vector aligned
	for(int i=0; i < 8; i++)
		c[i] = c[i] + a[i]*b[i];
}
