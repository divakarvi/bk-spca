extern "C"{
  void asm4x1x4(double *a, double *b, double *c);
  void asm4x4x4(double *a, double *b, double *c);
  void asm4x20x4(double *a, double *b, double *c);
  void asm4x40x4(double *a, double *b, double *c);
  void asm4x100x4(double *a, double *b, double *c);
  void asm4x200x4(double *a, double *b, double *c);
}

//a=4x200
//b=200x12
//c=4x12
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
