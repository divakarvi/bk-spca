#include "Fourier1D.hh"
#include "cVector.hh"
#include "TimeStamp.hh"
#include "StatVector.hh"
#include <omp.h>

void test(int n, int nthreads){
  int num = 1000;
  num = (num/nthreads)*nthreads;
  cVector avec(num*n), bvec(num*n), aavec(num*n);
  double *a = (double *)avec.getRawData();
  double *b = (double *)bvec.getRawData();
  double *aa = (double *)aavec.getRawData();
#pragma omp parallel for			\
  num_threads(nthreads)				\
  schedule(static)				\
  default(none)					\
  shared(n, num, a, b)
  for(int i=0; i < n*num; i++){
    a[i] = rand()*1.0/RAND_MAX-0.5;
    b[i] = 0.0;
  }
  assert(nthreads < 100);
  Fourier1Dmkl *mkllist[100]; //nthreads < 100
  Fourier1Dfftw *fftwlist[100]; 

#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(mkllist, fftwlist, n)
  {
    int tid = omp_get_thread_num();
    mkllist[tid] = new Fourier1Dmkl(n);
    fftwlist[tid] = new Fourier1Dfftw(n);
  }

  int count = 100;
  StatVector stats(count);
  for(int i=0; i < count; i++){
    TimeStamp clk;
    clk.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(a, b, n, num, fftwlist)
    {
      int tid = omp_get_thread_num();
      double *alocal = a+2*n*(num/nthreads)*tid;
      double *blocal = b+2*n*(num/nthreads)*tid;
      for(int i=0; i < num/nthreads; i++)
	  fftwlist[tid]->bwd(alocal+2*n*i, blocal+2*n*i);
    }
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print();

  for(int i=0; i < count; i++){
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(aa, b, n, num, mkllist)
    {
      int tid = omp_get_thread_num();
      double *alocal = aa+2*n*(num/nthreads)*tid;
      double *blocal = b+2*n*(num/nthreads)*tid;
      for(int i=0; i < num/nthreads; i++)
	  mkllist[tid]->fwd(blocal+2*n*i, alocal+2*n*i);
    }
  }
  
  double max = 0;
  for(int i=0; i < n*num; i++)
    if(fabs(a[i]-aa[i])>max)
      max = fabs(a[i]-aa[i]);
  
  cout<<"max = "<<max<<endl;
  
  for(int i=0; i < nthreads; i++){
    delete mkllist[i];
    delete fftwlist[i];
  }

}

void time(int n, int nthreads){
  int num = 1000*1000*1000/n;//num*n*16 = 16 GB
  num = (num/nthreads)*nthreads;
  cVector avec(num*n), bvec(num*n);
  double *a = (double *)avec.getRawData();
  double *b = (double *)bvec.getRawData();
#pragma omp parallel for			\
  num_threads(nthreads)				\
  schedule(static)				\
  default(none)					\
  shared(n, num, a, b)
  for(int i=0; i < n*num; i++){
    a[i] = 1.0;
    b[i] = 0.0;
  }
  
  assert(nthreads < 100);
  Fourier1Dmkl *mkllist[100]; //nthreads < 100
  Fourier1Dfftw *fftwlist[100]; 

#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(mkllist, fftwlist, n)
  {
    int tid = omp_get_thread_num();
    mkllist[tid] = new Fourier1Dmkl(n);
    fftwlist[tid] = new Fourier1Dfftw(n);
  }

  int count = 10;
  StatVector stats(count);
  for(int i=0; i < count; i++){
    TimeStamp clk;
    clk.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(a, b, n, num, fftwlist)
    {
      int tid = omp_get_thread_num();
      double *alocal = a+2*n*(num/nthreads)*tid;
      double *blocal = b+2*n*(num/nthreads)*tid;
      for(int i=0; i < num/nthreads; i++)
	fftwlist[tid]->bwd(alocal+2*n*i, blocal+2*n*i); 
    }
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print();
  double fftwcycles = stats.median();
  stats.flush();

  for(int i=0; i < count; i++){
    TimeStamp clk;
    clk.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(a, b, n, num, mkllist)
    {
      int tid = omp_get_thread_num();
      double *alocal = a+2*n*(num/nthreads)*tid;
      double *blocal = b+2*n*(num/nthreads)*tid;
      for(int i=0; i < num/nthreads; i++)
	mkllist[tid]->bwd(alocal+2*n*i, blocal+2*n*i); 
    }
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print();
  double mklcycles = stats.median();


  cout<<"n = "<<n<<endl;
  cout<<"total size = "<<16.0*n*num/1e9<<" GB"<<endl;
  cout<<"fftw cycles per transform = "<<fftwcycles/num<<endl;
  cout<<"mkl cycles per transform = "<<mklcycles/num<<endl;
  for(int i=0; i < nthreads; i++){
    delete mkllist[i];
    delete fftwlist[i];
  }
}

int main(){
  int n = 125;
  int nthreads[5] = {1,2,4,8,12};
  for(int  i=0; i < 5; i++){
    time(n, nthreads[i]);
    if(i<4)
      cout<<endl<<"-----------------------------------------------"<<endl;
  }

  cout<<endl<<endl<<"*******************************************"<<endl<<endl;

  n = 128;
  for(int  i=0; i < 5; i++){
    time(n, nthreads[i]);
    if(i<4)
      cout<<endl<<"-----------------------------------------------"<<endl;
  }

  n = 1024;
  for(int  i=0; i < 5; i++){
    time(n, nthreads[i]);
    if(i<4)
      cout<<endl<<"-----------------------------------------------"<<endl;
  }

  n = 1125;
  for(int  i=0; i < 5; i++){
    time(n, nthreads[i]);
    if(i<4)
      cout<<endl<<"-----------------------------------------------"<<endl;
  }

  n = 8192;
  for(int  i=0; i < 5; i++){
    time(n, nthreads[i]);
    if(i<4)
      cout<<endl<<"-----------------------------------------------"<<endl;
  }

  n = 10125;
  for(int  i=0; i < 5; i++){
    time(n, nthreads[i]);
    if(i<4)
      cout<<endl<<"-----------------------------------------------"<<endl;
  }
}
