#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../init/mpi_init.hh"
#include "lustre.hh"
#include <mpi.h>
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <fstream>

const double CPUGHZ=3.33;

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
	int stripesize;
	int stripecount;
};

#define DIODIRNAME "diskio-mpi"

//size = total size
void time_lustre(int rank, int nprocs, long size, 
		 struct BW_RW& bw){
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

	int stripecount = bw.stripecount;
	int stripesize = bw.stripesize;
	lustre.setstripe(stripecount, stripesize);
	bw.stripecount = stripecount;

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

	/*
	 * check correctness
	 */
	double avg2 = v_avg(v, lsize);
	assrt(avg1 == avg2);

	delete[] v;
}


void lustre_bw(int rank, int nprocs, 
		    int stripecount=-1, int bigflag=0){
	if(stripecount==-1)
		stripecount = (nprocs<=50)?nprocs:50;
	int stripesize = (bigflag==0)?1:4000;
	struct BW_RW bw;
	bw.stripecount = stripecount;
	bw.stripesize = stripesize;

	long nlist[2]; 
	if(!bigflag){
		nlist[0] = 1250l*1000;
		nlist[1] = 2500l*1000*1000;
	}
	else{
		nlist[0] = 1250l*1000;
		nlist[1] = 4000l*1024*1024/8*5;
	}
	for(int i=0; i < 2; i++)//local to totalsize
		nlist[i] *= nprocs;
	
	std::ofstream ofile;
	if(rank==0){
		if(!bigflag)
			ofile.open("output/diskio-mpi.txt",std::ios::app);
		else
			ofile.open("output/diskio-mpi-4Gstripe.txt",
				   std::ios::app);
		long posn = ofile.tellp();
		if(posn<=0){ 
			char s[200];
			sprintf(s, " nprocs\tstripes\t"
				"localn(doubles)\twrite bw\t"
				"read bw (GB/s) (med/hgh)");
			ofile<<s<<std::endl;
		}
	}
	MPI_Barrier(MPI_COMM_WORLD);
	for(int i=0; i < 2; i++){
		int ntrials=5;
		StatVector rstat(ntrials), wstat(ntrials);
		for(int j=0; j < ntrials; j++){
			time_lustre(rank, nprocs, nlist[i], bw);
			rstat.insert(bw.bw_read);
			wstat.insert(bw.bw_write);
		}
		if(rank==0){
			char s[200];
			sprintf(s, " %d\t%d\t%7.2e\t%7.2e/%7.2e\t%7.2e/%7.2e",
				nprocs, bw.stripecount, 1.0*nlist[i]/nprocs, 
				wstat.median(),wstat.max(),
				rstat.median(),rstat.max());
			ofile<<s<<std::endl;
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

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);

	int stripecount = -1;
	lustre_bw(rank, nprocs, stripecount);

	mpi_finalize();
}
