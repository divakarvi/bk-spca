#ifndef hstTimer24sept2014
#define hstTimer24sept2014

class hstTimer{
private:
	cudaEvent_t start, stop;
public:
	hstTimer(){
		cudaEventCreate(&start);
		cudaEventCreate(&stop);
	}
	~hstTimer(){
		cudaEventDestroy(start);
		cudaEventDestroy(stop);
	}
	void tic(){
		cudaEventRecord(start, 0);
	}
	/*
	 * Returns time in milliseconds.
	 */
	float toc(){
		float time;
		cudaEventRecord(stop, 0);
		cudaEventSynchronize(start);
		cudaEventSynchronize(stop);
		cudaEventElapsedTime(&time, start, stop);
		return time;
	}
};

#endif

