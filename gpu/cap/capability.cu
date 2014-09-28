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

#include <iostream>
using namespace std;

int main(){
	int count;
	cudaGetDeviceCount(&count);
	cout.width(45);
	cout<<"Device Count: "<<count<<endl;
	for(int i=0; i < count; i++){
		cudaDeviceProp prop;
		cudaGetDeviceProperties(&prop, i);
		cout.width(45);
		cout<<"Device Name: "<<prop.name<<endl;
		cout.width(45);
		cout<<"Clock rate in GHz: "<<prop.clockRate*1.0/1000/1000<<endl;
		cout.width(45);
		cout<<"Major revision number: "<<prop.major<<endl;
		cout.width(45);
		cout<<"Minor revision number: "<<prop.minor<<endl;
		cout.width(45);
		cout<<"Global memory in GB: "
		    <<prop.totalGlobalMem*1.0/1000/1000/1000<<endl;
		cout.width(45);
		cout<<"Total L2 cache (in bytes): "
		    <<prop.l2CacheSize<<endl;
		cout.width(45);
		cout<<"Shared memory per SM (in bytes): "
		    <<prop.sharedMemPerBlock<<endl;
		cout.width(45);
		cout<<"Number of registers per SM: "<<prop.regsPerBlock<<endl;
		cout.width(45);
		cout<<"Max number of threads per SM: "
		    <<prop.maxThreadsPerMultiProcessor<<endl;
		cout.width(45);
		cout<<"Number of threads per warp: "<<prop.warpSize<<endl;
		cout.width(45);
		cout<<"Maximum number of threads per block: "
		    <<prop.maxThreadsPerBlock<<endl;
		cout.width(45);
		cout<<"Maximum of each dimension of block: "
		    <<prop.maxThreadsDim[0]<<" x "
		    <<prop.maxThreadsDim[1]<<" x "<<prop.maxThreadsDim[2]<<endl;
		cout.width(45);
		cout<<"Maximum of each dimension of grid: "
		    <<prop.maxGridSize[0]<<" x "
		    <<prop.maxGridSize[1]<<" x "<<prop.maxGridSize[1]<<endl;
		cout.width(45);
		cout<<"Overlap: ";
		cout<<((prop.deviceOverlap)?"enabled":"disabled")<<endl;
	}
}
