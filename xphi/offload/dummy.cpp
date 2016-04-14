#include "offl.hh"

__declspec(target(mic)) void dummy(double *v, long len){
	double x = _Offload_get_device_number();
#pragma omp parallel for
#pragma vector nontemporal(v)
	for(long i=0; i < len; i++){
		v[i] = x;
	}
}

__declspec(target(mic)) void dummyx(double *v, long len){
}
