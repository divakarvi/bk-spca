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
