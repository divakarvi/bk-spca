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

#include "lustre.hh"
#include <mpi.h>

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
	long offset = 0;
	int maxcount = 2000*1000*1000;
	while(len > 0){
		int count = (len<maxcount)?len:maxcount;
#ifdef COLLECTIVE
		MPI_File_write_at_all(ofile,
				  offset,
				  data,
				  count,
				  MPI_BYTE,
				  MPI_STATUS_IGNORE);
#else
		MPI_File_write_at(ofile,
				  offset,
				  data,
				  count,
				  MPI_BYTE,
				  MPI_STATUS_IGNORE);
#endif
		offset += count;
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
	long offset = 0;
	int maxcount = 2000*1000*1000;
	while(len > 0){
		int count = (len<maxcount)?len:maxcount;
#ifdef COLLECTIVE
		MPI_File_read_at_all(ifile,
				     offset,
				     data,
				     count,
				     MPI_BYTE,
				     MPI_STATUS_IGNORE);
#else
		MPI_File_read_at(ifile,
				 offset,
				 data,
				 count,
				 MPI_BYTE,
				 MPI_STATUS_IGNORE);
#endif
		offset += count;
		data = ((char *)data+count);
		len -= count;
	}
	MPI_File_close(&ifile);
}

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

void LustreFile::setstripe(int count, int stripesize){
	if(rank==0){
		char cmd[200];
		sprintf(cmd, "rm %s/%s", dir, fname);
		system(cmd);
		sprintf(cmd, "lfs setstripe --size %dM --count %d %s/%s",
				stripesize, count, dir, fname);
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
