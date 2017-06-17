#ifndef LUSOLVE27OCT2013
#define LUSOLVE27OCT2013

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

