#ifndef __LUSOLVE27OCT2013__
#define __LUSOLVE27OCT2013__

class LU_Solve{
private:
	int dim;
	double *A;
	int *ipiv;
public:
	LU_Solve(double *a, int dimi);
	~LU_Solve();
	void factorize();
	void solve(double *v);
};

#endif

