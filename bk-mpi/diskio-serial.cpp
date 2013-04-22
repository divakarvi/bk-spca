#include <fstream>
#include <iomanip>
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;

#define GEN_OUTPUT
const double CPUGHZ=3.33;//1.8 or 3.33 or 3.67

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
	if(getenv("SCRATCH")==NULL){
		printf("SCRATCH directory must be set\n");
		exit(-1);
	}
	sprintf(dir, "%s/diskio-serial", getenv("SCRATCH"));
	char cmd[200];
	sprintf(cmd, "mkdir %s", dir);
	system(cmd);
	for(int flag=0; flag < 2; flag++){
		long nlist[3] = {1000l, 1000l*100, 1000l*100*100};
		if(flag!=0){
			nlist[1] *= 10;
			nlist[2] *= 100;
		}
#ifdef GEN_OUTPUT
		ofstream ofile;
		FILE* unm = popen("uname -n", "r");
		char machine[200];
		fscanf(unm, "%s", machine);
		pclose(unm);
		char fname[200];
		if(flag==0){
			sprintf(fname, "OUTPUT/diskio-easy-%s.txt", machine);
			ofile.open(fname, ios_base::app);
		}
		else{
			sprintf(fname, "OUTPUT/diskio-direct-%s.txt", machine);
			ofile.open(fname, ios_base::app);
		}
		long posn = ofile.tellp();
		if(posn <= 0)
			ofile<<"\t"<<"n"<<"\t\t"
			     <<"write b/w"<<"\t\t"<<"read b/w (GB/s)"<<endl;
#endif 
		struct BW_RW bw;
		for(int i=0; i < 3; i++){
			time_diskio(dir, nlist[i], bw, flag);
#ifdef GEN_OUTPUT
			ofile<<"\t"<<(double)nlist[i]<<"\t\t"<<bw.bw_write
			     <<"\t\t"<<bw.bw_read<<endl;
#else
			cout<<"\t"<<(double)nlist[i]<<"\t\t"<<bw.bw_write
			     <<"\t\t"<<bw.bw_read<<endl;
#endif
			
		}
#ifdef GEN_OUTPUT
		ofile.close();
#endif
	}
	sprintf(cmd, "ls -l %s", dir);
	system(cmd);
	sprintf(cmd, "lfs getstripe %s/direct.dat", dir);
	system(cmd);//will work only on lutre file system
}

void latency2disk_init(const char *dir, long fszby8, int nfiles){
	double *list = new double[fszby8];
	for(long i=0; i < fszby8; i++)
		list[i] = i;
	for(int i=0; i < nfiles;i++){
		char fname[200];
		sprintf(fname, "%s/file%d.dat",dir,i);
		FILE *fptr;
		fptr = fopen(fname, "w");
		fwrite((void *)list, sizeof(double), fszby8, fptr);
		fclose(fptr);
	}
	delete[] list;
}

struct disk_latency{
	double fopen_cycles;
	double fseek_cycles;
	double fread_cycles;
	double fclose_cycles;
};

double latency2disk(const char *dir, int filenum, long posn,
		    struct disk_latency& lat){
	char fname[200];
	sprintf(fname, "%s/file%d.dat", dir, filenum);
	TimeStamp clk;
	FILE *fptr;
	clk.tic();
	fptr = fopen(fname,"r");
	lat.fopen_cycles = clk.toc();
	
	clk.tic();
	fseek(fptr,8l*posn,SEEK_SET);
	lat.fseek_cycles=clk.toc();
	
	double x;
	clk.tic();
	fread(&x,sizeof(double),1,fptr);
	lat.fread_cycles=clk.toc();
	
	clk.tic();
	fclose(fptr);
	lat.fclose_cycles = clk.toc();
	return x;
}

void latency2disk_finalize(const char *dir, int nfiles){
	for(int i=0; i < nfiles;i++){
		char cmd[200];
		sprintf(cmd, "rm %s/file%d.dat",dir,i);
		system(cmd);
	}
}

void CreateOutputLatency(){
	int nfiles[3]={100,10,1}; 
	long fszby8[3]={1000l*1000,1000l*1000*10,1000l*1000*1000};//change 1e9
	
	char dir[200];
	if(getenv("SCRATCH")==NULL){
		printf("SCRATCH directory must be set\n");
		exit(-1);
	}
	sprintf(dir, "%s/diskio-latency", getenv("SCRATCH"));
	char cmd[200];
	sprintf(cmd, "mkdir %s", dir);
	system(cmd);
	
#ifdef GEN_OUTPUT
	ofstream ofile;
	FILE* unm = popen("uname -n", "r");
	char machine[200];
	fscanf(unm, "%s", machine);
	pclose(unm);
	char fname[200];
	sprintf(fname, "OUTPUT/diskio-latency-%s.txt", machine);
	ofile.open(fname, ios_base::app);
	long posn = ofile.tellp();
	if(posn<=0){
		ofile<<"latency in milliseconds"<<endl;
		char s[200];
		sprintf(s, 
			"size\tnfiles\topen\t\tseek\t\tread\t\tclose");
		ofile<<s<<endl;
	}
#endif
	double error=0;
	for(int i=0; i < 3; i++){
		latency2disk_init(dir, fszby8[i], nfiles[i]);
		int ntrials = 1000;
		StatVector stato(ntrials), stats(ntrials), statr(ntrials),
			statc(ntrials);
		struct disk_latency dklat;
		for(int j=0; j < ntrials; j++){
			int filenum = rand()%nfiles[i];
			long posn = (rand()*1l*RAND_MAX+rand())%(fszby8[i]);
			if(posn < 0)//32 bit
				posn = rand()%fszby8[i];
			double x = latency2disk(dir, filenum, posn, dklat);
			error += fabs(x-posn);
			stato.insert(dklat.fopen_cycles);
			stats.insert(dklat.fseek_cycles);
			statr.insert(dklat.fread_cycles);
			statc.insert(dklat.fclose_cycles);
		}
		latency2disk_finalize(dir, nfiles[i]);
		char s[200];
		sprintf(s, "%.1e\t%.1e\t%.2e\t%.2e\t%.2e\t%.2e",
			fszby8[i]*8.0, nfiles[i]*1.0, 
			stato.median()/CPUGHZ*1e-6, 
			stats.median()/CPUGHZ*1e-6,
			statr.median()/CPUGHZ*1e-6,
			statc.median()/CPUGHZ*1e-6);
#ifdef GEN_OUTPUT
		ofile<<s<<endl;
#else
		cout<<s<<endl;
#endif
	}
#ifdef GEN_OUTPUT
	ofile.close();
#endif
	cout<<"error = "<<error<<endl;
}

int main(){
	cout<<"CPUGHZ = "<<CPUGHZ<<endl;
	CreateOutputRW();
	CreateOutputLatency();
}
