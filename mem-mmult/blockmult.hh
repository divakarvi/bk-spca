#ifndef __BLOCKMULT7OCT2013__
#define __BLOCKMULT7OCT2013__

void mult4x200x12(double *a, double *b, double *c);
void mult600x200x12(double *a, double *b, 
		    double *C, int ldC,
		    double *scratch);
void mult600x200x3000(double *A, int ldA,
		      double *b,
		      double *C, int ldC,
		      double *scratch);
void mult3000x200x3000(double *A, int ldA,
		       double *B, int ldB,
		       double *C, int ldC,
		       double *scratch);
void blockmult(double *A, double *B, double *C,
	       int l, int m, int n,
	       double *scratch);
#endif
