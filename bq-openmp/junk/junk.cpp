int main(int argc, char **argv){
  if(argc < 4){
    cout<<"usage: "<<argv[0]<<" nthreads countinner countouter"<<endl;
    return -1;
  }
  for(int i=0; i < argc; i++)
    cout<<argv[i]<<" ";
  cout<<endl;
  
  int nthreads = atoi(*++argv);
  int countinner = atoi(*++argv);
  int countouter = atoi(*++argv);
  double overhead;

  overhead = parallel_overhead(nthreads, countinner, countouter);
  cout<<"parallel overhead = "<<overhead<<endl;

  overhead = barrier_overhead(nthreads, countinner);
  cout<<"barrier overhead = "<<overhead<<endl;

  overhead = ompfor_overhead(nthreads, countinner, countouter);
  cout<<"omp for overhead = "<<overhead<<endl;

  overhead = ompfornowait_overhead(nthreads, countinner, countouter);
  cout<<"omp for nowait overhead = "<<overhead<<endl;

  overhead = ompfordynamic_overhead(nthreads, countinner, countouter);
  cout<<"omp for dynamic overhead = "<<overhead<<endl;
  
}




//R must be "%xmmi" 0<=i<=15
#define zeroxmm(R)				\
  asm volatile("xorps %" R ", %" R "\n\t":::R);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define addxmm(R1, R2)					\
  asm volatile("addpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define loadxmm(a, R)					\
  asm volatile("movaps %0, %" R "\n\t"::"m"(*(a)):R);	

//R = "%xmmi" 0<=i<=15xmm
//a = double * (16 byte aligned)
#define storexmm(R, a)					\
  asm volatile("movaps %" R ", %0 \n\t":"=m"(*(a))::R);	

double sum_onecore(double *list, long int n){
  assert(n%8==0);
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3");
  for(long int i=0; i < n; i = i+8){
    loadxmm(list+i, "%xmm4");
    addxmm("%xmm4", "%xmm0");
    loadxmm(list+i+2,"%xmm5");
    addxmm("%xmm5", "%xmm1");
    loadxmm(list+i+4, "%xmm6");
    addxmm("%xmm6", "%xmm2");
    loadxmm(list+i+6, "%xmm7");
    addxmm("%xmm7", "%xmm3");
  }
  __declspec(align(16)) double s[8];
  storexmm("%xmm0", s);
  storexmm("%xmm1", s+2);
  storexmm("%xmm2", s+4);
  storexmm("%xmm3", s+6);
  return s[0]+s[1]+s[2]+s[3]+s[4]+s[5]+s[6]+s[7];
}

double sum_onecore_stride(double *list, long int n, int stride){
  assert(n%8==0);
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3"); 
  for(long int i=0; i < n; i = i+8*stride){
      loadxmm(list+i, "%xmm4");
      addxmm("%xmm4", "%xmm0");
      loadxmm(list+i+2,"%xmm5");
      addxmm("%xmm5", "%xmm1");
      loadxmm(list+i+4, "%xmm6");
      addxmm("%xmm6", "%xmm2");
      loadxmm(list+i+6, "%xmm7");
      addxmm("%xmm7", "%xmm3");
  }
  __declspec(align(16)) double s[8];
  storexmm("%xmm0", s);
  storexmm("%xmm1", s+2);
  storexmm("%xmm2", s+4);
  storexmm("%xmm3", s+6);
  return s[0]+s[1]+s[2]+s[3]+s[4]+s[5]+s[6]+s[7];
}


//bandwidth in bytes per cycle
void bw_onecore(long int n){
  double *list = (double *)MKL_malloc(n*sizeof(double), 4096);
  for(long int i=0; i < n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  for(long int i=0; i < n; i++)
    _mm_clflush(list+i);
  TimeStamp clk;
  clk.tic();
  double sum = sum_onecore(list, n);
  double cycles = clk.toc();
  cout<<"avg of sum = "<<sum/n<<" expected near "<<0.5<<endl;
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}


//bandwidth in bytes per0cycle
//blksize is cache line size units
void bw_onecore_stride(long int n, int stride){
  double *list = (double *)MKL_malloc(stride*n*sizeof(double), 4096);
  for(long int i=0; i < stride*n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  for(long int i=0; i < stride*n; i++)
    _mm_clflush(list+i);
  TimeStamp clk;
  clk.tic();
  double sum = sum_onecore_stride(list, stride*n, stride);
  double cycles = clk.toc();
  cout<<"avg of sum = "<<sum/n<<" expected near "<<0.5<<endl;
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}

void bw_twocore_numa(long int n){
  double *glist = (double *)MKL_malloc(2*n*sizeof(double), 4096);
#pragma omp parallel\
  num_threads(2)    \
  default(none)	    \
  shared(n, cout, glist)
  {
    int tid = omp_get_thread_num();
    double *list = glist+tid*n;
    for(long int i=0; i < n; i++)
      list[i] = 2.0*(tid+1)*rand()/RAND_MAX;
    for(long int i=0; i < n; i++)
      _mm_clflush(list+i);
  #pragma omp barrier
    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore(list, n);
  #pragma omp barrier
  #pragma omp critical
      {
	double cycles = clk.toc();
	cout<<"tid = "<<tid<<" bandwidth = "<<
	  2.0*n*8.0/cycles<<" bytes/cycle"<<" ";
	cout<<"avg of sum-1 = "<<sum/n-1<<endl;
      }
  }
  MKL_free(glist);
}


//with 2*m cores
void bw_evencore_numa_block(long int n, int m){
  double *glist = (double *)MKL_malloc(2*m*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(2*m)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist + (tid%2)*m*n;
    list = list + n*(tid/2);
    int stride = m;
    for(long int i=0; i < n; i=i++)
	list[i] = 2.0*(tid+1)*rand()/RAND_MAX;
    for(long int i=0; i < n; i++)
	_mm_clflush(list+i);
  #pragma omp barrier

    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore(list, n);
  #pragma omp barrier
  #pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"tid = "<<tid<<" bandwidth = "<<
	2.0*m*n*8.0/cycles<<" bytes/cycle"<<" ";
      cout<<"avg of sum = "<<sum/n-1<<endl;
    }
  }
  MKL_free(glist);
}


void evencore(long int n, int m){
  double *list = (double *)MKL_malloc(2*m*n*sizeof(double),16);
  double sum = 0;
  for(int i=0; i < 2*m*n; i++)
    list[i] = rand()*1.0/RAND_MAX;
#pragma omp parallel				\
  num_threads(2*m)				\
  default(none)					\
  shared(n, list, cout, sum)
  {
    int tid = omp_get_thread_num();
  #pragma omp barrier
    TimeStamp clk;
    clk.tic();
  #pragma omp barrier
  #pragma omp for				\
    schedule(static)				\
    reduction(+:sum)
    for(long int i=0; i < 2*m*n; i++)
      sum += list[i];
  #pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"tid = "<<tid<<" bandwidth = "<<
	2.0*m*n*8.0/cycles<<" bytes/cycle"<<" ";
      cout<<"avg of sum = "<<sum/2/m/n<<endl;
    }
  }
  MKL_free(list);
}

int main(int argc, char** argv){
  if(argc < 2){
    cout<<"Usage: "<<argv[0]<<" nthreads"<<endl;
    return -1;
  }
  int ncore = atoi(*++argv);
  long int n = 4096*1024*3*3*2;
  switch(ncore){
  case 1:
    cout<<"bw_onecore()"<<endl;
    bw_onecore(n);
    cout<<"bw_onecore_stride(n,2)"<<endl;
    bw_onecore_stride(n,2);
    cout<<"bw_onecore_stride(n,3)"<<endl;
    bw_onecore_stride(n,3);
    break;
  case 2:
    cout<<"bw_twocore_numa()"<<endl;
    bw_twocore_numa(n);
    cout<<"bw_evencore_numa_block(n,1)"<<endl;
    bw_evencore_numa_block(n,1);
    break;
  case 4:
    cout<<"bw_evencore_numa_block(n,2)"<<endl;
    bw_evencore_numa_block(n,2);
    break;
  case 6:
    cout<<"bw_evencore_numa_block(n,3)"<<endl;
    bw_evencore_numa_block(n,3);
    break;
  case 8:
    cout<<"bw_evencore_numa_block(n,4)"<<endl;
    bw_evencore_numa_block(n,4);
    break;
  case 10:
    cout<<"bw_evencore_numa_block(n,5)"<<endl;
    bw_evencore_numa_block(n,5);
    break;
  case 12:
    cout<<"bw_evencore_numa_block(n, 6)"<<endl;
    bw_evencore_numa_block(n,6);
    break;
  }
  
  switch(ncore){
  case 2:
    cout<<"evencore(n,1)"<<endl;
    evencore(n,1);
    break;
  case 4:
    cout<<"evencore(n,2)"<<endl;
    evencore(n,2);
    break;
  case 6:
    cout<<"evencore(n,3)"<<endl;
    evencore(n,3);
    break;
  case 8:
    cout<<"evencore(n,4)"<<endl;
    evencore(n,4);
    break;
  case 10:
    cout<<"evencore(n,5)"<<endl;
    evencore(n,5);
    break;
  case 12:
    cout<<"evencore(n,6)"<<endl;
    evencore(n,6);
    break;
  }
}

double parallel(int nthreads, long int countinner, long int countouter){
  TimeStamp clk;
  clk.tic();
  StatVector stats(countouter);
  for(long int j=0; j < countouter; j++){
    TimeStamp clkx;
    clkx.tic();
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(countinner)
    {
      long int zero = 0;
      loadrax(&zero);      
      for(long int i=0; i < countinner; i++)
	incrax;
    }
    stats.insert(clkx.toc());
  }
  stats.print("parallel overhead");
  double cycles = clk.toc();
  return cycles;
}


double serial(long int countinner, long int countouter){
  long int zero=0;
  loadrax(&zero);
  TimeStamp clk;
  clk.tic();
  for(long int j=0; j < countouter; j++){
    for(long int i=0; i < countinner; i++)
      incrax;
  }
  double cycles = clk.toc();
  return cycles;
}


double parallel_overhead(int nthreads, 
			 long int countinner, long int countouter){
  double pcycles = parallel(nthreads, countinner, countouter);
  double scycles = serial(countinner, countouter);
  return (pcycles - scycles)/countouter;
}

void output_parallel(){
  int nthreads[] = {1,2,4,6,8,10,12};
  int nnum = 7;
  int countinner = 1000;
  int countouter[] = {1, 10, 1000, 1000*1000, 1000*1000*1000}; 
  int cnum = 5;
  for(int i=0; i < nnum; i++){
    for(int j=0; j < cnum; j++){
      cout<<"nthreads = "<<nthreads[i]<<endl;
      cout<<"count = "<<countouter[j]<<endl;
      double overhead = parallel_overhead(nthreads[i],
	countinner, countouter[j]);
      cout<<"parallel overhead = "<<overhead<<endl<<endl; 
    }
    cout<<endl<<endl<<endl;
    }
}

double sum_onecore_blk_stride(double *list, long int n,
			      int blksize, int stride){
  assert(n%24==0);
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3"); 
  for(long int i=0; i < n; i = i+8*blksize*stride){
    for(int j=0; j < blksize; j++){
      loadxmm(list+i+8*j, "%xmm4");
      addxmm("%xmm4", "%xmm0");
      loadxmm(list+i+2+8*j,"%xmm5");
      addxmm("%xmm5", "%xmm1");
      loadxmm(list+i+4+8*j, "%xmm6");
      addxmm("%xmm6", "%xmm2");
      loadxmm(list+i+6+8*j, "%xmm7");
      addxmm("%xmm7", "%xmm3");
    }
  }
  __declspec(align(16)) double s[8];
  storexmm("%xmm0", s);
  storexmm("%xmm1", s+2);
  storexmm("%xmm2", s+4);
  storexmm("%xmm3", s+6);
  return s[0]+s[1]+s[2]+s[3]+s[4]+s[5]+s[6]+s[7];
}

void bw_twocore_nonnuma_interleave(long int n){
  double *list = (double *)MKL_malloc(2*n*sizeof(double), 4096);
  for(long int i=0; i < 2*n; i++){
    list[i] = 2.0*rand()/RAND_MAX;
    if((i/8)%2==1)
      list[i]*=2;
  }
  for(long int i=0; i < 2*n; i++)
    _mm_clflush(list+i);
#pragma omp parallel\
  num_threads(2)\
  default(none)\
  shared(n, cout, list)
  {
    int tid = omp_get_thread_num();
  #pragma omp barrier
    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore_stride(list+8*tid, 2*n, 2);
  #pragma omp barrier
  #pragma omp critical
      {
	double cycles = clk.toc();
	cout<<"tid = "<<tid<<" bandwidth = "<<
	  2.0*n*8.0/cycles<<" bytes/cycle"<<" ";
	cout<<"avg of sum - 1 = "<<sum/n-1<<endl;
      }
  }
  MKL_free(list);
}

void bw_twocore_nonnuma_block(long int n){
  double *list = (double *)MKL_malloc(2*n*sizeof(double), 4096);
  for(long int i=0; i < n; i++){
    list[i] = 2.0*rand()/RAND_MAX;
    list[i+n] = 2.0*2*rand()/RAND_MAX;
  }
  for(long int i=0; i < 2*n; i++)
    _mm_clflush(list+i);
#pragma omp parallel\
  num_threads(2)\
  default(none)\
  shared(n, cout, list)
  {
    int tid = omp_get_thread_num();
  #pragma omp barrier
    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore(list+n*tid, n);
  #pragma omp barrier
  #pragma omp critical
      {
	double cycles = clk.toc();
	cout<<"tid = "<<tid<<" bandwidth = "<<
	  2.0*n*8.0/cycles<<" bytes/cycle"<<" ";
	cout<<"avg of sum - 1 = "<<sum/n-1<<endl;
      }
  }
  MKL_free(list);
}

//with 2*m cores
void bw_evencore_numa_interleave(long int n, int m){
  double *glist = (double *)MKL_malloc(2*m*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(2*m)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist+(tid%2)*m*n;
    int offset = tid/2;
    list = list+8*offset;
    int stride = m;
    for(long int i=0; i < m*n; i=i+8*stride){
      for(int j=0; j < 8; j++)
	list[i+j] = 2.0*(tid+1)*rand()/RAND_MAX;
    }
    for(long int i=0; i < n; i=i+8*stride){
      for(int j=0; j < 8; j++)
	_mm_clflush(list+i+j);
    }
  #pragma omp barrier

    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore_stride(list, m*n, stride);
  #pragma omp barrier
  #pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"tid = "<<tid<<" bandwidth = "<<
	2.0*m*n*8.0/cycles<<" bytes/cycle"<<" ";
      cout<<"avg of sum = "<<sum/n-1<<endl;
    }
  }
  MKL_free(glist);
}

  //cout<<"bw_onestride()"<<endl;
  //bw_onecore_stride(n,1);

  //cout<<"bw_evencore_numa_interleave(n,1)"<<endl;
  //bw_evencore_numa_interleave(n,1);

  //cout<<"bw_evencore_numa_interleave(n,2)"<<endl;
  //bw_evencore_numa_interleave(n,2);

  //cout<<"bw_evencore_numa_interleave(n,3)"<<endl;
  //bw_evencore_numa_interleave(n,3);

  //cout<<"bw_evencore_numa_interleave(n,4)"<<endl;
  //bw_evencore_numa_interleave(n,4);

  //cout<<"bw_evencore_numa_interleave(n,5)"<<endl;
  //bw_evencore_numa_interleave(n,5);
  

  //cout<<"bw_evencore_numa_interleave(n,6)"<<endl;
  //bw_evencore_numa_interleave(n,6);

  //cout<<"bw_twocore_nonnuma_interleave()"<<endl;
  //bw_twocore_nonnuma_interleave(n);
  
  //cout<<"bw_twocore_nonuma_block()"<<endl;
  //bw_twocore_nonnuma_block(n);
  
#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <mkl.h>
#include <omp.h>
using namespace std;

//R must be "%xmmi" 0<=i<=15
#define zeroxmm(R)				\
  asm volatile("xorps %" R ", %" R "\n\t":::R);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define addxmm(R1, R2)					\
  asm volatile("addpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define loadxmm(a, R)					\
  asm volatile("movaps %0, %" R "\n\t"::"m"(*(a)):R);	

//R = "%xmmi" 0<=i<=15xmm
//a = double * (16 byte aligned)
#define storexmm(R, a)					\
  asm volatile("movntpd %" R ", %0 \n\t":"=m"(*(a))::R);	

void onecore(double *list, long int n){
  assert(n%8==0);
  zeroxmm("%xmm0");
  for(long int i=0; i < n; i = i+8){
    storexmm("%xmm4", list+i);
    storexmm("%xmm5", list+i+2);
    storexmm("%xmm6", list+i+4);
    storexmm("%xmm7", list+i+6);
  }
}

void onecore_stride(double *list, long int n, int stride){
  assert(n%8==0);
  zeroxmm("%xmm0");
  for(long int i=0; i < n; i = i+8*stride){
    storexmm("%xmm4", list+i);
    storexmm("%xmm5", list+i+2);
    storexmm("%xmm6", list+i+4);
    storexmm("%xmm7", list+i+6);
  }
}

//bandwidth in bytes per cycle
void bw_onecore(long int n){
  double *list = (double *)MKL_malloc(n*sizeof(double), 4096);
  for(long int i=0; i < n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  for(long int i=0; i < n; i++)
    _mm_clflush(list+i);
  TimeStamp clk;
  clk.tic();
  onecore(list, n);
  double cycles = clk.toc();
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}


//bandwidth in bytes per0cycle
//blksize is cache line size units
void bw_onecore_stride(long int n, int stride){
  double *list = (double *)MKL_malloc(stride*n*sizeof(double), 4096);
  for(long int i=0; i < stride*n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  for(long int i=0; i < stride*n; i++)
    _mm_clflush(list+i);
  TimeStamp clk;
  clk.tic();
  onecore_stride(list, stride*n, stride);
  double cycles = clk.toc();
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}

//with 2*m cores
void bw_evencore_numa_block(long int n, int m){
  double *glist = (double *)MKL_malloc(2*m*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(2*m)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist + (tid%2)*m*n;
    list = list + n*(tid/2);
    int stride = m;
    for(long int i=0; i < n; i=i++)
	list[i] = 2.0*(tid+1)*rand()/RAND_MAX;
    for(long int i=0; i < n; i++)
	_mm_clflush(list+i);
  #pragma omp barrier

    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    onecore(list, n);
  #pragma omp barrier
  #pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"tid = "<<tid<<" bandwidth = "<<
	2.0*m*n*8.0/cycles<<" bytes/cycle"<<endl;
    }
  }
  MKL_free(glist);
}

int main(int argc, char** argv){
  if(argc < 2){
    cout<<"Usage: "<<argv[0]<<" nthreads"<<endl;
    return -1;
  }
  int ncore = atoi(*++argv);
  long int n = 4096*1024*3*3*2;
  switch(ncore){
  case 1:
    cout<<"bw_onecore()"<<endl;
    bw_onecore(n);
    cout<<"bw_onecore_stride(n,2)"<<endl;
    bw_onecore_stride(n,2);
    cout<<"bw_onecore_stride(n,3)"<<endl;
    bw_onecore_stride(n,3);
    break;
  case 2:
    cout<<"bw_evencore_numa_block(n,1)"<<endl;
    bw_evencore_numa_block(n,1);
    break;
  case 4:
    cout<<"bw_evencore_numa_block(n,2)"<<endl;
    bw_evencore_numa_block(n,2);
    break;
  case 6:
    cout<<"bw_evencore_numa_block(n,3)"<<endl;
    bw_evencore_numa_block(n,3);
    break;
  case 8:
    cout<<"bw_evencore_numa_block(n,4)"<<endl;
    bw_evencore_numa_block(n,4);
    break;
  case 10:
    cout<<"bw_evencore_numa_block(n,5)"<<endl;
    bw_evencore_numa_block(n,5);
    break;
  case 12:
    cout<<"bw_evencore_numa_block(n, 6)"<<endl;
    bw_evencore_numa_block(n,6);
    break;
  }
  
}

//bandwidth in bytes per cycle
void sum_onecore(){
  int n = LEN;//LEN=1000*1000*100
  double *list = (double *)MKL_malloc(1l*n*sizeof(double), 4096);
  for(long int i=0; i < n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  TimeStamp clk;
  clk.tic();
  double sum = sum_onecore(list);
  double cycles = clk.toc();
  cout<<"avg of sum = "<<sum/n<<" expected near "<<0.5<<endl;
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}

void sum_twocore(){
  int n = LEN;//LEN=1000*1000*100
  double *glist = (double *)MKL_malloc(2l*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(2)				\
  default(none)					\
  shared(n, cout, glist)
  {
    int tid = omp_get_thread_num();
    double *list = glist+tid*n;
    for(long int i=0; i < n; i++)
      list[i] = 1.0*(tid+1);
#pragma omp barrier
    TimeStamp clk;
    clk.tic();
#pragma omp barrier 
    double sum=sum_onecore(list);
#pragma omp barrier
#pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"read bandwidth = "<<
	2.0*n*8.0/cycles<<" bytes/cycle"<<endl;
    }
  }
}

for(int i=0; i < nthreads; i++){
#pragma omp barrier
  if(tnum==i)
    cout<<"tnum, nfst, nlst = "<<tnum<<" "<<nfst<<" "<<nlst<<endl;
 }
  

    int tnum = omp_get_thread_num();
    int nn = n/nthreads;
    int r = n - nn*nthreads;
    int nfst = nn*tnum;
    if(tnum < r)
      nfst = nfst+tnum;
    else
      nfst = nfst+r;
    int nlst;
    if(tnum < r)
      nlst = nfst+nn+1;
    else
      nlst = nfst+nn;

const int NTHREADS=4;
extern double leibsum(int n);

#include "leibnizp.hh"
#include "TimeStamp.hh"
#include "StatVector.hh"
#include <iostream>
#include <fstream>


int main(){
  int count = 1000*1000;
  ofstream ofile("leibnizp.txt", ios_base::app);
  StatVector stats(count);
  int n = 5;
  double ans;
  TimeStamp clk;
  for(int i=0; i < count; i++){
    clk.tic();
    ans = leibsum(n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  ofile<<ans<<endl;
  char banner[200];
  sprintf(banner, "number of threads = %d ",NTHREADS);
  stats.print(banner);
  cout<<banner<<endl;
  ofile<<setw(10)<<"max: "<<stats.max()<<endl;
  ofile<<setw(10)<<"mean: "<<stats.mean()<<endl;
  ofile<<setw(10)<<"median: "<<stats.median()<<endl;
  ofile<<setw(10)<<"min: "<<stats.min()<<endl;
  ofile<<"first 20: "<<endl;
   for(int i=0; i < 20; i++)
     ofile<<stats(i,-1)<<endl;
   ofile<<"worst 20: "<<endl;
   for(int i=1; i < 20; i++)
     ofile<<stats(count-i)<<endl;
   double median = stats.median();
   int i = 1;
   while(stats(count-i)>1.1*median)
     i++;
   ofile<<"fraction of trials greater than 10% of median = "<<(i-1.0)/count<<endl<<endl;
   ofile.close();
}

