#include "../utils/utils.hh"
#include "transpose.hh"
#include <cstdlib>

void test1(){
	double a[200], b[200];
	for(int i=0; i < 200; i++)
		a[i] = i;
	int nthreads = 5;
	assrt(10%B == 0);
	assrt(20%(nthreads*B) == 0);
	blocktrans(a, b, 10, 20, nthreads);

	array_out(b, 20, 10);
}

void test2(int nthreads){
	int m = B*nthreads*10;
	int n = B*nthreads*15;
	double *a = new double[m*n];
	double *b = new double[m*n];
	double *aa = new double[m*n];
	for(int i=0; i < m*n; i++)
		a[i] = rand()*1.0/RAND_MAX-0.5;

	blocktrans(a, b, m, n, nthreads);
	blocktrans(b, aa, n, m, nthreads);

	array_diff(a, aa, m*n);
	double rerr = array_max(a, m*n)/array_max(aa, m*n);
	std::cout<<" nthreads = "<<nthreads<<std::endl;
	std::cout<<"        B = "<<B<<std::endl;
	std::cout<<"        m = "<<m<<std::endl;
	std::cout<<"        n = "<<n<<std::endl;	
	std::cout<<"rel error = "<<rerr<<std::endl;
	delete[] a;
	delete[] b;
	delete[] aa;
}	      

int main(){
	//test1();
	for(int i=1; i < 12; i++)
		test2(i);
}
