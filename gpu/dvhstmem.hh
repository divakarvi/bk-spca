/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

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
