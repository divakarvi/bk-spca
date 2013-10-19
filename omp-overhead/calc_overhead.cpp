#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/Table.hh"
#include "overhead.hh"
#include <fstream>
#include <iostream>

int main(){
	const char *rows[12] = {"1", "2", "3", "4", "5", "6", 
				"7", "8", "9", "10", "11", "12"};
	const char *cols[4] = {"barrier", "for", "for nowait", "for dyn"};
	double data[48];
	
	int countinner = 10000;
	int countouter = 1000*1000/100;
	int count = countouter;

	for(int i=1; i <= 12; i++){
		data[(i-1)] = barrier_overhead(i, count);
		data[(i-1)+12] = ompfor_overhead(i, countinner, countouter);
		data[(i-1)+24] = ompfornowait_overhead(i, countinner, 
						       countouter);
		data[(i-1)+36] = ompfordynamic_overhead(i, countinner/100, 
							countouter/1000);
	}

	Table tbl;
	tbl.dim(12, 4);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	verify_dir("DBG");
	//link_cout("DBG/overhead.txt");
	std::ofstream ofile("DBG/overhead.txt");
	std::streambuf *sbuf = std::cout.rdbuf();
	std::cout.rdbuf(ofile.rdbuf());
	std::cout<<"\t     count inner = "<<countinner<<std::endl;
	std::cout<<"\t     count outer = "<<countouter<<std::endl;
	std::cout<<"\t count [barrier] = "<<count<<std::endl;
	tbl.print("overhead in cycles, 1 to 12 threads");
	//unlink_cout();
	std::cout.rdbuf(sbuf);
}
