#include "../../utils/utils.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "../utils/const.hh"
#include "../utils/dhstmem.hh"
#include "../utils/hstTimer.hh"
#include "addcopy.hh"
#include <iostream>
#include <cmath>

const double blockfac = 2.0;
static const int count = 25;
enum add_enum {ADD_BLOCK, ADD_STRIDE};

/*
 * return median in milliseconds
 */
double time_add(int n, enum add_enum flag){
	int NBLK = round(blockfac*BLKinMP*NMP);
	
	double *dresult, *hresult;
	dhstmem<double> dhresult(THinBLK*NBLK);
	dresult = dhresult.device();
	hresult = dhresult.host();
	
	double *hlist, *dlist;
	dhstmem<double> dhlist(n);
	hlist = dhlist.host();
	dlist = dhlist.device();

	for(int i=0; i < n; i++)
		hlist[i] = rand()*1.0/RAND_MAX-0.5;//or try hlist[i]=i+1;
	dhlist.host2device();

	StatVector stats(count);
	hstTimer hclk;
	for(int i=0; i < count; i++){
		hclk.tic();
		switch(flag){
		case ADD_BLOCK:
			addblock<<<NBLK, THinBLK>>>(dlist, n, dresult);
			break;
		case ADD_STRIDE:
			addstride<<<NBLK, THinBLK>>>(dlist, n, dresult);
			break;
		}
		double tms = hclk.toc();
		stats.insert(tms);
	}

	/*
	 * a little verification
	 */
	dhresult.device2host();
	double ans=0;
	for(int i=0; i < NBLK*THinBLK; i++)
		ans += hresult[i];
	std::cout.width(30);
	std::cout<<"sum of random numbers = "<<ans/n<<std::endl;
	std::cout.width(30);
	std::cout<<"std deviation of sum = "<<0.5/sqrt(1.0*n)<<std::endl;

	return stats.median();
}

double time_copy(int n){
	int NBLK = round(blockfac*BLKinMP*NMP);

	double *hlist, *dlist;
	dhstmem<double> dhlist(n);
	hlist = dhlist.host();
	dlist = dhlist.device();

	double *dcopy, *hcopy;
	dhstmem<double> dhcopy(n);
	dcopy = dhcopy.device();
	hcopy = dhcopy.host();
	
	for(int i=0; i < n; i++)
		hlist[i] = rand()*1.0/RAND_MAX-0.5;
	dhlist.host2device();

	StatVector stats(count);
	hstTimer hclk;
	for(int i=0; i < count; i++){
		hclk.tic();
		copy<<<NBLK, THinBLK>>>(dlist, n, dcopy);
		double tms = hclk.toc();
		stats.insert(tms);
	}
	
	/*
	 * verification
	 */
	dhlist.device2host();
	dhcopy.device2host();
	for(int  i=0; i < n; i++)
		assrt(hlist[i] == hcopy[i]);
	std::cout.width(30);
	std::cout<<"copy() verified"<<std::endl;

	return stats.median();
}

int main(){
	int n = 1000*1000*250;//*8=2GB
	
	const char *rows[] = {"BLOCK ADD", "STRIDE ADD", "COPY"};
	const char *cols[] = {"GB/s"};
	double data[3];

	for(int i=0; i < 3; i++){
		double tms, bw;
		switch(i){
		case 0:
			tms = time_add(n, ADD_BLOCK);
			bw = 1.0*n*8/tms*1000/1e9;
			break;
		case 1:
			tms = time_add(n, ADD_STRIDE);
			bw = 1.0*n*8/tms*1000/1e9;
			break;
		case 2: 
			tms = time_copy(n);
			bw = 2.0*n*8/tms*1000/1e9;
			break;
		}
		data[i] = bw;
	}
	
	Table table;
	table.dim(3,1);
	table.rows(rows);
	table.cols(cols);
	table.data(data);
	verify_dir("DBG");
	link_cout("DBG/time_addcopy.txt");
	table.print("Bandwidth in GB/s");
	unlink_cout();
}

