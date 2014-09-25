#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/Table.hh"
#include "../utils/const.hh"
#include "../utils/dhstmem.hh"
#include "leibniz.hh"
#include "atomicAdd.hh"
#include <cmath>

enum leib_enum {LEIB, LEIB_TOTAL};

double time_leibniz(long n, int NBLKS, enum leib_enum flag){
	int dhmemsize;
	switch(flag){
	case LEIB:
		dhmemsize = THinBLK*NBLKS;
		break;
	case LEIB_TOTAL:
		dhmemsize = 1;
		break;
	}

	double *dresult, *result;
	dhstmem<double> dhmem(dhmemsize);
	dresult = dhmem.device();
	result = dhmem.host();

	TimeStamp clk;
	clk.tic();

	double ans;
	switch(flag){
	case LEIB:
		leibniz<<<NBLKS, THinBLK>>>(n, dresult);
		
		dhmem.device2host();
		ans = 0;
		for(int i=0; i < NBLKS*THinBLK; i++)
			ans += result[i];
		break;
	case LEIB_TOTAL:
		*result = 0;
		dhmem.host2device();
		dhstmem<int> dhmemi(1);
		int *dlock = dhmemi.device();
		int *hlock = dhmemi.host();
		*hlock = 0;
		dhmemi.host2device();

		leibniztotal<<<NBLKS,THinBLK>>>(n, dresult, dlock);
		
		dhmem.device2host();
		ans = *result;
		break;
	}

	assrt(fabs(ans-3.14159)<1e-3);
	double cycles = clk.toc();
	return cycles/n;
}

int main(){
	long n = 1000l*1000*1000*10;
	
	double blk_fac[6] = {0.125, 0.25, 0.5, 1.0, 10.0, 100.0};
	int NBLK_arr[6];
	for(int i=0; i < 6; i++)
		NBLK_arr[i] = round(BLKinSM*NSM*blk_fac[i]);

	enum leib_enum flag[2] = {LEIB, LEIB_TOTAL};

	char *rows[6];
	for(int i=0; i < 6; i++){
		rows[i] = new char[200];
		sprintf(rows[i], "%d", NBLK_arr[i]);
	}
	const char *cols[2] = {"Partial", "Total"};
	double data[12];

	for(int i=0; i < 6; i++)
		for(int j=0; j < 2; j++){
		       std::cout<<"("<<i<<","<<j<<")"<<std::endl;
			data[i+j*6] = time_leibniz(n, NBLK_arr[i], flag[j]);
		}
	
	Table table;
	table.dim(6,2);
	table.rows((const char **)rows);
	table.cols(cols);
	table.data(data);
	link_cout("output/time_leibniz.txt");
	table.print("Number of SandyB cycles/term for summing Leibniz");
	unlink_cout();
}
