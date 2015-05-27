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

#include "../../utils/utils.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/Table.hh"
#include "../../pyplot/pyplot.hh"
#include "fft_fftw.hh"
#include "nr.hh"
#include <mm_malloc.h>
#include <iostream>

#define FWD

enum yesno_type {YES, NO};

static StatVector *stat_fftw = NULL, *stat_nr = NULL;

/*
 * no cache effects if march_on == YES
 */
void time_fft(int n, enum yesno_type march_on){
	/*
	 * check if n is a power of 2
	 */
	int nn = n;
	enum yesno_type pow2 = YES;
	while(nn > 1){
		if(nn%2 == 1)
			pow2 = NO;
		nn /= 2;
	}
	
	/*
	 * determine count of ffts so that 10 GB of data is accessed
	 */
	long bytes = 2l*1000*1000*1000;
	double *space = (double *)_mm_malloc(bytes, 64);
	long count = bytes/(1l*2*n*sizeof(double));

	/*
	 * allocate stat objects
	 */
	if(stat_fftw != NULL)
		delete stat_fftw;
	stat_fftw = new StatVector(count);

	if(stat_nr != NULL)
		delete stat_nr;
	stat_nr = new StatVector(count);


	/*
	 * initialize data
	 */
	if(march_on == YES)
		for(long i = 0; i < count; i++){
			double *v = space + i*(2*n);
			for(int j = 0; j < n; j++){//"random" and cheap
				v[2*j] = 7.0/(8.0+i+j);
				v[2*j+1] = 77/(8.0+i*i+j);
			}
		}
	else{
		double *v = space;
		for(int j = 0; j < n; j++)
			v[2*j] = v[2*j+1] = 0;
	}
	
	TimeStamp clk;
	/*
	 * collect fftw stat
	 */
	fft_fftw fftw(n);
	for(long i = 0; i < count; i++){
		double *v = (march_on == YES) ? space + i*(2*n) : space;
		clk.tic();
#ifdef FWD
		fftw.fwd(v);
#else
		fftw.bwd(v);
#endif
		double cycles = clk.toc();
		stat_fftw->insert(cycles);
	}

	/*
	 * collect nr data
	 */
	switch(pow2){
	case NO:
		stat_nr->insert(0);
		break;
	case YES:
		for(long i=0; i < count; i++){
			double *v = (march_on == YES) ? space + i*(2*n): space;
			clk.tic();
#ifdef FWD
			nrfwd(v, n);
#else
			nrbwd(v, n);
#endif
			double cycles = clk.toc();
			stat_nr->insert(cycles);
		}
		break;
	}
	
	_mm_free(space);
}

void make_table(enum yesno_type march_onoff, const char* banner){
	const int ntrials = 8;
	int n[ntrials] = {32, 64, 80, 
			  8*3*7, 192, 1024, 
			  1024*128, 1024*1024};
	double data[2*ntrials];
	for(int i=0; i < ntrials; i++){
		double nmlz = n[i]*log(1.0*n[i])/log(2.0);
		time_fft(n[i], march_onoff);
		data[i+0*ntrials] = stat_fftw->median()/nmlz;
		data[i+1*ntrials] = stat_nr->median()/nmlz;
	}
	
	Table table;
	table.dim(ntrials, 2);
	const char *rows[ntrials] = {
		"32", "64", "80", 
		"8*3*7", "192", "1024", 
		"1024*128", "1024*1024"
	};
	table.rows(rows);
	const char* cols[] = {"fftw", "n recipes"};
	table.cols(cols);
	table.data(data);
	table.print(banner);
}

int main(){
	verify_dir("DBG/");
#ifdef FWD
	const char *s1 = "(fwd fft)";
	const char *fname = "DBG/time_fft_fwd.txt";
#else
	const char *s1 = "(bwd fft)";
	const char *fname = "DBG/time_fft_bwd.txt";
#endif
	link_cout(fname);
	char banner[200];
	sprintf(banner, "with cache eviction (nmlz by n*lg2n) %s", s1);
	make_table(YES, banner);
	sprintf(banner, "without cache eviction (nmlz by n*lg2n) %s", s1);
	make_table(NO, banner);
	unlink_cout();
}
