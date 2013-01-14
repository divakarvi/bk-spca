#include <iostream>
#include "transpose.hh"
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;

void testall(){
  const int m = B*4;
  const int n = B*4;
  double a[m*n], b[m*n];
  for(int i=0; i < m; i++)
    for(int j=0; j < n; j++)
      a[i+j*m] = i+j*m;
  easytrans(a, b, m, n);
  for(int i=0; i < m*n; i++)
    cout<<b[i]<<" ";
  cout<<endl<<endl;
  
  blocktrans(b, a, n, m);
  for(int i=0; i < m*n; i++)
    cout<<a[i]<<" ";
  cout<<endl<<endl;

  blocktransx(a, b, m, n);
  for(int i=0; i < m*n; i++)
    cout<<b[i]<<" ";
  cout<<endl<<endl;

  recursivetrans(b, a, n, m);
  for(int i=0; i < m*n; i++)
    cout<<a[i]<<" ";
  cout<<endl<<endl;
  
  if(m==n){
    int nb = n/B;
    while(nb>1){
      if(nb%2==1) 
	return;
      nb = nb/2;
    }
    for(int i=0; i < m*n; i++)
      a[i] = -1;
    pow2trans(b, a, n);
    for(int i=0; i < m*n; i++)
      cout<<a[i]<<" ";
    cout<<endl<<endl;
  }
}

void testa(){
  cout<<"block size = "<<B<<endl;
  const int m = 20000;
  const int n = 30000;
  cout<<"m = "<<m<<endl;
  cout<<"n = "<<n<<endl;
  double a[m*n];
  double b[m*n];
  double c[m*n];
  for(long int i=0; i < m*n; i++)
    a[i] = i;
  blocktrans(a,b,m,n);
  recursivetrans(b,c,n,m);
  double err = 0;
  for(int i=0; i < m*n; i++)
    err += fabs(a[i]-c[i]);
  cout<<"err = "<<err<<endl;
}

void timea(){
  cout<<"block size = "<<B<<endl;
  const int m = 20000;
  const int n = 30000;
  cout<<"m = "<<m<<endl;
  cout<<"n = "<<n<<endl;
  double a[m*n];
  double b[m*n];
  for(long int i=0; i < m*n; i++)
    a[i] = i;
  const int count = 10;
  StatVector stats(count);
  TimeStamp clk;
  for(int i=0; i < count; i++){
    clk.tic();
    easytrans(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("easytrans");
  double cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();
  if(B==1)
    return;


  for(int i=0; i < count; i++){
    clk.tic();
    blocktrans(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("blocktrans");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

  for(int i=0; i < count; i++){
    clk.tic();
    blocktransx(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("blocktransx");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

  for(int i=0; i < count; i++){
    clk.tic();
    recursivetrans(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("recursivetrans");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

}

void timeb(){
  cout<<"block size = "<<B<<endl;
  int BB = B;
  while(BB>1){//check if B is a power of 2
    if(BB%2==1)
      return;
    else
      BB /= 2;
  }
  const int m = 1024*16;
  const int n = 1024*16;
  cout<<"m=n=2^14"<<endl;
  double a[m*n];
  double b[m*n];
  for(long int i=0; i < m*n; i++)
    a[i] = i;
  const int count = 10;
  StatVector stats(count);
  TimeStamp clk;
  for(int i=0; i < count; i++){
    clk.tic();
    easytrans(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("easytrans");
  double cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();
  
  for(int i=0; i < count; i++){
    clk.tic();
    blocktrans(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("blocktrans");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

  for(int i=0; i < count; i++){
    clk.tic();
    blocktransx(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("blocktransx");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

  for(int i=0; i < count; i++){
    clk.tic();
    recursivetrans(a, b, m, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("recursivetrans");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

  for(int i=0; i < count; i++){
    clk.tic();
    pow2trans(a, b, n);
    double cycles = clk.toc();
    stats.insert(cycles);
  }
  stats.print("pow2trans");
  cycles = stats.median();
  cout<<"bytes per cycle = "<<2.0*8*m*n/cycles<<endl;
  stats.flush();

}


int main(){
  //testall();
  //testa();
  timea();
  //timeb();
}
