#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "serial.hh"
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdlib>

#define GEN_OUTPUT
const double CPUGHZ=2.2;//i3-4350

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
#ifdef DCACHE_FLUSH
	if(flag != 0){
		bw.bw_write *= FLUSH_COUNT;
		bw.bw_read  *= FLUSH_COUNT;
	}
#endif
	double avgv = v_avg(v, n);
	double avgw = v_avg(w, n); /* previously undetected bug here */
	assrt(avgv == avgw);
	delete[] v;
	delete[] w;
}

void bw_readwrite(){
	char dir[200];
	if(getenv("SCRATCH")==NULL){
		printf("SCRATCH directory must be set\n");
		exit(-1);
	}
	sprintf(dir, "%s/diskio-serial", getenv("SCRATCH"));
	char cmd[200];
	sprintf(cmd, "mkdir %s", dir);
	system(cmd);
	for(int flag=0; flag <= 1; flag++){
		long nlist[3];
		if(flag==0){
			nlist[0] = 250;
			nlist[1] = 250*100;
			nlist[2] = 125*1000*10;
		}
		else{
			nlist[0] = 250;
			nlist[1] = 125*1000*40;
			nlist[2] = 1250*1000*1000;
		}
#ifdef GEN_OUTPUT
		std::ofstream ofile;
		FILE* unm = popen("uname -n", "r");
		char machine[200];
		fscanf(unm, "%s", machine);
		pclose(unm);
		char fname[200];
		if(flag==0){
			sprintf(fname, "output/diskio-easy-%s.txt", machine);
			ofile.open(fname, std::ios::app);
		}
		else{
			sprintf(fname, "output/diskio-direct-%s.txt", machine);
			ofile.open(fname, std::ios::app);
		}
		long posn = ofile.tellp();
		if(posn <= 0)
			ofile<<"\t"<<"n"<<"\t\t"
			     <<"write b/w"<<"\t\t"
			     <<"read b/w (GB/s)"
			     <<std::endl;
#endif 
		struct BW_RW bw;
		for(int i=0; i < 3; i++){
			time_diskio(dir, nlist[i], bw, flag);
#ifdef GEN_OUTPUT
			std::ostream &ofref(ofile);
#else 
			std::ostream &ofref(std::cout);
#endif
			ofref<<std::endl
			     <<"FLUSH_COUNT = "<<FLUSH_COUNT
			     <<std::endl;
			ofref<<"\t"<<(double)nlist[i]
			     <<"\t\t"<<bw.bw_write
			     <<"\t\t"<<bw.bw_read<<std::endl;
			
		}
#ifdef GEN_OUTPUT
		ofile.close();
#endif
	}
	sprintf(cmd, "ls -l %s", dir);
	system(cmd);
}

int main(){
        printf("CPUGHZ = %f\n", CPUGHZ);
	bw_readwrite();
}

