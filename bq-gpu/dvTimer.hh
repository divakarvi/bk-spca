//this must be reading the special register %clock
//that is a 32 bit register that wraps around!
//so this timer is mostly useless
class dvTimer{
private:
  clock_t start;
public:
  __device__ dvTimer(){start = clock();}
  __device__ void tic(){start = clock();}
  __device__ double toc(){
    double ans = clock()-start;
    return ans;
  }
};
