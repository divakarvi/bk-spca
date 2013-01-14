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

//R1 and R2 must be "%xmmi" 0<=i<=15
#define shufxmm0(R1, R2)					\
  asm volatile("shufpd $0, %" R1 ", %" R2"\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15
#define shufxmm1(R1, R2)					\
  asm volatile("shufpd $1, %" R1 ", %" R2"\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15
#define shufxmm2(R1, R2)					\
  asm volatile("shufpd $2, %" R1 ", %" R2"\n\t":::R1, R2);

//R1 and R2 must be "%xmmi" 0<=i<=15
#define shufxmm3(R1, R2)					\
  asm volatile("shufpd $3, %" R1 ", %" R2"\n\t":::R1, R2);

//compiler has a tendency to garble xmm0 or xmm1 here,
//could be because of iostream?
//it is legal for compiler to garble, however
//bottom line: can't assume that the compiler generates intended code here
void runshuffle(){
  __declspec(align(16)) double a[100];

  {
    a[0] = 1;
    a[1] = 2;
    loadxmm(a, "%xmm0");
    flipxmm("%xmm0");
    storexmm("%xmm0", a);
    
    cout<<a[0]<<"  "<<a[1]<<"  expect (2, 1)"<<endl;
  }
  
  {
    a[0] = 0;
    a[1] = 1;
    a[2] = 2;
    a[3] = 3;
    loadxmm(a, "%xmm0");
    loadxmm(a+2, "%xmm1");
    movxmm("%xmm1", "%xmm2");
    shufxmm0("%xmm0", "%xmm2");
    storexmm("%xmm2", a+4);
    cout<<a[4]<<"  "<<a[5]<<"  expect (2, 0)"<<endl;
  }

  {
    a[0] = 0;
    a[1] = 1;
    a[2] = 2;
    a[3] = 3;
    loadxmm(a, "%xmm0");
    loadxmm(a+2, "%xmm1");
    movxmm("%xmm1", "%xmm2");
    shufxmm1("%xmm0", "%xmm2");
    storexmm("%xmm2", a+4);
    cout<<a[4]<<"  "<<a[5]<<"  expect (3, 0)"<<endl;
  }

  {
    a[0] = 0;
    a[1] = 1;
    a[2] = 2;
    a[3] = 3;
    loadxmm(a, "%xmm0");
    loadxmm(a+2, "%xmm1");
    movxmm("%xmm1", "%xmm2");
    shufxmm2("%xmm0", "%xmm2");
    storexmm("%xmm2", a+4);
    cout<<a[4]<<"  "<<a[5]<<"  expect (2, 1)"<<endl;
  }

  {
    a[0] = 0;
    a[1] = 1;
    a[2] = 2;
    a[3] = 3;
    loadxmm(a, "%xmm0");
    loadxmm(a+2, "%xmm1");
    movxmm("%xmm1", "%xmm2");
    shufxmm3("%xmm0", "%xmm2");
    storexmm("%xmm2", a+4);
    cout<<a[4]<<"  "<<a[5]<<"  expect (3, 1)"<<endl;
  }
}

//mult 2x4 and 4x4 to get 2x4
//c = c+a*b (interpret as matrices)
void multxmm2x4x4A(double *a, double *b, double *c, 
		   long int lda, long int ldb, long int ldc){
  //[1]
  loadxmm(b, "%xmm0");  
  loadxmm(b+ldb, "%xmm12");
  movxmm("%xmm0", "%xmm2");
  shufxmm0("%xmm12", "%xmm0");
  shufxmm3("%xmm12", "%xmm2");

  
  //[3]
  loadxmm(c, "%xmm8");
  loadxmm(c+ldc, "%xmm9");

  //[5]
  loadxmm(a, "%xmm13");
  loadxmm(a, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");

  mulxmm("%xmm0", "%xmm12");
  addxmm("%xmm12", "%xmm8");
  
  mulxmm("%xmm0", "%xmm13");
  addxmm("%xmm13", "%xmm9");
  //[2]---->
  loadxmm(b+2*ldb, "%xmm1"); 
  loadxmm(b+3*ldb, "%xmm12");
  movxmm("%xmm1", "%xmm3");
  shufxmm0("%xmm12", "%xmm1");
  shufxmm3("%xmm12", "%xmm3");
  //[2]<----
  //[4]---->
  loadxmm(c+2*ldc, "%xmm10");
  loadxmm(c+3*ldc, "%xmm11");
  //[4]<----
  mulxmm("%xmm1", "%xmm14");
  addxmm("%xmm14", "%xmm10");

  mulxmm("%xmm1", "%xmm15");
  addxmm("%xmm15", "%xmm11");

  //[6] 
  loadxmm(a+lda, "%xmm13");
  loadxmm(a+lda, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");

  mulxmm("%xmm2", "%xmm12");
  addxmm("%xmm12", "%xmm8");
  
  mulxmm("%xmm2", "%xmm13");
  addxmm("%xmm13", "%xmm9");

  mulxmm("%xmm3", "%xmm14");
  addxmm("%xmm14", "%xmm10");
  
  mulxmm("%xmm3", "%xmm15");
  addxmm("%xmm15", "%xmm11");

  //[7]
  loadxmm(b+2, "%xmm4");
  loadxmm(b+ldb+2, "%xmm12");
  movxmm("%xmm4", "%xmm6");
  shufxmm0("%xmm12", "%xmm4");
  shufxmm3("%xmm12", "%xmm6");

  //[9]
  loadxmm(a+2*lda, "%xmm13");
  loadxmm(a+2*lda, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");

  mulxmm("%xmm4", "%xmm12");
  addxmm("%xmm12", "%xmm8");

  mulxmm("%xmm4", "%xmm13");
  addxmm("%xmm13", "%xmm9");
  //[8]----> 
  loadxmm(b+2*ldb+2, "%xmm5");
  loadxmm(b+3*ldb+2, "%xmm12");
  movxmm("%xmm5", "%xmm7");
  shufxmm0("%xmm12", "%xmm5");
  shufxmm3("%xmm12", "%xmm7");
  //[8]<----
  mulxmm("%xmm5", "%xmm14");
  addxmm("%xmm14", "%xmm10");

  mulxmm("%xmm5", "%xmm15");
  addxmm("%xmm15", "%xmm11");


  //[10]
  loadxmm(a+3*lda, "%xmm13");
  loadxmm(a+3*lda, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");
    
  mulxmm("%xmm6", "%xmm12");
  addxmm("%xmm12", "%xmm8");

  mulxmm("%xmm6", "%xmm13");
  addxmm("%xmm13", "%xmm9");
  
  
  mulxmm("%xmm7", "%xmm14");
  addxmm("%xmm14", "%xmm10");

  mulxmm("%xmm7", "%xmm15");
  addxmm("%xmm15", "%xmm11");

  //[11]  
  storexmm("%xmm8", c);
  storexmm("%xmm9", c+ldc);

  //[12]
  storexmm("%xmm10", c+2*ldc);
  storexmm("%xmm11", c+3*ldc);
}


//mult 2x4 and 4x4 to get 2x4
//c = c+a*b (interpret as matrices)
void multxmm2x4x4B(double *a, double *b, double *c, 
		  long int lda, long int ldb, long int ldc){
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
  for(long int i=0; i < (long)1000*1000*1000;i++){
   //[1]
    //loadxmm(b, "%xmm0");  
    //loadxmm(b+ldb, "%xmm12");
    //movxmm("%xmm0", "%xmm2");
    //shufxmm0("%xmm12", "%xmm0");
    //shufxmm3("%xmm12", "%xmm2");

  
  //[3]
  loadxmm(c, "%xmm8");
  loadxmm(c+ldc, "%xmm9");

  //[5]
  loadxmm(a, "%xmm12");
  loadxmm(a, "%xmm13");
  flipxmm("%xmm13");
  movxmm("%xmm12", "%xmm14");
  movxmm("%xmm13", "%xmm15");
  
  mulxmm("%xmm0", "%xmm12");
  addxmm("%xmm12", "%xmm8");
  
  mulxmm("%xmm0", "%xmm13");
  addxmm("%xmm13", "%xmm9");
  //[2]---->
  //loadxmm(b+2*ldb, "%xmm1"); 
  //loadxmm(b+3*ldb, "%xmm12");
  //movxmm("%xmm1", "%xmm3");
  //shufxmm0("%xmm12", "%xmm1");
  //shufxmm3("%xmm12", "%xmm3");
  //[2]<----
  //[4]---->
  loadxmm(c+2*ldc, "%xmm10");
  loadxmm(c+3*ldc, "%xmm11");
  //[4]<----
  mulxmm("%xmm1", "%xmm14");
  addxmm("%xmm14", "%xmm10");

  mulxmm("%xmm1", "%xmm15");
  addxmm("%xmm15", "%xmm11");

  //[6] 
  loadxmm(a+lda, "%xmm13");
  loadxmm(a+lda, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");

  mulxmm("%xmm2", "%xmm12");
  addxmm("%xmm12", "%xmm8");
  
  mulxmm("%xmm2", "%xmm13");
  addxmm("%xmm13", "%xmm9");

  mulxmm("%xmm3", "%xmm14");
  addxmm("%xmm14", "%xmm10");
  
  mulxmm("%xmm3", "%xmm15");
  addxmm("%xmm15", "%xmm11");

  //[7]
  //loadxmm(b+2, "%xmm4");
  //loadxmm(b+ldb+2, "%xmm12");
  //movxmm("%xmm4", "%xmm6");
  //shufxmm0("%xmm12", "%xmm4");
  //shufxmm3("%xmm12", "%xmm6");

  //[9]
  loadxmm(a+2*lda, "%xmm13");
  loadxmm(a+2*lda, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");

  mulxmm("%xmm4", "%xmm12");
  addxmm("%xmm12", "%xmm8");

  mulxmm("%xmm4", "%xmm13");
  addxmm("%xmm13", "%xmm9");
  //[8]----> 
  //loadxmm(b+2*ldb+2, "%xmm5");
  //loadxmm(b+3*ldb+2, "%xmm12");
  //movxmm("%xmm5", "%xmm7");
  //shufxmm0("%xmm12", "%xmm5");
  //shufxmm3("%xmm12", "%xmm7");
  //[8]<----
  mulxmm("%xmm5", "%xmm14");
  addxmm("%xmm14", "%xmm10");

  mulxmm("%xmm5", "%xmm15");
  addxmm("%xmm15", "%xmm11");


  //[10]
  loadxmm(a+3*lda, "%xmm13");
  loadxmm(a+3*lda, "%xmm12");
  flipxmm("%xmm13");
  movxmm("%xmm13", "%xmm15");
  movxmm("%xmm12", "%xmm14");
    
  mulxmm("%xmm6", "%xmm12");
  addxmm("%xmm12", "%xmm8");

  mulxmm("%xmm6", "%xmm13");
  addxmm("%xmm13", "%xmm9");
  
  
  mulxmm("%xmm7", "%xmm14");
  addxmm("%xmm14", "%xmm10");

  mulxmm("%xmm7", "%xmm15");
  addxmm("%xmm15", "%xmm11");

  //[11]  
  //storexmm("%xmm8", c);
  //storexmm("%xmm9", c+ldc);

  //[12]
  //storexmm("%xmm10", c+2*ldc);
  //storexmm("%xmm11", c+3*ldc); 
  }
}


