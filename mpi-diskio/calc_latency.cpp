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

#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "serial.hh"
#include <iostream>
#include <fstream>
#include <iomanip>

#define GEN_OUTPUT
const double CPUGHZ=3.33;//1.8 or 3.33 or 3.40

void calc_latency(){
	int nfiles=100; 
	long fszby8=1000l*1000*125;
	
	char dir[200];
	if(getenv("SCRATCH")==NULL){
		printf("SCRATCH directory must be set\n");
		exit(-1);
	}
	sprintf(dir, "%s/diskio-latency", getenv("SCRATCH"));
	char cmd[200];
	sprintf(cmd, "mkdir %s", dir);
	system(cmd);

	double error=0;

	latency2disk_init(dir, fszby8, nfiles);
	int ntrials = 10;
	StatVector stato(ntrials*nfiles), stats(ntrials*nfiles), 
		statr(ntrials*nfiles), statc(ntrials*nfiles);
	struct disk_latency dklat;
	for(int j=0; j < ntrials*nfiles; j++){
		int filenum = j%nfiles;
		int jj = j/nfiles;
		long delta = fszby8/ntrials;
		long posn = delta/2+jj*delta;
		double x = latency2disk(dir, filenum, posn, dklat);
		error += fabs(x-posn);
		stato.insert(dklat.fopen_cycles);
		stats.insert(dklat.fseek_cycles);
		statr.insert(dklat.fread_cycles);
		statc.insert(dklat.fclose_cycles);
	}
	latency2disk_finalize(dir, nfiles);
	char s[200];
	sprintf(s, "%.1e\t%.1e\t%.2e\t%.2e\t%.2e\t%.2e",
		fszby8*8.0, nfiles*1.0, 
		stato.mean()/CPUGHZ*1e-6, 
		stats.mean()/CPUGHZ*1e-6,
		statr.mean()/CPUGHZ*1e-6,
		statc.mean()/CPUGHZ*1e-6);
	stato.print("file open");
	stats.print("file seek");
	statr.print("file read");
	statc.print("file close");
#ifdef GEN_OUTPUT
	std::ofstream ofile;
	FILE* unm = popen("uname -n", "r");
	char machine[200];
	fscanf(unm, "%s", machine);
	pclose(unm);
	char fname[200];
	sprintf(fname, "OUTPUT/diskio-latency-%s.txt", machine);
	ofile.open(fname, std::ios::app);
	long posn = ofile.tellp();
	if(posn<=0){
		ofile<<"latency in milliseconds"<<std::endl;
		char ss[200];
		sprintf(ss, 
			"size\tnfiles\topen\t\tseek\t\tread\t\tclose");
		ofile<<s<<std::endl;
	}
	ofile<<s<<std::endl;
	ofile.close();
#else
	std::cout<<s<<std::endl;
#endif
	std::cout<<"error = "<<error<<std::endl;
}

int main(){
	std::cout<<"CPUGHZ = "<<CPUGHZ<<std::endl;
	calc_latency();
}
