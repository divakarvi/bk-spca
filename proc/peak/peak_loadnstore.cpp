#include "../../utils/TimeStamp.hh"
#include "easyxmm.hh"
#include <cstdio>

/*
 * Inspect assembly to verify correctness.
 */

void loadmuladdstore(double *a, long int nitns){
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
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0"); 
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
	}
}

void loadmuladdstore_unroll8(double *a, long int nitns){
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	for(long int i=0; i < nitns/8; i++){
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0"); 
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);

		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		/** 2 ***/
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0"); 
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		/*** 4 ***/
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0"); 
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0"); 
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
		loadxmm(a, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm2");
		storexmm("%xmm2", a+100);
		
		loadxmm(a+12, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm3");
		storexmm("%xmm3", a+200);
		
		loadxmm(a+24, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm4");
		storexmm("%xmm4", a+300);
		
		loadxmm(a+36, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm5");
		storexmm("%xmm5", a+400);
		
		loadxmm(a+48, "%xmm0");
		mulxmm("%xmm1", "%xmm0");
		addxmm("%xmm0", "%xmm6");
		storexmm("%xmm6", a+500);
		
	}
}

int main(){
	__declspec(align(16)) double a[1024]={0};
	long nitns = (long)1000*1000*1000;
	TimeStamp clk;
	double cycles;

	clk.tic();
	loadmuladdstore(a, nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 5 adds and 5 muls\n");
	printf("\t\tloaded reg reused as destn of mul\n");
	printf("\t\tdest of mul reused as source by single add\n");
	printf("\t\tdest of add stored in memory\n");
	printf("\tcycles per iteration = %.2f\n\n", cycles/nitns);

	clk.tic();
	loadmuladdstore_unroll8(a, nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 5 adds and 5 muls\n");
	printf("\t\tloaded reg reused as destn of mul\n");
	printf("\t\tdest of mul reused as source by single add\n");
	printf("\t\tdest of add stored in memory\n");
	printf("\t\tUNROLLED 8 times\n");
	printf("\tcycles per iteration = %.2f\n\n", cycles/nitns);
}

