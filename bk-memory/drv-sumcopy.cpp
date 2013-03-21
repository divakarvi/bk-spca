#include <iostream>
#include "TimeStamp.hh"
#include "StatVector.hh"
#include "sumcopy.hh"

using namespace std;

void testall(){
  const long int n = 10;
  double a[n], b[n];
  for(int i=0; i < n; i++)
    a[i] = i;
  cout<<"stride = 1, sum = "<<sum(a,n)<<endl;
  cout<<"stride = 3, sum = "<<sumstride(a,n,3)<<endl;
  cout<<"STR = "<<STR<<", sum = "<<sumconststride(a,n)<<endl<<endl;
  copy(a, b, n);
  for(int i=0; i < n; i++){
    cout<<b[i]<<" ";
    b[i] = -1;
  }
  cout<<endl<<endl;
  copyconststride(a, b, n);
  cout<<"const STR = "<<STR<<endl;
  for(int i=0; i < n; i++)
    cout<<b[i]<<" ";
  cout<<endl<<endl;
}

void time(){
  cout<<"const stride = "<<STR<<endl;

  const long int n = 1024*1024*1024;
  double a[n], b[n];
  const int count = 10;
  for(long  int i=0; i < n; i++)
    a[i] = 1.0*i;
  
  TimeStamp clk;
  StatVector stats(count);
  double cycles;
  if(STR==1){
    for(int i=0; i < count; i++){
      clk.tic();
      double s = sum(a,n);
      cycles = clk.toc();
      stats.insert(cycles);
    }
    stats.print("sum of list");
    cycles = stats.median();
    cout<<"bytes per cycle = "<<8.0*n/cycles<<endl<<endl;
    stats.flush();
  }
  
  int stride = STR;
  for(int i=0; i < count; i++){
    clk.tic();
    double s = sumstride(a,n,stride);
    cycles = clk.toc();
    stats.insert(cycles);
  }

  stats.print("sum of list with stride=STR");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<8.0*n/stride/cycles<<endl<<endl;
  stats.flush();

  for(int i=0; i < count; i++){
    clk.tic();
    double s = sumconststride(a,n);
    cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("sum of list with const stride");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<8.0*n/STR/cycles<<endl<<endl;
  stats.flush();

  if(STR==1){
    for(int i=0; i < count; i++){
      clk.tic();
      copy(a,b,n);
      cycles = clk.toc();
      stats.insert(cycles);
    }
    stats.print("copy list to list");
    cycles = stats.median();
    cout<<"bytes per cycle = "<<16.0*n/cycles<<endl<<endl;
    stats.flush();
  }
  
  for(int i=0; i < count; i++){
    clk.tic();
    copyconststride(a,b,n);
    cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("copy const stride list to list");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<16.0*n/STR/cycles<<endl<<endl;
  stats.flush();
}

int main(){
  //testall();
  time();
}
