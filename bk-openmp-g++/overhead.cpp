#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
#include <omp.h>
#include "StatVector.hh"

using namespace std;
extern void parallelA(int nthreads, StatVector& stats);
extern void parallelB(int nthreads, StatVector& stats);
extern void dummy();



void output_alternating(int nthreads){
   int count = 5;
   cout<<"count = "<<2*count<<endl;
   StatVector stats(2*count);
   for(int i=0; i < count; i++){
     parallelA(nthreads, stats);
     parallelB(nthreads, stats);
   }
   char banner[200];
   sprintf(banner, "number of threads = %d ",nthreads);
   stats.print(banner);
   cout<<"first 10: "<<endl;
   for(int i=0; i < 10; i++)
     cout<<stats(i,-1)<<endl;
   cout<<"worst 10: "<<endl;
   for(int i=1; i <= 10; i++)
     cout<<stats(2*count-i)<<endl;
   double median = stats.median();
   int i = 1;
   while(stats(2*count-i)>1.1*median)
     i++;
   cout<<"fraction of trials greater than 10% of median = "
       <<(i-1.0)/count/2<<endl;
}

int main(){
  int nthreads = 3;
  cout<<"nthreads = "<<nthreads<<endl;
  output_alternating(nthreads);
}

