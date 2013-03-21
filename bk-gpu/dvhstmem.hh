#include <cstdio>
template<class Ctype> class dvhstmem{
private:
  Ctype *devicemem;
  Ctype *hostmem;
  int n;
  cudaError_t errcode;
public:
  dvhstmem(long int nin){
    n = nin;
    errcode = cudaMalloc((void **)&devicemem, n*sizeof(Ctype));
#ifdef DEBUG
    printf("CUDA: %s\n", cudaGetErrorString(errcode));
#endif
    hostmem = new Ctype[n];
  }
  ~dvhstmem(){
    delete[] hostmem;
    cudaFree(devicemem);
  }
  Ctype *device(){return devicemem;}
  Ctype *host(){return hostmem;}
  void device2host(){
    errcode = cudaMemcpy(hostmem, devicemem, 
			 n*sizeof(Ctype),cudaMemcpyDeviceToHost);
#ifdef DEBUG
    printf("CUDA: %s\n", cudaGetErrorString(errcode));
#endif
  }
  void host2device(){
    errcode = cudaMemcpy(devicemem, hostmem, 
			 n*sizeof(Ctype),cudaMemcpyHostToDevice);
#ifdef DEBUG
    printf("CUDA: %s\n", cudaGetErrorString(errcode));
#endif
  }
};
