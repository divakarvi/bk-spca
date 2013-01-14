#include "TimeStamp.hh"
#include "StatVector.hh"
#include <iostream>

extern double leibsum(int n);
int main(){
  int count = 1000*100;
  StatVector stats(count);
  int n = 5;
  double ans;
  TimeStamp clk;
  for(int i=0; i < count; i++){
    clk.tic();
    ans = leibsum(n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  cout<<ans<<endl;
  char banner[200];
  sprintf(banner, "number of threads = %d ",10);
  stats.print(banner);
  cout<<"first 20: "<<endl;
   for(int i=0; i < 20; i++)
     cout<<stats(i,-1)<<endl;
   cout<<"worst 20: "<<endl;
   for(int i=1; i < 20; i++)
     cout<<stats(count-i)<<endl;
   double median = stats.median();
   int i = 1;
   while(stats(count-i)>1.1*median)
     i++;
   cout<<"fraction of trials greater than 10% of median = "<<(i-1.0)/count<<endl;
}
