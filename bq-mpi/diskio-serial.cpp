#include <fstream>
#include <iomanip>
#include <iostream>
#include <cstdlib>
#include "TimeStamp.hh"
using namespace std;

void write_easy(double *v, long len, const char *fname){
  ofstream ofile(fname);
  ofile<<scientific;
  ofile.precision(16);
  for(long i=0; i < len; i++)
    ofile<<v[i]<<endl;
  ofile.close();
}

void read_easy(double *v, long len, const char *fname){
  ifstream ifile(fname);
  for(long i=0; i < len; i++)
    ifile>>v[i];
}

void write_direct(double *v, long len, const char *fname){
  FILE *fptr;
  fptr = fopen(fname, "w");
  fwrite((void *)v, len, sizeof(double), fptr);
  fclose(fptr);
}

void read_direct(double *v, long len, const char *fname){
  FILE *fptr;
  fptr = fopen(fname, "r");
  fread((void *)v, len, sizeof(double), fptr);
  fclose(fptr);
}

int main(){
  double *v;
  long n = 1000l*1000*10;
  v = (double *)malloc(sizeof(double)*n*100);//*100 for later
  for(long i=0; i < n*100; i++)//*100 for later
    v[i] = i;
  char fname[200];
  TimeStamp clk;
  double cycles;
  
  sprintf(fname, "%s/easy.dat", getenv("SCRATCH"));
  clk.tic();
  write_easy(v, n, fname);
  cycles = clk.toc();
  cout<<"n = "<<n<<endl;
  cout<<"easy write b/w = "<<23.0*n/cycles<<" bytes/cycle"<<endl;
  clk.tic();
  read_easy(v, n, fname);
  cycles = clk.toc();
  cout<<"easy read b/w = "<<23.0*n/cycles<<" bytes/cycle"<<endl;
  double sum = 0;
  for(long i=0; i < n; i++)
    sum+=v[i];
  cout<<"error = "<<sum-1.0*(n-1)*n/2<<endl<<endl;

  n *= 100;
  cout<<"n = "<<n<<endl;
  sprintf(fname, "%s/direct.dat", getenv("SCRATCH"));
  clk.tic();
  write_direct(v, n, fname);
  cycles = clk.toc();
  cout<<"direct write b/w = "<<8.0*n/cycles<<" bytes/cycle"<<endl;
  read_direct(v, n, fname);
  cycles = clk.toc();
  cout<<"direct read b/w = "<<23.0*n/cycles<<" bytes/cycle"<<endl;
  sum = 0;
  for(long i=0; i < 10; i++)
    cout<<v[i]<<" "<<v[n/2+i]<<" "<<v[n+i-100]<<endl;
  for(long i=0; i < n; i++)
    sum+=v[i];
  cout<<"(rounding!) error = "<<sum-1.0*(n-1)*n/2<<endl<<endl;

  char cmd[200];
  sprintf(cmd,"ls -al %s", getenv("SCRATCH"));
  system(cmd);
}
