#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
#include <omp.h>
using namespace std;


extern  double leibniz(long int n);
extern  double parallel(long int n, int nthreads);
extern  double parallelX(long int n, int nthreads);
extern  double ompfor(long int n,  int nthreads);
extern  double ompforchunk(long int n,  int nthreads, int chunk);
extern  double parallelfor(long int n, int nthreads);
extern  double section(long int n);



int main(){
  long int n = 1000000000;
  TimeStamp clk;
  double pi;
  double cycles;
  int nthreads = 12;

  {
    clk.tic();
    pi = leibniz(n);
    cycles = clk.toc();
    cout<<"[leibniz] pi = "<<pi<<endl;
    cout<<"[leibniz] cycles/term = "<<cycles/n<<endl<<endl;
  }
  
  {
    clk.tic();
    pi = parallel(n,nthreads);
    cycles = clk.toc();
    cout<<"[parallel] pi = "<<pi<<endl;
    cout<<"[parallel] cycles/term = "<<cycles/n<<endl<<endl;
  }

  {
    clk.tic();
    pi = parallelX(n,nthreads);
    cycles = clk.toc();
    cout<<"[parallelX] pi = "<<pi<<endl;
    cout<<"[parallelX] cycles/term = "<<cycles/n<<endl<<endl;
  }
  
  {
    clk.tic();
    pi = ompfor(n,nthreads);
    cycles = clk.toc();
    cout<<"[ompfor] pi = "<<pi<<endl;
    cout<<"[ompfor] cycles/term = "<<cycles/n<<endl<<endl;
  }
  
  {
    int chunk = 1;
    clk.tic();
    pi = ompforchunk(n,nthreads, chunk);
    cycles = clk.toc();
    cout<<"[ompforchunk] pi = "<<pi<<endl;
    cout<<"[ompforchunk] cycles/term = "<<cycles/n<<endl<<endl;
  }
  {
    clk.tic();
    pi = parallelfor(n,nthreads);
    cycles = clk.toc();
    cout<<"[parallelfor] pi = "<<pi<<endl;
    cout<<"[parallelfor] cycles/term = "<<cycles/n<<endl<<endl;
  }
  {
    clk.tic();
    pi = section(n);
    cycles = clk.toc();
    cout<<"[section] pi = "<<pi<<endl;
    cout<<"[section] cycles/term = "<<cycles/n<<endl<<endl;
  }
}
