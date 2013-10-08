#include "../utils/utils.hh"
#include "../utils/Table.hh"
#include "../utils/TimeStamp.hh"
#include "asm4xnx4.hh"
#include <cstdio>
#include <cstdlib>

void time4x1x4(){
	__declspec(align(16)) double a[4]={1,2,3,4};
	__declspec(align(16)) double b[4]={1,2,3,4};
	__declspec(align(16)) double c[16] = {0};
	double cc[16];

	for(int i=0; i < 16; i++)
		c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;

	for(int i=0; i < 4; i++){
		a[i] = rand()*1.0/RAND_MAX-0.5;
		b[i] = rand()*1.0/RAND_MAX-0.5;
	}


	TimeStamp clk;
	clk.tic();
	for(int i=0; i < 1000*1000*1000; i++)
		asm4x1x4(a, b, c);
	double cycles = clk.toc();
	std::cout<<"cycles per 4x1x4 mult = "<<cycles/1000/1000/1000<<std::endl;
	cycles = cycles/1e9;
	std::cout<<"flops per cycle = "<<2.0*16/cycles<<std::endl;
}


void time4x4x4(){
	__declspec(align(16)) double a[16];
	__declspec(align(16)) double b[16];
	__declspec(align(16)) double c[16];
	double bb[16], cc[16];

	for(int i=0; i < 16; i++){
		a[i] = rand()*1.0/RAND_MAX-0.5;
		b[i] = rand()*1.0/RAND_MAX-0.5;
		c[i] = cc[i] = (rand()/RAND_MAX*1.0-0.5);
	}

	for(int i=0; i < 4; i++)
		for(int j=0; j < 4; j++){
			bb[i+4*j] = b[j+4*i];
		}

	TimeStamp clk;
	clk.tic();
	for(int i=0; i < 1000*1000*1000; i++)
		asm4x4x4(a, b, c);
	double cycles = clk.toc();
	std::cout<<"cycles per 4x4x4 mult = "<<cycles/1000/1000/1000<<std::endl;
	cycles = cycles/1e9;
	std::cout<<"flops per cycle = "<<2.0*16*4/cycles<<std::endl;

}

/*
 * returns average number of cycles for asm4xnx4
 * n = 1, 4, 20, 40, 100, 200
 */
double time(int n){
	__declspec(align(16)) double a[4*n];
	__declspec(align(16)) double b[4*n];
	__declspec(align(16)) double c[16];

	for(int i=0; i < 16; i++)
		c[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 4*n; i++){
		a[i] = rand()*1.0/RAND_MAX-0.5;
		b[i] = rand()*1.0/RAND_MAX-0.5;
	}

	int count = 1000*1000*1000/n;
	TimeStamp clk;
	clk.tic();

	switch(n){
	case 1:
		for(int i=0; i < count; i++)
			asm4x1x4(a, b, c);
		break;
	case 4:
		for(int i=0; i < count; i++)
			asm4x4x4(a, b, c);
		break;	 
	case 20:
		for(int i=0; i < count; i++)
			asm4x20x4(a, b, c);
		break;
	case 40:
		for(int i=0; i < count; i++)
			asm4x40x4(a, b, c);
		break;
	case 100:
		for(int i=0; i < count; i++)
			asm4x100x4(a, b, c);
		break;	 
	case 200:
		for(int i=0; i < count; i++)
			asm4x200x4(a, b, c);
		break;
	default:
		assrt(0 == 1);
	}
	
	double cycles = clk.toc();
	return cycles/count;
}

int main(){
	const char *rows[6] = {"1", "4", "20", "40", "100", "200"};
	const char *cols[2] = {"avg cycles", "flops/cycle"};
	double data[12];
	
	data[0] = time(1); data[6] = 2*16/data[0];
	data[1] = time(4); data[7] = 2*16*4/data[1];
	data[2] = time(20); data[8] = 2*16*20/data[2];
	data[3] = time(40); data[9] = 2*16*40/data[3];
	data[4] = time(100); data[10] = 2*16*100/data[4];
	data[5] = time(200); data[11] = 2*16*200/data[5];

	verify_dir("DBG");
	std::ofstream ofile("DBG/time_asm.txt");
	std::streambuf *sbuf = std::cout.rdbuf();
	std::cout.rdbuf(ofile.rdbuf());

	Table tbl;
	tbl.dim(6, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("timing asm4xnx4.s");

	std::cout.rdbuf(sbuf);
}
