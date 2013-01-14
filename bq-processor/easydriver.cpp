#include "TimeStamp.hh"
#include <cmath>
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <inttypes.h>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <iostream>
#include <mkl.h>
#include "StatVector.hh"
#include "Matrix.hh"

using namespace std;

extern void multijk(double *a, double *b, double *c, int dim);
extern void multijkx(double *a, double *b, double *c, int dim);
extern void multIJK(double *restrict a, double *restrict b, 
		    double *restrict c, int dim);
extern void multIJKX(double *restrict a, double *restrict b, 
		    double *restrict c, int dim);
extern void multijk(Vector& a, Vector& b, Vector& c, int dim);
extern  void multijk(Matrix& A, Matrix& B, Matrix& C);

void runmmult(int dim, int count, char code){
  
  assert(dim > 0);
  assert(count >= 0);
  
  double *a = new double[dim*dim+2];//+2 to allow for alignment
  double *b = new double[dim*dim+2];
  double *c = new double[dim*dim+2];
  srand(0);//seed random num generator
  TimeStamp clkticks;
  StatVector stats(count);
  for(int index=0; index < count; index++){
    for(int i=0; i < dim; i++) //intialize a, b and c
      for(int j=0; j < dim; j++){
	a[i+j*dim] = (1.0*rand()/RAND_MAX-0.5)*2;//uniform in [-1,1]
	b[i+j*dim] = (1.0*rand()/RAND_MAX-0.5)*2;
	c[i+j*dim] = (1.0*rand()/RAND_MAX-0.5)*2;
      }
    for(int i=0; i < dim; i++) //clear a, b, c from cache
      for(int j=0; j < dim; j++){
	_mm_clflush(a+i+j*dim);
	_mm_clflush(b+i+j*dim);
	_mm_clflush(c+i+j*dim);
      }
    double tintvl;
    switch(code){
    case 'i':
      clkticks.tic();//intialize timer
      multijk(a, b, c, dim);
      tintvl = clkticks.toc();//read timer
      break;
    case 'k':
      clkticks.tic();//intialize timer
      multijkx(a, b, c, dim);
      tintvl = clkticks.toc();//read timer
      break;
    case 'I':
      clkticks.tic();//intialize timer
      multIJK(a, b, c, dim);
      tintvl = clkticks.toc();//read timer
      break;
    case 'K':
      clkticks.tic();//intialize timer
      multIJKX(a, b, c, dim);
      tintvl = clkticks.toc();//read timer
      break;
    case 'B':
      char trans[3] = "N ";//dgemm_ parameters
      int m = dim, n = dim, k = dim;
      int lda1 = dim;
      int lda2 = dim;
      int lda3 = dim;
      double alpha = 1.0, beta = 1.0;
      clkticks.tic();//intialize timer
      dgemm(trans, trans, 
	     &m, &k, &n, 
	     &alpha,
	     a, &lda1,
	     b, &lda2,
	     &beta,
	     c, &lda3);//BLAS call
      tintvl = clkticks.toc();//read timer
      break;
    }
    stats.insert(2.0*dim*dim*dim/tintvl);//flops per cycle
  }
  char banner[200];
  if(code=='k')//fix shows up in output but not in code
    code = 'x';
  if(code=='K')
    code = 'X';
  sprintf(banner, "\n dim  = %d \n code = %c", dim, code); 
  stats.print(banner);
  delete[] a;
  delete[] b;
  delete[] c;
}

void testcppmult(){
  int dim = 4;
  Vector a(dim*dim), b(dim*dim), c(dim*dim);
  for(int i=0; i < dim*dim; i++){
    a(i) = 1;
    b(i) = 2;
    c(i) = -1;
  }
  multijk(a, b, c, dim);
  for(int i=0; i < dim*dim; i++)
    cout<<c(i)<<endl;
  
  Matrix A(dim, dim), B(dim, dim), C(dim, dim);
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++){
      A(i,j) = 2;
      B(i,j) = 1;
      C(i,j) = -1; 
    }
  multijk(A, B, C);
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++)
      cout<<C(i,j)<<endl;
}

void runcppmult(int dim, int count){
  Vector a(dim*dim), b(dim*dim), c(dim*dim);
  TimeStamp clk;
  StatVector stats(count);
  for(int index=0; index < count; index++){
    for(int i=0; i < dim; i++) //intialize a, b and c
      for(int j=0; j < dim; j++){
	a(i+j*dim) = (1.0*rand()/RAND_MAX-0.5)*2;//uniform in [-1,1]
	b(i+j*dim) = (1.0*rand()/RAND_MAX-0.5)*2;
	c(i+j*dim) = (1.0*rand()/RAND_MAX-0.5)*2;
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
	A(i,j) = (1.0*rand()/RAND_MAX-0.5)*2;//uniform in [-1,1]
	B(i,j) = (1.0*rand()/RAND_MAX-0.5)*2;
	C(i,j) = (1.0*rand()/RAND_MAX-0.5)*2;
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
    runmmult(dim[i], count[i], 'i');
    runmmult(dim[i], count[i], 'k');
    runmmult(dim[i], count[i], 'I');
    runmmult(dim[i], count[i], 'K');
    runmmult(dim[i], count[i], 'B');
    runcppmult(dim[i], count[i]); 
  }
  //testcppmult();
}
