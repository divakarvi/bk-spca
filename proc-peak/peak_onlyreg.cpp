#include "../utils/TimeStamp.hh"
#include "easyxmm.hh"
#include <cstdio>

/*
 * inspect assembly to verify correctness
 */

void peak_dest2source(long int nitns){
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	zeroxmm("%xmm7");
	zeroxmm("%xmm8");
	zeroxmm("%xmm9");
	zeroxmm("%xmm10");
	zeroxmm("%xmm11");
	zeroxmm("%xmm12");
	zeroxmm("%xmm13");
	zeroxmm("%xmm14");
	zeroxmm("%xmm15");
	for(long i=0; i < nitns; i++){
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
	}
}

void peak_dest2source_unroll(long int nitns){
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	zeroxmm("%xmm7");
	zeroxmm("%xmm8");
	zeroxmm("%xmm9");
	zeroxmm("%xmm10");
	zeroxmm("%xmm11");
	zeroxmm("%xmm12");
	zeroxmm("%xmm13");
	zeroxmm("%xmm14");
	zeroxmm("%xmm15");
	for(long i=0; i < nitns/10; i++){
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
		
		addxmm("%xmm0", "%xmm1");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm3", "%xmm4");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm6", "%xmm7");
		mulxmm("%xmm7", "%xmm8");
		addxmm("%xmm9", "%xmm10");
		mulxmm("%xmm10", "%xmm11");
		addxmm("%xmm12", "%xmm13");
		mulxmm("%xmm13", "%xmm14");
	}
}

void peak_dest2sourcexx(long int nitns){
	long int  i;
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	zeroxmm("%xmm7");
	zeroxmm("%xmm8");
	zeroxmm("%xmm9");
	zeroxmm("%xmm10");
	zeroxmm("%xmm11");
	zeroxmm("%xmm12");
	zeroxmm("%xmm13");
	zeroxmm("%xmm14");
	zeroxmm("%xmm15");
	for(i=0; i < nitns; i++){
		mulxmm("%xmm0", "%xmm1");
		addxmm("%xmm1", "%xmm10");
		mulxmm("%xmm2", "%xmm3");
		addxmm("%xmm1", "%xmm11");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm5", "%xmm12");
		mulxmm("%xmm6", "%xmm7");
		addxmm("%xmm5", "%xmm13");
		mulxmm("%xmm8", "%xmm9");
		addxmm("%xmm9", "%xmm10");
		
		mulxmm("%xmm0", "%xmm1");
		addxmm("%xmm9", "%xmm11"); 
		mulxmm("%xmm2", "%xmm3");
		addxmm("%xmm3", "%xmm12");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm3", "%xmm13");
		mulxmm("%xmm6", "%xmm7");
		addxmm("%xmm7", "%xmm10");
		mulxmm("%xmm8", "%xmm9");
		addxmm("%xmm7", "%xmm11");
		
		mulxmm("%xmm0", "%xmm1");
		addxmm("%xmm1", "%xmm12");
		mulxmm("%xmm2", "%xmm3");
		addxmm("%xmm1", "%xmm13");
		mulxmm("%xmm4", "%xmm5");
		addxmm("%xmm5", "%xmm10");
		mulxmm("%xmm6", "%xmm7");
		addxmm("%xmm5", "%xmm11");
		mulxmm("%xmm8", "%xmm9");
		addxmm("%xmm9", "%xmm12");
	}
}

int main(){
	__declspec(align(16)) double a[1024]={0};
	long int nitns = (long)1000*1000*1000;
	TimeStamp clk;
	double cycles;

	clk.tic();
	peak_dest2source(nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 5 adds and 5 muls\n");
	printf("\t\tdest of mul reused as source by single add\n");
	printf("\tcycles per iteration = %.2f\n\n", cycles/nitns);
	
	clk.tic();
	peak_dest2source_unroll(nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 5 adds and 5 muls\n");
	printf("\t\tdest of mul reused as source by single add\n");
	printf("\t\tUNROLLED ten times\n");
	printf("\tcycles per iteration = %.2f\n\n", cycles/nitns);
	
	clk.tic();
	peak_dest2sourcexx(nitns);
	cycles = clk.toc();
	printf("\t\teach iteration has 20 adds and 20 muls\n");
	printf("\t\tdest of mul reused as source by TWO adds\n");
	printf("\tcycles per iteration = %.2f\n", cycles/nitns);
}
