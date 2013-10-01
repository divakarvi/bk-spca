#include "../utils/TimeStamp.hh"
#include "easyxmm.hh"
#include <cstdio>

/*
 * assembly of addreg() and add3reg() must be inspected 
 * to ensure the compiled code is as expected
 */

// a[0,1] += nitns*b[0,1]
//(expect 3 clock ticks per iteration)
void addreg(double *a, double *b, long int nitns){
  long int  i;
  loadxmm(a, "%xmm0");
  loadxmm(b, "%xmm1");
  for(i=0; i < nitns; i++)
    addxmm("%xmm1","%xmm0");
  storexmm("%xmm0", a);
}

// a[0..5] += nitns*b[0..5]
//(expect 3 clock ticks per iteration)
void add3reg(double *a, double *b, long int nitns){
	long int  i;
	loadxmm(a, "%xmm0");
	loadxmm(b, "%xmm1");
	loadxmm(a+2, "%xmm2");
	loadxmm(b+2, "%xmm3");
	loadxmm(a+4, "%xmm4");
	loadxmm(b+4, "%xmm5");
	for(i=0; i < nitns; i++){
		addxmm("%xmm1","%xmm0");
		addxmm("%xmm3","%xmm2");
		addxmm("%xmm5","%xmm4");
	}
	storexmm("%xmm0", a);
	storexmm("%xmm2", a+2);
	storexmm("%xmm4", a+4);
}

int main(){
	__declspec(align(16)) double a[6]={1e9, 1e9, 1e9, 1e9, 1e9, 1e9};
	__declspec(align(16)) double b[6]={1, 2, 3, 4, 5, 6};

	long int nitns = 1000*1000*1000l;
	TimeStamp clk;
	clk.tic();
	addreg(a, b, nitns);
	double cycles = clk.toc();	
	printf("\t\t a[0..5] = 1e9\n");
	printf("\t\t b[0..5] = 1,2,3,4,5,6\n");
	printf("\t\t a[0,1] += 1e9*b[0,1]\n");
	printf("\tcycles per itn\t= %.2f\n",cycles/nitns);
	printf("\t          a[0]\t= %.4e\n", a[0]);
	printf("\t          a[1]\t= %.4e\n\n", a[1]);
	
	clk.tic();
	add3reg(a, b, nitns);
	cycles = clk.toc();
	printf("\t\t a[0..5] += 1e9*b[0..5]\n");
	printf("\tcycles per itn\t= %.2f\n",cycles/nitns);
	printf("\t          a[0]\t= %.4e\n", a[0]);
	printf("\t          a[1]\t= %.4e\n", a[1]);
	printf("\t          a[3]\t= %.4e\n", a[3]);
	printf("\t          a[4]\t= %.4e\n", a[4]);
}
