#include "Vector.hh"
#include "Matrix.hh"

void multijk(Vector& a, Vector& b, Vector& c, int dim){
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++)
      for(int k=0; k < dim; k++)
	c(i+j*dim) += a(i+k*dim)*b(k+j*dim);
}

void multijk(Matrix& A, Matrix& B, Matrix& C){
  int l = A.getm();
  int m = A.getn();
  assert(B.getm()==m);
  int n = B.getn();
  assert(C.getm()==l);
  assert(C.getn()==n);
  for(int i=0; i < l; i++)
    for(int j=0; j < m; j++)
      for(int k=0; k < n; k++)
	C(i,k) += A(i,j)*B(j,k);
}
