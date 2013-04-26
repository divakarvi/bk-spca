#include <mpi.h>
#include <cstdio>
#include <cstdlib>
#include "TimeStamp.hh"
#include "StatVector.hh"
#include <iostream>
#include <fstream>
using namespace std;

const double CPUGHZ=3.33;

void mpi_initialize(int& rank, int& nprocs){
	MPI_Init(NULL, NULL);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}


void write_mpi(void *data, long len, 
	       char *fname, long disp){
	MPI_File ofile;
	MPI_File_open(MPI_COMM_WORLD, 
		      fname, 
		      MPI_MODE_CREATE|MPI_MODE_WRONLY,
		      MPI_INFO_NULL,
		      &ofile);
	char datarep[200];
	sprintf(datarep, "native");
	MPI_File_set_view(ofile, 
			  disp, 
			  MPI_BYTE,
			  MPI_BYTE,
			  datarep,
			  MPI_INFO_NULL);
	long displacement = 0;
	int maxcount = 2000*1000*1000;
	while(len > 0){
		int count = (len<maxcount)?len:maxcount;
		MPI_File_write_at(ofile,
				      displacement,
				      data,
				      count,
				      MPI_BYTE,
				      MPI_STATUS_IGNORE);
		displacement += count;
		data = ((char *)data+count);
		len -= count;
	}
	MPI_File_close(&ofile);
}

void read_mpi(void *data, long len, 
	      char *fname, long disp){
	MPI_File ifile;
	MPI_File_open(MPI_COMM_WORLD, 
		      fname, 
		      MPI_MODE_RDONLY,
		      MPI_INFO_NULL,
		      &ifile);
	char datarep[200];
	sprintf(datarep, "native");
	MPI_File_set_view(ifile, 
		    disp, 
		    MPI_BYTE,
		    MPI_BYTE,
		    datarep,
		    MPI_INFO_NULL);
	long displacement = 0;
	int maxcount = 2000*1000*1000;
	while(len > 0){
		int count = (len<maxcount)?len:maxcount;
		MPI_File_read_at(ifile,
				 displacement,
				 data,
				 count,
				 MPI_BYTE,
				 MPI_STATUS_IGNORE);
		displacement += count;
		data = ((char *)data+count);
		len -= count;
	}
	MPI_File_close(&ifile);
}

class LustreFile{
private:
	char dir[200];
	char fname[200];
	int rank;
	int nprocs;
	long totalsize;
	long localsize;
public:
	LustreFile(int ranki, int nprocsi,
		   const char *diri, const char *fnamei, long sizei);
	long getlocalsize() {return localsize;}
	void setstripe(int count);
	void printinfo();
	void write(double *v);
	void read(double *v);
};

LustreFile::LustreFile(int ranki, int nprocsi,
		       const char *diri, const char *fnamei, 
		       long sizei){
	rank = ranki;
	nprocs = nprocsi;
	strcpy(dir, diri);
	strcpy(fname, fnamei);
	totalsize = sizei;
	localsize = totalsize/nprocs;
	if(rank==(nprocs-1))
		localsize = totalsize - (nprocs-1)*localsize;
}

void LustreFile::setstripe(int count){
	if(rank==0){
		char cmd[200];
		sprintf(cmd, "rm %s/%s", dir, fname);
		system(cmd);
		sprintf(cmd, "lfs setstripe --count %d %s/%s", 
			count, dir, fname);
		system(cmd);
	}
	MPI_Barrier(MPI_COMM_WORLD);
}

void LustreFile::printinfo(){
	if(rank!=0)
		return;
	char cmd[200];
	sprintf(cmd, "ls -l %s", dir);
	system(cmd);
	sprintf(cmd , "lfs getstripe %s/%s", dir, fname);
	system(cmd);
}

void LustreFile::write(double *v){
	long disp = 8*rank*(totalsize/nprocs);
	char fnamex[200];
	sprintf(fnamex, "%s/%s", dir, fname);
	write_mpi((void *)v, 8*localsize, fnamex, disp);
}

void LustreFile::read(double *v){
	long disp = 8l*rank*(totalsize/nprocs);
	char fnamex[200];
	sprintf(fnamex, "%s/%s", dir, fname);
	read_mpi((void *)v, 8l*localsize, fnamex, disp);
}

void v_init(double *v, long len, int rank){
	srand(rank+100);
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

#define DIODIRNAME "diskio-mpi"

//size = total size
int time_lustre(int rank, int nprocs, long size, 
		 struct BW_RW& bw, int stripecount=-1){
	TimeStamp clk;
	char dir[200];
	sprintf(dir, "%s/"DIODIRNAME,getenv("SCRATCH"));
	if(rank==0){
		char cmd[200];
		sprintf(cmd, "mkdir %s", dir);
		system(cmd);
	}
	char fname[200];
	sprintf(fname, "parallel%d.dat", nprocs);
	LustreFile lustre(rank, nprocs, dir, fname, size);
	long lsize = lustre.getlocalsize();
	double *v = new double[lsize];
	v_init(v, lsize, rank);
	double avg1 = v_avg(v, lsize);
	if(stripecount==-1)
		stripecount = (nprocs<=50)?nprocs:50;
	lustre.setstripe(stripecount);
	clk.tic();
	lustre.write(v);
	double cycles = clk.toc();
	bw.bw_write = 8.0*size/cycles*CPUGHZ;
	for(long i=0; i < lsize; i++)
		v[i] = -1e100;
	clk.tic();
	lustre.read(v);
	cycles = clk.toc();
	bw.bw_read = 8.0*size/cycles*CPUGHZ;
	double avg2 = v_avg(v, lsize);
	cout<<"rank = "<<rank<<" diff error  = "
	    <<fabs(avg1-avg2)/fabs(avg1)<<endl;
	//if(rank==0)
	//lustre.printinfo();
	delete[] v;
	return stripecount;
}

//flag==1 sets stripecount to 10
void CreateOutputRW(int rank, int nprocs, int stripecount=-1){
	long nlist[2] = {1000l*1000, 2500l*1000*1000};
	for(int i=0; i < 2; i++)//local to totalsize
		nlist[i] *= nprocs;
	ofstream ofile;
	
	if(rank==0){
		ofile.open("OUTPUT/diskio-mpi.txt",ios_base::app);
		long posn = ofile.tellp();
		if(posn<=0){ 
			char s[200];
			sprintf(s, " nprocs\tstripes\t"
				"localn\t\twrite bw\t"
				"read bw (GB/s) (med/hgh)");
			ofile<<s<<endl;
		}
	}
	MPI_Barrier(MPI_COMM_WORLD);
	struct BW_RW bw;
	for(int i=0; i < 2; i++){
		int ntrials=5;
		StatVector rstat(ntrials), wstat(ntrials);
		for(int j=0; j < ntrials; j++){
			stripecount = time_lustre(rank, nprocs, 
						  nlist[i], bw, stripecount);
			rstat.insert(bw.bw_read);
			wstat.insert(bw.bw_write);
		}
		if(rank==0){
			char s[200];
			sprintf(s, " %d\t%d\t%7.2e\t%7.2e/%7.2e\t%7.2e/%7.2e",
				nprocs, stripecount, 1.0*nlist[i]/nprocs, 
				wstat.median(),wstat.max(),
				rstat.median(),rstat.max());
			ofile<<s<<endl;
		}
	}
	if(rank==0)
		ofile.close();
	if(rank==0){
		char cmd[200];
		sprintf(cmd, "ls -l %s/"DIODIRNAME, getenv("SCRATCH"));
		system(cmd);
		sprintf(cmd, "lfs getstripe %s/"DIODIRNAME"/*.dat", 
			getenv("SCRATCH"));
		system(cmd);
	}
}

double runwrite(long count){
	int rank;
	int nprocs;
	mpi_initialize(rank, nprocs);
	char *s = new char[count];
	for(long i=0; i < count; i++)
		s[i] = (i%2==0)?'a'+rank:'\n';
	char fname[200];
	sprintf(fname, "%s/parallel.dat", getenv("SCRATCH"));
	if(rank==0){
		char cmd[200];
		sprintf(cmd, "rm %s", fname);
		system(cmd);
		//sprintf(cmd, "touch %s", fname);
		//system(cmd);
		sprintf(cmd, "lfs setstripe --count 20 %s", fname);
		system(cmd);
	}
	MPI_Barrier(MPI_COMM_WORLD);
	TimeStamp clk;
	clk.tic();
	write_mpi((void *)s, count, fname, rank*count);
	double cycles = clk.toc();
	if(rank==0){
		cout<<"write b/w = "<<count*1.0/cycles<<" bytes/cycle"<<endl;
		char cmd[200];
		sprintf(cmd, "ls -l %s", getenv("SCRATCH"));
		system(cmd);
	}
	MPI_Finalize();
	delete[] s;
	return cycles;
}

int main(){
	//runwrite(1000l*1000*1000*20);
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	int stripecount = -1;
	CreateOutputRW(rank, nprocs,stripecount);
	MPI_Finalize();
}
