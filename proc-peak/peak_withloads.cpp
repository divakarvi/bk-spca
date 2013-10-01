#include "../utils/TimeStamp.hh"
#include "easyxmm.hh"
#include <cstdio>

/*
 * inspect assembly to verify correctness
 */

void loadaddmul(double *a, long int nitns){
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	for(long int i=0; i < nitns; i++){
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
	}
}

void loadaddmul_unroll4(double *a, long int nitns){
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	for(long int i=0; i < nitns/4; i++){
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
	}
}

int main(){
	__declspec(align(16)) double a[1024]={0};
	long int nitns = (long)1000*1000*1000;
	TimeStamp clk;
	double cycles;

	clk.tic();
	loadaddmul(nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 5 adds and 5 muls\n");
	printf("\t\tloaded reg reused as destn of mul\n");
	printf("\t\tdest of mul reused as source by single add\n");
	printf("\t\tall muls and adds have same reg as source\n");
	printf("\tcycles per iteration = %.2f\n\n", cycles/nitns);

	clk.tic();
	loadaddmul_unroll4(nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 5 adds and 5 muls\n");
	printf("\t\tloaded reg reused as destn of mul\n");
	printf("\t\tdest of mul reused as source by single add\n");
	printf("\t\tall muls and adds have same reg as source\n");
	printf("\t\tUNROLLED 4 times\n");
	printf("\tcycles per iteration = %.2f\n\n", cycles/nitns);
}
