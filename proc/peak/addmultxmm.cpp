#include "../../utils/TimeStamp.hh"
#include "easyxmm.hh"
#include <cstdio>

/*
 * inspect assembly to verify correctness
 */

void fivecycles_stall(long int nitns){
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
		addxmm("%xmm8", "%xmm0");
		addxmm("%xmm9", "%xmm1");
		addxmm("%xmm10", "%xmm2");
		mulxmm("%xmm11", "%xmm3");
		mulxmm("%xmm12", "%xmm4");
		mulxmm("%xmm13", "%xmm5");
		mulxmm("%xmm14", "%xmm6");
		mulxmm("%xmm15", "%xmm7");
	}
}

void fivecycles_nostall(long int nitns){
	zeroxmm("%xmm0");
	zeroxmm("%xmm1");
	zeroxmm("%xmm2");
	zeroxmm("%xmm3");
	zeroxmm("%xmm4");
	zeroxmm("%xmm5");
	zeroxmm("%xmm6");
	zeroxmm("%xmm7");
	zeroxmm("%xmm8");
	for(long i=0; i < nitns; i++){
		addxmm("%xmm8", "%xmm0");
		addxmm("%xmm8", "%xmm1");
		addxmm("%xmm8", "%xmm2");
		mulxmm("%xmm8", "%xmm3");
		mulxmm("%xmm8", "%xmm4");
		mulxmm("%xmm8", "%xmm5");
		mulxmm("%xmm8", "%xmm6");
		mulxmm("%xmm8", "%xmm7");
	}
}

int main(){
	long  nitns = (long)1000*1000*1000;
	TimeStamp clk;

	clk.tic();
	fivecycles_stall(nitns);
	double cycles = clk.toc();
	printf("\t\t3 xmm adds + 5 xmm mults per iteration\n");
	printf("\t\teach xmm op uses diff registers\n");
	printf("\t\ttotal number of registers used = 16\n");
	printf("\tnumber of cycles per iteration = %.2f\n\n", cycles/nitns);

	clk.tic();
	fivecycles_nostall(nitns);
	cycles = clk.toc();
	printf("\t\t3 xmm adds + 5 xmm mults per iteration\n");
	printf("\t\teach xmm op uses same source register\n");
	printf("\t\ttotal number of registers used = 9\n");
	printf("\tnumber of cycles per iteration = %.2f\n\n", cycles/nitns);
}

