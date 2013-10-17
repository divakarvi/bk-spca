#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/Table.hh"
#include "overhead.hh"

int main(){
	const char *rows[12] = {"1", "2", "3", "4", "5", "6", 
				"7", "8", "9", "10", "11", "12"};
	const char *cols[4] = {"barrier", "for", "for nowait", "for dyn"};
	double data[48];
	
	int countinner = 1000;
	int countouter = 1000*1000*100;
	int count = countouter;

	for(int i=1; i <= 12; i++){
		data[i] = barrier_overhead(i, count);
		data[i+12] = ompfor_overhead(i, countinner, countouter);
		data[i+24] = ompfornowait_overhead(i, countinner, countouter);
		data[i+36] = ompfordynamic_overhead(i, countinner, countouter);
	}

	Table tbl;
	tbl.dim(12, 4);
	tbl.rows(rows);
	tbl.cols(cols);
	verify_dir("DBG");
	link_cout("DBG/overhead.txt");
	tbl.print("overhead in cycles, 1 to 12 threads");
	unlink_cout();
}
