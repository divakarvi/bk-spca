#include <unistd.h>
#include <pthread.h>
#include <iostream>
#include "StatVector.hh"
#include "TimeStamp.hh"
using namespace std;

void *addone(void *arg){
  long *p = (long *)(arg);
  *p += 1;
  return NULL;
}

void addone_list(long *list, int nthreads){
  pthread_t *plist = new pthread_t[nthreads-1];
  *list += 1;
  for(int i=0; i < nthreads-1; i++)
    pthread_create(plist+i, NULL, addone, (void *)(list+i+1));
  for(int i=0; i < nthreads-1; i++){
    void *result;
    pthread_join(plist[i], &result);
  }
  delete[] plist;
}

int main(){
  int nthreads = 3;
  cout<<"nthreads = "<<nthreads<<endl;
  long *list = new long[nthreads];
  for(int i=0; i < nthreads; i++)
    list[i] = 0;
  int count = 10;
  cout<<"count = "<<count<<endl;
  StatVector stats(count);
  TimeStamp clk;
  cout<<"First ten:"<<endl;
  for(int i=0; i < count; i++){
    clk.tic();
    addone_list(list, nthreads);
    double cycles=clk.toc();
    stats.insert(cycles);
    if(i < 10)
      cout<<cycles<<endl;
  }
  stats.print();
  cout<<endl<<"worst 10: "<<endl;
  for(int i=1; i <=10; i++)
    cout<<stats(count-i)<<endl;
}
