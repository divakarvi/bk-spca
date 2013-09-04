#include "../utils/utils.hh"
#include "../utils/Vector.hh"
#include "../utils/Matrix.hh"
#include <unistd.h>

extern void lufactorize(Matrix& M, int *ipiv);
extern void lusolve(Matrix& M, int * ipiv, Vector & v);

void testlu(int n){
	Matrix A(n, n);
	Vector v(n);
	for(int i = 0; i < n; i++){
		v(i) = rand()*1.0/RAND_MAX-0.5;
		for(int j = 0; j < n; j++)
			A(i, j) = rand()*1.0/RAND_MAX - 0.5;
	}
	verify_dir("DBG/");
	A.output("DBG/A.dat");

	int *ipiv;
	ipiv = new int[n];
	lufactorize(A, ipiv);

	v.output("DBG/b.dat");
	lusolve(A, ipiv, v);
	v.output("DBG/x.dat");

	system("test_linalg.py DBG/A.dat DBG/b.dat DBG/x.dat");

	delete[] ipiv;
}

int main(){
	testlu(10);
	testlu(100);
	testlu(200);
}