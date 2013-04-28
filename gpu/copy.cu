#ifndef NUMTHREADS
#define NUMTHREADS 384
#endif
#define CLKSPD 1.147
#include <iostream>
#include <cassert>
#include <cstdlib>
using namespace std;
#include "dvhstmem.hh"
#include "hstTimer.hh"
#include "dvTimer.hh"


__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
copystride(double *list, int n, double *copy){
  int tid = threadIdx.x + blockIdx.x*blockDim.x;
  int stride = blockDim.x*gridDim.x;
  for(int i=tid; i < n; i = i + stride)
    copy[i] = list[i]; 
}


void runcopystride(long int n, int NUMBLOCKS){
  double *dcopy, *hcopy;
  dvhstmem<double> dhcopy(n);
  dcopy = dhcopy.device();
  hcopy = dhcopy.host();
  double *hlist, *dlist;
  dvhstmem<double> dhlist(n);
  hlist = dhlist.host();
  dlist = dhlist.device();
  for(int i=0; i < n; i++)
    hlist[i] = rand()*1.0/RAND_MAX-0.5;
  dhlist.host2device();
  double telapsed = 1e100;
  for(int i=0; i < 10; i++){
    hstTimer hclk;
    hclk.tic();  
    copystride<<<NUMBLOCKS, NUMTHREADS>>>(dlist, n, dcopy);
#ifdef DEBUG
    printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
    double tintvl=hclk.toc();
    cout.width(30);
    cout<<"tintvl = "<<tintvl<<endl;
    if(tintvl < telapsed)
      telapsed = tintvl;
  }
  
  dhcopy.device2host();
  double ans=0;
  for(int i=0; i < n; i++)
    ans += hcopy[i];
  cout.width(30);
  cout<<"List average = "<<ans/n<<endl;
  cout.width(30);
  cout<<"Time elapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"Bandwidth to memory = "<<2*n*8.0/(telapsed/1000)/(CLKSPD*1e9)<<" bytes/cycle"<<endl;
  cout.width(30);
  cout<<"Bandwidth to memory = "<<2*n*8.0/(telapsed/1000)/1e9<<" GB/s"<<endl;
}

int main(){
  int NUMBLOCKS = 56;
  int n = NUMTHREADS*NUMBLOCKS*4000;
  cout.width(30);
  cout<<"n = "<<n<<endl;
  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  runcopystride(n, NUMBLOCKS);
  cout<<endl<<endl;

  NUMBLOCKS = 56000;
  cout.width(30);
  cout<<"n = "<<n<<endl;
  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  runcopystride(n, NUMBLOCKS);
  cout<<endl<<endl;

}
