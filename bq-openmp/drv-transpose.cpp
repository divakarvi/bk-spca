#include <iostream>
#include <cstdlib>
#include "TimeStamp.hh"
#include "StatVector.hh"
#include "transpose.hh"
using namespace std;

//test with const int B=2 in transpose.hh!!!
void testa(){
  double a[200], b[200];
  for(int i=0; i < 200; i++)
    a[i] = i;
  blocktrans(a, b, 10, 20, 5);
  for(int i=0; i < 20; i++){
    for(int j=0; j < 10; j++)
      cout<<b[i+j*20]<<" ";
    cout<<endl;
  }
}

void testb(int nthreads){
  int m = B*nthreads*10;
  int n = B*nthreads*15;
  double *a = new double[m*n];
  double *b = new double[m*n];
  double *aa = new double[m*n];
  for(int i=0; i < m*n; i++)
    a[i] = rand()*1.0/RAND_MAX-0.5;
  blocktrans(a, b, m, n, nthreads);
  blocktrans(b, aa, n, m, nthreads);
  double max = 0;
  for(int  i=0; i < m*n; i++)
    if(fabs(a[i]-aa[i])>max)
      max = fabs(a[i]-aa[i]);
  cout<<"max error = "<<max<<endl;
  delete[] a;
  delete[] b;
  delete[] aa;
}

void test(){
  for(int i=1; i <= 12; i++)
    testb(i);
}

void time(int nthreads){
  int m = 100*100*4;//8*1.6 = 12.8 GB matrix
  cout<<"initial m = "<<m<<endl;
  m = m/(B*nthreads)*B*nthreads;
  int n = m;
  double *a = new double[m*n];
  double *b = new double[m*n];
  blocktrans(a, b, m, n, nthreads);//numa awareness
  for(int i=0; i < m*n; i++)
    a[i] = 0;
  int count = 10;
  StatVector stats(count);
  for(int i=0; i < count; i++){
    TimeStamp clk;
    clk.tic();
    blocktrans(a, b, m, n, nthreads);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  char banner[200];
  sprintf(banner, "nthreads = %d, B = %d, m/(nthreads*B) = %d",
	 nthreads, B, m/(nthreads*B));
  stats.print(banner);
  double cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  delete[] a;
  delete[] b;
}

int main(){
  for(int i=1; i <= 12; i++){
    time(i);
    cout<<endl<<endl;
  }
}
