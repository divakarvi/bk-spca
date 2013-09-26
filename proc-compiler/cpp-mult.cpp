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

void timecppmult(int dim, int count){
	Vector a(dim*dim), b(dim*dim), c(dim*dim);
	TimeStamp clk;
	StatVector stats(count);
	for(int index=0; index < count; index++){
		for(int i=0; i < dim; i++) //intialize a, b and c
			for(int j=0; j < dim; j++){
				a(i+j*dim) = 1.0/(1.0+i+j);
				b(i+j*dim) = 2.0/(2.0+i+j) + index;
				c(i+j*dim) = 3.0/(3.0+i+j);
			}
		for(int i=0; i < dim; i++) //clear a, b, c from cache
			for(int j=0; j < dim; j++){
				_mm_clflush(a.getRawData()+i+j*dim);
				_mm_clflush(b.getRawData()+i+j*dim);
				_mm_clflush(c.getRawData()+i+j*dim);
			}
		clk.tic();
		multijk(a, b, c, dim);
		double cycles = clk.toc();
		stats.insert(2.0*dim*dim*dim/cycles); //flops per cycle
	}
	cout<<"  dim = "<<dim<<endl;
	stats.print(" matrix mult using vector objects");
	stats.flush();

	Matrix A(dim, dim), B(dim, dim), C(dim, dim);
	for(int index=0; index < count; index++){
		for(int i=0; i < dim; i++) //intialize a, b and c
			for(int j=0; j < dim; j++){
				A(i,j) = 1.0+i+j-index;
				B(i,j) = 1.0+i+j+index;
				C(i,j) = 0;
			}
		for(int i=0; i < dim; i++) //clear a, b, c from cache
			for(int j=0; j < dim; j++){
				_mm_clflush(A.getRawData()+i+j*dim);
				_mm_clflush(B.getRawData()+i+j*dim);
				_mm_clflush(C.getRawData()+i+j*dim);
			}
		clk.tic();
		multijk(A, B, C);
		double cycles = clk.toc();
		stats.insert(2.0*dim*dim*dim/cycles); //flops per cycle
	}
	cout<<"  dim = "<<dim<<endl;
	stats.print(" matrix mult using matrix objects");
}

int main(){
	int dim[2] = {1000,2000};
	int count[2] = {20/5,10/5};
	
	for(int i=0; i < 2; i++){
		timecppmult(dim[i], count[i]); 
	}
}
