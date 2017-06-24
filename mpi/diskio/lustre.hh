#ifndef lustredio27NOV2013
#define lustredio27NOV2013
/*
 * Writes data[0..len-1] (len bytes) to fname beginning at position disp.
 * Called by Lustrefile.write().
 */
void write_mpi(void *data, long len, char *fname, long disp);

/*
 * Reads data[0..len-1] (len bytes) from fname beginning at position disp.
 * Called by Lustrefile.read().
 */
void read_mpi(void *data, long len, char *fname, long disp);

class LustreFile{
private:
	char dir[200];
	char fname[200];
	int rank;
	int nprocs;
	long totalsize;
	long localsize;
public:
	/*
	 * sizei = total size of file in doubles.
	 */
	LustreFile(int ranki, int nprocsi,
		   const char *diri, const char *fnamei, long sizei);
	long getlocalsize() {return localsize;}
	void setstripe(int count, int stripesize=1);//stripesize in MB.
	void printinfo();
	void write(double *v);
	void read(double *v);
};

#endif

