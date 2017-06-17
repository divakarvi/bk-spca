#ifndef SERIALDIO27NOV2013
#define SERIALDIO27NOV2013

#define DCACHE_FLUSH
#ifndef DCACHE_FLUSH
#define FLUSH_COUNT 1
#else
#define FLUSH_COUNT 10
#endif
/*
 * Write v[0..len-1] to fname using ofstream and 16 digit precision.
 */
void write_easy(double *v, long len, const char *fname);

/*
 * Read v[0..len-1] from fname using ifstream.
 */
void read_easy(double *v, long len, const char *fname);

/*
 * Write v[0..len-1] to fname using fwrite().
 * Writes FLUSH_COUNT times if DCACHE_FLUSH is on.
 */
void write_direct(double *v, long len, const char *fname);

/*
 * Read v[0..len-1] from fname using fread().
 * Rereads FLUSH_COUNT times if DCACHE_FLUSH is enabled.
 * Calls dummy() to ensure compiler does not optimize away all but last call.
 */
void read_direct(double *v, long len, const char *fname);

/*
 * Creates files dir/file[i].dat with i = 0..nfiles-1.
 * Each file is fszby8*8 bytes.
 */
void latency2disk_init(const char *dir, long fszby8, int nfiles);

struct disk_latency{
	double fopen_cycles;
	double fseek_cycles;
	double fread_cycles;
	double fclose_cycles;
};

/*
 * Accesses dir/file[i].dat with i = filenum.
 * File accessed at position posn.
 * lat contains open/seek/read/close cycles.
 * Returns number read.
 */
double latency2disk(const char *dir, int filenum, long posn,
		    struct disk_latency& lat);

/*
 * Removes dir/file[i].dat i = 0..nfiles-1.
 */
void latency2disk_finalize(const char *dir, int nfiles);

#endif

