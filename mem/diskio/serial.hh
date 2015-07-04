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

#ifndef __SERIALDIO27NOV2013__
#define __SERIALDIO27NOV2013__

#define DCACHE_FLUSH
#ifndef DCACHE_FLUSH
#define FLUSH_COUNT 1
#else
#define FLUSH_COUNT 10
#endif
/*
 * write v[0..len-1] to fname using ofstream and 16 digit precision
 */
void write_easy(double *v, long len, const char *fname);

/*
 * read v[0..len-1] from fname using ifstream
 */
void read_easy(double *v, long len, const char *fname);

/*
 * write v[0..len-1] to fname using fwrite()
 * writes FLUSH_COUNT times if DCACHE_FLUSH is on
 */
void write_direct(double *v, long len, const char *fname);

/*
 * read v[0..len-1] from fname using fread()
 * rereads FLUSH_COUNT times if DCACHE_FLUSH is enabled
 * calls dummy() to ensure compiler does not optimize away all but last call
 */
void read_direct(double *v, long len, const char *fname);

/*
 * creates files dir/file[i].dat with i = 0..nfiles-1
 * each file is fszby8*8 bytes
 */
void latency2disk_init(const char *dir, long fszby8, int nfiles);

struct disk_latency{
	double fopen_cycles;
	double fseek_cycles;
	double fread_cycles;
	double fclose_cycles;
};

/*
 * accesses dir/file[i].dat with i = filenum
 * file accessed at position posn
 * lat contains open/seek/read/close cycles
 * return number read 
 */
double latency2disk(const char *dir, int filenum, long posn,
		    struct disk_latency& lat);

/*
 * removes dir/file[i].dat i = 0..nfiles-1
 */
void latency2disk_finalize(const char *dir, int nfiles);

#endif
