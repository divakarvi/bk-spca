#include "easyxmm.hh"
#include <cstdio>

/*
 * the assembly of runmacro() must be inspected to ensure code is correct.
 * it is legal for the compiler to reuse xmm0 and xmm1 to store temp
 * data in-between the four macro calls here
 */
void xmmtest(){
	__declspec(align(16)) double a[2]={1,2};
	__declspec(align(16)) double b[2]={-1,-2};
	loadxmm(a, "%xmm0");
	loadxmm(b, "%xmm1");
	addxmm("%xmm1", "%xmm0");
	storexmm("%xmm0", a);
	printf("%f %f \n", a[0], a[1]);
}

int main(){
	xmmtest();
}
