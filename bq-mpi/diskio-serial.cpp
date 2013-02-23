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

void v_init(double *v, long len){
  for(long i=0; i < len; i++){
    v[i] = (rand()*1.0/RAND_MAX-0.5)*2.0;
  }
}

double v_avg(double *v, long len){
  double avg = 0;
  for(long i=0; i < len; i++)
    avg += v[i];
  avg /= len;
  return avg;
}

struct BW_RW{
  double bw_read;
  double bw_write;
};

void time_diskio(const char *dir, long n, struct BW_RW& bw, int flag){
  const double CPUGHZ=3.33;
  TimeStamp clk;
  double cycles;
  double fac = (flag==0)?23.5:8.0;
  char fname[200];
  if(flag==0)
    sprintf(fname, "%s/easy.dat", dir);
  else
    sprintf(fname, "%s/direct.dat", dir);
  char cmd[200];
  sprintf(cmd, "rm %s", fname);
  system(cmd);
  double *v = new double[n];
  double *w = new double[n];
  v_init(v, n);
  clk.tic();
  if(flag==0)
    write_easy(v, n, fname);
  else
    write_direct(v, n, fname);
  cycles = clk.toc();
  bw.bw_write = fac*n/cycles*CPUGHZ;
  clk.tic();
  if(flag==0)
    read_easy(w, n, fname);
  else
    read_direct(w, n, fname);
  cycles = clk.toc();
  bw.bw_read = fac*n/cycles*CPUGHZ;
  double avgv = v_avg(v, n);
  double avgw = v_avg(v, n);
  cout<<"avgv/diff = "<<avgv<<"/"<<avgw-avgv<<endl;
  delete[] v;
  delete[] w;
}

void CreateOutputRW(){
  char dir[200];
  sprintf(dir, "%s/diskio-serial", getenv("SCRATCH"));
  char cmd[200];
  sprintf(cmd, "mkdir %s", dir);
  system(cmd);
  ofstream ofile;
  for(int flag=0; flag < 2; flag++){
    long nlist[3] = {1000l, 1000l*100, 1000l*100*100};
    if(flag!=0){
      nlist[1] *= 10;
      nlist[2] *= 100;
    }
    if(flag==0)
      ofile.open("OUTPUT/diskio-easy.txt", ios_base::app);
    else
      ofile.open("OUTPUT/diskio-direct.txt", ios_base::app);
    long posn = ofile.tellp();
    if(posn <= 0)
      ofile<<"\t"<<"n"<<"\t\t"<<"write b/w"<<"\t\t"<<"read b/w (GB/s)"<<endl;
    struct BW_RW bw;
    for(int i=0; i < 3; i++){
      time_diskio(dir, nlist[i], bw, flag);
      ofile<<"\t"<<(double)nlist[i]<<"\t\t"<<bw.bw_write
	   <<"\t\t"<<bw.bw_read<<endl;
    }
    ofile.close();
  }
  sprintf(cmd, "ls -l %s", dir);
  system(cmd);
  sprintf(cmd, "lfs getstripe %s/direct.dat", dir);
  system(cmd);
}



int main(){
  CreateOutputRW();
}
