#include "multxmm.hh"

//R must be "%xmmi" 0<=i<=15
#define zeroxmm(R)				\
  asm volatile("pxor %" R ", %" R "\n\t":::R);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define addxmm(R1, R2)					\
  asm volatile("addpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define mulxmm(R1, R2)					\
  asm volatile("mulpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define movxmm(R1, R2)					\
  asm volatile("movaps %" R1 ", %" R2 "\n\t":::R1, R2);

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define loadxmm(a, R)					\
  asm volatile("movaps %0, %" R "\n\t"::"m"(*(a)):R);	

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define storexmm(R, a)					\
  asm volatile("movaps %" R ", %0 \n\t":"=m"(*(a))::R);	

//R = "%xmmi" 0<=i<=15
#define flipxmm(R)				\
  asm volatile("shufpd $1, %" R ", %" R"\n\t":::R);


//mult 4x1 and 1x4 to get 4x4
//c = c+a*b (interpret as matrices)
void multxmm4x1x4(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc){
  //[1]
  loadxmm(c, "%xmm4");
  loadxmm(c+ldc, "%xmm5");
  loadxmm(c+2*ldc, "%xmm6");
  loadxmm(c+3*ldc, "%xmm7");
  loadxmm(c+2, "%xmm8");
  loadxmm(c+ldc+2, "%xmm9");
  loadxmm(c+2*ldc+2, "%xmm10");
  loadxmm(c+3*ldc+2, "%xmm11");

  //[2]
  loadxmm(b, "%xmm0");
  loadxmm(b+2*ldb, "%xmm1");
  //[3]
  loadxmm(a, "%xmm2");
  movxmm("%xmm2", "%xmm3");
  //[4]
  mulxmm("%xmm0", "%xmm2");
  addxmm("%xmm2", "%xmm4");
  mulxmm("%xmm1", "%xmm3");
  addxmm("%xmm3", "%xmm6");
  //[5]
  loadxmm(a, "%xmm2");
  flipxmm("%xmm2");
  movxmm("%xmm2", "%xmm3");
  //[6]
  mulxmm("%xmm0", "%xmm2");
  addxmm("%xmm2", "%xmm5");
  mulxmm("%xmm1", "%xmm3");
  addxmm("%xmm3", "%xmm7");
  //[7]
  loadxmm(a+2, "%xmm2");
  movxmm("%xmm2", "%xmm3");
  //[8]
  mulxmm("%xmm0", "%xmm2");
  addxmm("%xmm2", "%xmm8");
  mulxmm("%xmm1", "%xmm3");
  addxmm("%xmm3", "%xmm10");
  //[9]
  loadxmm(a+2, "%xmm2");
  flipxmm("%xmm2");
  movxmm("%xmm2", "%xmm3");
  //[10]
  mulxmm("%xmm0", "%xmm2");
  addxmm("%xmm2", "%xmm9");
  mulxmm("%xmm1", "%xmm3");
  addxmm("%xmm3", "%xmm11");

  //[11]
  storexmm("%xmm4", c);
  storexmm("%xmm5", c+ldc);
  storexmm("%xmm6", c+2*ldc);
  storexmm("%xmm7", c+3*ldc);
  storexmm("%xmm8", c+2);
  storexmm("%xmm9", c+ldc+2);
  storexmm("%xmm10", c+2*ldc+2);
  storexmm("%xmm11", c+3*ldc+2);
}

//iterate above while keeping c out of loop
void multxmm4x1x4R(double *a, double *b, double *c, 
			 long int lda, long int ldb, long int ldc){
  //[1]
  loadxmm(c, "%xmm4");
  loadxmm(c+ldc, "%xmm5");
  loadxmm(c+2*ldc, "%xmm6");
  loadxmm(c+3*ldc, "%xmm7");
  loadxmm(c+2, "%xmm8");
  loadxmm(c+ldc+2, "%xmm9");
  loadxmm(c+2*ldc+2, "%xmm10");
  loadxmm(c+3*ldc+2, "%xmm11");
  for(long int i=0; i < 1000*1000*1000; i++){
    //[3]
    loadxmm(a, "%xmm2");
    loadxmm(b, "%xmm0");
    mulxmm("%xmm0", "%xmm2");
    loadxmm(a+2, "%xmm3");
    movxmm("%xmm3", "%xmm12");
    mulxmm("%xmm0", "%xmm3")
    addxmm("%xmm2", "%xmm4");
    addxmm("%xmm3", "%xmm8");

    loadxmm(b+2, "%xmm1");
    mulxmm("%xmm1", "%xmm12");
    loadxmm(a, "%xmm2")
    mulxmm("%xmm1", "%xmm2");
    addxmm("%xmm2", "%xmm6");
    addxmm("%xmm3", "%xmm10");
    

    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm1", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm3", "%xmm7");
    addxmm("%xmm2", "%xmm5");

    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm2", "%xmm9");
    addxmm("%xmm3", "%xmm11"); 
  }
  //[11]
  storexmm("%xmm4", c);
  storexmm("%xmm5", c+ldc);
  storexmm("%xmm6", c+2*ldc);
  storexmm("%xmm7", c+3*ldc);
  storexmm("%xmm8", c+2);
  storexmm("%xmm9", c+ldc+2);
  storexmm("%xmm10", c+2*ldc+2);
  storexmm("%xmm11", c+3*ldc+2);
}

//iterate with unroll=5
void multxmm4x1x4RU5(double *a, double *b, double *c, 
			 long int lda, long int ldb, long int ldc){
  //[1]
  loadxmm(c, "%xmm0");
  loadxmm(c+2*ldc, "%xmm2");
  loadxmm(c+ldc, "%xmm1");
  loadxmm(c+3*ldc, "%xmm3");
  loadxmm(c+2, "%xmm4");
  loadxmm(c+2*ldc+2, "%xmm6");
  loadxmm(c+ldc+2, "%xmm5");
  loadxmm(c+3*ldc+2, "%xmm7");
  for(long int i=0; i < 1000*1000*1000/8; i++){
    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");
    
    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");
    
    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    //[3]
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[4]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    //[5]
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[6]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    //[7]
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[8]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    //[9]
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    //[10]
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");
  }
  //[11]
  storexmm("%xmm4", c);
  storexmm("%xmm5", c+ldc);
  storexmm("%xmm6", c+2*ldc);
  storexmm("%xmm7", c+3*ldc);
  storexmm("%xmm8", c+2);
  storexmm("%xmm9", c+ldc+2);
  storexmm("%xmm10", c+2*ldc+2);
  storexmm("%xmm11", c+3*ldc+2);
}

//iterate with unroll=20
void multxmm4x1x4RU(double *a, double *b, double *c, 
		     long int lda, long int ldb, long int ldc){
  loadxmm(c, "%xmm4");
  loadxmm(c+ldc, "%xmm5");
  loadxmm(c+2*ldc, "%xmm6");
  loadxmm(c+3*ldc, "%xmm7");
  loadxmm(c+2, "%xmm8");
  loadxmm(c+ldc+2, "%xmm9");
  loadxmm(c+2*ldc+2, "%xmm10");
  loadxmm(c+3*ldc+2, "%xmm11");
  for(long int i=0; i < 1000*1000*1000/20; i++){
    //[1]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

    asm volatile("lea (%rdi, %rcx), %rdi \t\n");
    asm volatile("lea (%rsi, %r8), %rsi \t\n");
    //[2]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[3]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[4]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");

 
    //[5]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[6]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[7]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[8]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[9]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[10]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[11]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[12]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[13]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[14]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[15]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[16]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[17]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[18]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[19]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");


    //[20]
    loadxmm(b, "%xmm0");
    loadxmm(b+2*ldb, "%xmm1");
    loadxmm(a, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm4");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm6");
    loadxmm(a, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm5");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm7");
    loadxmm(a+2, "%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm8");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm10");
    loadxmm(a+2, "%xmm2");
    flipxmm("%xmm2");
    movxmm("%xmm2", "%xmm3");
    mulxmm("%xmm0", "%xmm2");
    addxmm("%xmm2", "%xmm9");
    mulxmm("%xmm1", "%xmm3");
    addxmm("%xmm3", "%xmm11");
  }


  storexmm("%xmm4", c);
  storexmm("%xmm5", c+ldc);
  storexmm("%xmm6", c+2*ldc);
  storexmm("%xmm7", c+3*ldc);
  storexmm("%xmm8", c+2);
  storexmm("%xmm9", c+ldc+2);
  storexmm("%xmm10", c+2*ldc+2);
  storexmm("%xmm11", c+3*ldc+2);
}

