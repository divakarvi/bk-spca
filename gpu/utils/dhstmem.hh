#ifndef dhstmem24sept2014
#define dhstmem24sept2014
#include <cstdio>

template<class ttype> class dhstmem{
private:
	ttype *devicemem;
	ttype *hostmem;
	int n;
	cudaError_t errcode;
public:
	dhstmem(long int nin){
		n = nin;
		errcode = cudaMalloc((void **)&devicemem, n*sizeof(ttype));
		hostmem = new ttype[n];
	}
	~dhstmem(){
		delete[] hostmem;
		cudaFree(devicemem);
	}
	ttype *device(){return devicemem;}
	ttype *host(){return hostmem;}
	void device2host(){
		errcode = cudaMemcpy(hostmem, devicemem, 
			 n*sizeof(ttype),cudaMemcpyDeviceToHost);
	}
	void host2device(){
		errcode = cudaMemcpy(devicemem, hostmem, 
			 n*sizeof(ttype),cudaMemcpyHostToDevice);
	}
};
#endif

