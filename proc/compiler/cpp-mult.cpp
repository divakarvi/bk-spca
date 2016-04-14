#include "../../utils/utils.hh"
#include "../../utils/Vector.hh"
#include "Matrix.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include <iostream>

void multijk(Matrix& A, Matrix& B, Matrix& C){
	int l = A.getm();
	int m = A.getn();
	int n = B.getn();
	for(int i=0; i < l; i++)
		for(int j=0; j < m; j++)
			for(int k=0; k < n; k++)
				C(i,k) += A(i,j)*B(j,k);
}

void timecppmult(int dim, int count){
	Vector a(dim*dim*count), b(dim*dim*count), c(dim*dim*count);
	Matrix A, B, C;
	TimeStamp clk;
	StatVector stats(count);

	for(int i=0; i < dim*dim*count; i++){//fast and not random
		a(i) = 1/(i+1);
		b(i) = 2*i/(4*i+1);
		c(i) = 0;
	}

	for(int i=0; i < count; i++){
		A.shadow(a, i*dim*dim, dim, dim);
		B.shadow(a, i*dim*dim, dim, dim);
		C.shadow(a, i*dim*dim, dim, dim);
		clk.tic();
		multijk(A, B, C);
		stats.insert(clk.toc());
	}
	double cycles = stats.median();
	
	cout<<"\n\n\t\tdim = "<<dim<<endl;
	cout<<"\t flops/cycle = "<<2.0*dim*dim*dim/cycles<<endl;
}

int main(){
	int dim[4] = {100, 1000, 2000, 6000};
	int count[4] = {4000, 40, 10, 1};

	verify_dir("DBG/");
	const char* fname = "DBG/cpp-mult.txt";
	link_cout(fname);
	
	for(int i=0; i < 4; i++){
		timecppmult(dim[i], count[i]); 
	}
	
	unlink_cout();
}
