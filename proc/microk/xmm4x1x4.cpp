#include "../peak/easyxmm.hh"

//Multiplies 4x1 and 1x4 to get 4x4.
//c[] = c[]+a[]*b[] (interpret as matrices).
void multxmm4x1x4(double *a, double *b, double *c){
	//[1]
	loadxmm(c, "%xmm4");
	loadxmm(c+4, "%xmm5");
	loadxmm(c+8, "%xmm6");
	loadxmm(c+12, "%xmm7");
	loadxmm(c+2, "%xmm8");
	loadxmm(c+6, "%xmm9");
	loadxmm(c+10, "%xmm10");
	loadxmm(c+14, "%xmm11");
	//[2]
	loadxmm(a, "%xmm2");
	loadxmm(b, "%xmm0");
	mulxmm("%xmm0", "%xmm2");
	loadxmm(a+2, "%xmm3");
	movxmm("%xmm3", "%xmm12");
	mulxmm("%xmm0", "%xmm3");
	addxmm("%xmm2", "%xmm4");
	addxmm("%xmm3", "%xmm8");
	loadxmm(b+2, "%xmm1");
	mulxmm("%xmm1", "%xmm12");
	loadxmm(a, "%xmm2");
	mulxmm("%xmm1", "%xmm2");
	addxmm("%xmm2", "%xmm6");
	addxmm("%xmm12", "%xmm10");
	//[3]
	loadxmm(a, "%xmm3");
	flipxmm("%xmm3");
	movxmm("%xmm3", "%xmm2");
	mulxmm("%xmm1", "%xmm3");
	mulxmm("%xmm0", "%xmm2");
	addxmm("%xmm3", "%xmm7");
	addxmm("%xmm2", "%xmm5");
	//[4]
	loadxmm(a+2, "%xmm2");
	flipxmm("%xmm2");
	movxmm("%xmm2", "%xmm3");
	mulxmm("%xmm0", "%xmm2");
	mulxmm("%xmm1", "%xmm3");
	addxmm("%xmm2", "%xmm9");
	addxmm("%xmm3", "%xmm11");
	//[5]
	storexmm("%xmm4", c);
	storexmm("%xmm5", c+4);
	storexmm("%xmm6", c+8);
	storexmm("%xmm7", c+12);
	storexmm("%xmm8", c+2);
	storexmm("%xmm9", c+6);
	storexmm("%xmm10", c+10);
	storexmm("%xmm11", c+14);
}


//Iterates above 10**9 times while keeping c[] out of loop.
void multxmm4x1x4R(double *a, double *b, double *c){
	//[1]
	loadxmm(c, "%xmm4");
	loadxmm(c+4, "%xmm5");
	loadxmm(c+8, "%xmm6");
	loadxmm(c+12, "%xmm7");
	loadxmm(c+2, "%xmm8");
	loadxmm(c+6, "%xmm9");
	loadxmm(c+10, "%xmm10");
	loadxmm(c+14, "%xmm11");
	for(long int i=0; i < 1000*1000*1000; i++){
		loadxmm(a, "%xmm2");
		loadxmm(b, "%xmm0");
		mulxmm("%xmm0", "%xmm2");
		loadxmm(a+2, "%xmm3");
		movxmm("%xmm3", "%xmm12");
		mulxmm("%xmm0", "%xmm3");
		addxmm("%xmm2", "%xmm4");
		addxmm("%xmm3", "%xmm8");
		loadxmm(b+2, "%xmm1");
		mulxmm("%xmm1", "%xmm12");
		loadxmm(a, "%xmm2");
		//movxmm("%xmm2", "%xmm3");
		mulxmm("%xmm1", "%xmm2");
		addxmm("%xmm2", "%xmm6");
		addxmm("%xmm12", "%xmm10");
		loadxmm(a, "%xmm3");//
		flipxmm("%xmm3");
		movxmm("%xmm3", "%xmm2");
		mulxmm("%xmm1", "%xmm3");
		mulxmm("%xmm0", "%xmm2");
		addxmm("%xmm3", "%xmm7");
		addxmm("%xmm2", "%xmm5");
		loadxmm(a+2, "%xmm2");
		flipxmm("%xmm2");
		movxmm("%xmm2", "%xmm3");
		mulxmm("%xmm0", "%xmm2");
		mulxmm("%xmm1", "%xmm3");
		addxmm("%xmm2", "%xmm9");
		addxmm("%xmm3", "%xmm11");
	}
	//[5]
	storexmm("%xmm4", c);
	storexmm("%xmm5", c+4);
	storexmm("%xmm6", c+8);
	storexmm("%xmm7", c+12);
	storexmm("%xmm8", c+2);
	storexmm("%xmm9", c+6);
	storexmm("%xmm10", c+10);
	storexmm("%xmm11", c+14);
}

