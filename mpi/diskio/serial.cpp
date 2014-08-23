/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "../../utils/TimeStamp.hh"
#include "serial.hh"
#include <cstdio>
#include <iostream>
#include <fstream>
#include <iomanip>


void write_easy(double *v, long len, const char *fname){
	std::ofstream ofile(fname);
	ofile<<std::scientific;
	ofile.precision(16);
	for(long i=0; i < len; i++)
		ofile<<v[i]<<std::endl;
	ofile.close();
}

void read_easy(double *v, long len, const char *fname){
	std::ifstream ifile(fname);
	for(long i=0; i < len; i++)
		ifile>>v[i];
}

void write_direct(double *v, long len, const char *fname){
	FILE *fptr;
	fptr = fopen(fname, "w");
	fwrite((void *)v, len, sizeof(double), fptr);
#ifdef DCACHE_FLUSH
	for(int i=1; i < FLUSH_COUNT; i++)
		fwrite((void *)v, len, sizeof(double), fptr);
#endif
	fclose(fptr);
}

extern void dummy(void *);

void read_direct(double *v, long len, const char *fname){
	FILE *fptr;
	fptr = fopen(fname, "r");
	fread((void *)v, len, sizeof(double), fptr);
#ifdef DCACHE_FLUSH
	for(int i=1; i < FLUSH_COUNT; i++){
		fread((void *)v, len, sizeof(double), fptr);
		dummy(v);
	}
#endif
	fclose(fptr);
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
