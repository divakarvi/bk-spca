#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "../proc-microk/asm4xnx4.hh"
#include "blockmult.hh"

enum cacheflag {L2cache, L3cache};

/*
 * L1 cache = 32 KB = 4000 doubles
 * L2 cache = 260 KB = 32500 doubles
 * L3 cache = 12.6 MB  = 1.5 million doubles
 * a = 800*15  = 12000 doubles streamed from L2 cache (flag == L2cache)
 * a = 800*150 = 120000 doubles streamed from L3 cache (flag == L3cache)
 * b = 800 doubles is assumed to be in L1 cache
 * returns avg cycles for a mult
 */
double time4x200x4(enum cacheflag flag){
	int N;
	if(flag == L2cache)
		N = 15;
	else if(flag == L3cache)
		N = 150;
	else
		assrt(0 == 1);

	__declspec(align(16)) double a[800*N];
	__declspec(align(16)) double b[800];
	__declspec(align(16)) double c[16*N];

	for(int i=0; i < 800; i++)
		b[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 800*N; i++)
		a[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 16*N; i++)
		c[i] = 0;

	TimeStamp clk;
	clk.tic();

	for(int i=0; i < 1000*1000*10; i++)
		asm4x200x4(a+(i%N)*800, b, c+(i%N)*16);

	double cycles = clk.toc();
	cycles = cycles/1e7;

	return cycles;
}

/*
 * a = 120000 or 12000 doubles (stream from L3 or L2)
 * b = 2400 doubles
 * return avg cycles
 */
double time4x200x12(enum cacheflag flag){
	int N;
	if(flag == L2cache)
		N = 15;
	else if(flag == L3cache)
		N = 150;
	else
		assrt(0 == 1);
	
	__declspec(align(16)) double a[800*N];
	__declspec(align(16)) double b[2400];
	__declspec(align(16)) double c[48*N];

	for(int i=0; i < 2400; i++)
		b[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 48*N; i++)
		c[i] = 0;
	for(int i=0; i < 800*N; i++)
		a[i] = rand()*1.0/RAND_MAX;

	TimeStamp clk;
	double cycles;
	clk.tic();

	for(int i=0; i < 1000*1000*10; i++)
		mult4x200x12(a+800*(i%N), b, c+48*(i%N));

	cycles = clk.toc();
	cycles = cycles/1e7;
	
	return cycles;
}

/*
 * a = 120000 doubles in L3 cache
 * b = 200*12*1000 = 2,400,000 doubles loaded to L1 cache from memory
 * C = 600*12*2000 = 600*12 matrix with large ldC
 */
double time600x200x12(){
	__declspec(align(16)) double a[600*200];
	__declspec(align(16)) double bb[200*12*1000];
	double *C = (double *)_mm_malloc(600l*12*2000*sizeof(double), 16);
	__declspec(align(16)) double scratch[7200];
  
	for(int i=0; i < 600*12; i++)
		a[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 200*12*1000; i++)
		bb[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 600*12*2000; i++)
		C[i] = 0;
  

	int count = 1000*10;

	TimeStamp clk;
	double cycles;
	clk.tic();

	int ldC = 60000;
	for(int i=0; i < count; i++)
		mult600x200x12(a, bb, C, 600, scratch);

	cycles = clk.toc();
	cycles /= count;

	clk.tic();
	double x = 0;
	for(int i=0; i < count; i++){
		mult600x200x12(a, bb, C+(i%10000)*600, 6000, scratch);
		x += C[(i%10000)*600]; 
	}
	cycles = clk.toc();
	cycles /= count;

	_mm_free(C);

	return cycles;
}

/*
 * time while evicting A and C from cache
 */
double time600x200x3000(){
	int ldA = 6000;
	double* aa = 
		(double *)_mm_malloc(600*200*10*2*sizeof(double), 16);
	double *b = (double *)_mm_malloc(1l*sizeof(double)*200*3000, 16);
	int ldC = 1200;
	double *C = (double *)_mm_malloc(1l*sizeof(double)*600*3000*10, 16);
	double *scratch = 
		(double *)_mm_malloc(1l*sizeof(double)*(7200+600*200), 16);
	
	for(int i=0; i < 600*200*10*2; i++)
		aa[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 200*3000; i++)
		b[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 600*3000*10; i++)
		C[i] = 0;
	
	int count = 400;
	TimeStamp clk;
	double cycles;
	clk.tic();

	for(int i=0; i < count; i++)
		mult600x200x3000(aa+600*200*(i%5), 6000, 
				 b, C+600*3000*(i%8), 600, scratch);

	cycles = clk.toc();
	cycles /= count;

	_mm_free(aa);
	_mm_free(b);
	_mm_free(C);
	_mm_free(scratch);

	return cycles;
}

/*
 * time with large ldB
 */
double time3000x200x3000(){
	int ldA = 3000;
	double *A = (double *)_mm_malloc(1l*sizeof(double)*3000*200, 16);
	int ldB = 2000;
	double *B = (double *)_mm_malloc(1l*sizeof(double)*200*3000*10, 16);
	int ldC = 3000;
	double *C = (double *)_mm_malloc(1l*sizeof(double)*3000*3000, 16);
	double *scratch = 
		(double *)_mm_malloc(1l*sizeof(double)
				     *(600*12+600*200+200*3000), 16);


	for(int i=0; i < 3000*200; i++)
		A[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 200*3000*10; i++)
		B[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < 3000*3000; i++)
		C[i] = 0;
  
	int  count = 100;
	TimeStamp clk;
	double cycles;
	clk.tic();

	for(int i=0; i < count; i++)
		mult3000x200x3000(A, 3000, B, 2000, C, 3000, scratch);


	cycles = clk.toc();
	cycles /= count;
	
	_mm_free(A);
	_mm_free(B);
	_mm_free(C);
	_mm_free(scratch);

	return cycles;
}
 
/*
 * time 9000x9000x9000
 */
double timeblock(){
	const int l = 9000;
	const int m = 9000;
	const int n = 9000;

	double *A = (double *)_mm_malloc(1l*sizeof(double)*l*m, 16);
	double *B = (double *)_mm_malloc(1l*sizeof(double)*m*n, 16);
	double *C = (double *)_mm_malloc(1l*sizeof(double)*l*n, 16);
	double *scratch = 
		(double *)_mm_malloc(1l*sizeof(double)
				     *(600*12+600*200+200*3000), 16);
  
	for(int i=0; i < l*m; i++)
		A[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < m*n; i++)
		B[i] = rand()*1.0/RAND_MAX;
	for(int i=0; i < l*n; i++)
		C[i] = 0.0;

	int count = 10;
	TimeStamp clk;
	double cycles;
	clk.tic();

	for(int i=0; i < count; i++)
		blockmult(A,B,C, l, m, n, scratch);

	cycles = clk.toc();
	cycles /= count;

	_mm_free(A);
	_mm_free(B);
	_mm_free(C);
	_mm_free(scratch);

	return cycles;
}

int main(){
	const char* rows[8] = {"4x200x4,L2", "4x200x4,L3", 
	                      "4x200x12,L2", "4x200x12,L3",
	                      "600x200x12", "600x200x3000",
			      "3000x300x3000", "9000x9000x9000"
	};
	const char* cols[2] = {"cycles", "flops/cycle"};
	double data[16];

	double cycles;

	cycles = time4x200x4(L2cache);
	data[0] = cycles;
	data[8] = 32.0*200/cycles;

	cycles = time4x200x4(L3cache);
	data[1] = cycles;
	data[9] = 32.0*200/cycles;

	cycles = time4x200x12(L2cache);
	data[2] = cycles;
	data[10] = 2.0*4*12*200/cycles;

	cycles = time4x200x12(L3cache);
	data[3] = cycles;
	data[11] = 2.0*4*12*200/cycles;

	cycles = time600x200x12();
	data[4] = cycles;
	data[12] = 2.0*600*12*200/cycles;

	cycles = time600x200x3000();
	data[5] = cycles;
	data[13] = 2.0*600*3000*200/cycles;

	cycles = time3000x200x3000();
	data[6] = cycles;
	data[14] = 2.0*3000*3000*200/cycles;

	cycles = timeblock();
	data[7] = cycles;
	data[15] = 2.0*9000*9000*9000/cycles;

	verify_dir("DBG");
	const char *fname = "DBG/time_block.txt";
	link_cout(fname);

	Table tbl;
	tbl.dim(8, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("matrix mult using asm4x200x4 microkernel");
	
	unlink_cout();
}
