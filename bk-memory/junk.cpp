//R must be "%xmmi" 0<=i<=15 
#define addmemxmm(a, R)				\
  asm volatile("addpd %0, %" R "\n\t"::"m"(*(a)):R);

//R must be "%xmmi" 0<=i<=15 
//#define mulmemxmm(a, R)				\
//asm volatile("mulpd %0, %" R "\n\t"::"m"(*(a)):R);	

//a[0..n-1] and b[0..n-1]
//both arrays are assumed to be in L1 cache
//a = a+b (repeat count times)
//n is assumed to be a multiple of 8
void addarray(double *a, double *b, int n, long int count){
  for(long int c=0; c < count; c++)
    for(int i=0; i < n; i += 8){
      loadxmm(a+i, "%xmm0");
      addmemxmm(b+i,"%xmm0");
      storexmm("%xmm0", a+i);
      
      loadxmm(a+i+2, "%xmm1");
      addmemxmm(b+i+2,"%xmm1");
      storexmm("%xmm1", a+i+2);
      
      loadxmm(a+i+4, "%xmm2");
      addmemxmm(b+i+4,"%xmm2");
      storexmm("%xmm2", a+i+4);
      
      loadxmm(a+i+6, "%xmm3");
      addmemxmm(b+i+6,"%xmm3");
      storexmm("%xmm3", a+i+6);
    }
}



void runaddarray(){
  const int n = 1024;
  cout<<"n = "<<n<<endl;
   __declspec(align(64)) double a[2*n];
   double *b = a+n;
   for(int i=0; i < n; i++){
     a[i] = 0;
     b[i] = i;
   }
   long int count = 1000*1000*100;
   TimeStamp clk;
   clk.tic();
   addarray(a, b, n, count);
   double cycles = clk.toc();
   for(int i=n/4; i < n/4+20; i++)
     cout<<"i = "<<i<<"  a[i]/count = "<<a[i]/count<<endl;
   cout<<"cycles per addition = "<<cycles/n/count<<endl;
}


void addarrayx(double *a, double *b, int n, long int count){
  loadxmm(b,"%xmm4");
  loadxmm(b+2,"%xmm5");
  loadxmm(b+4,"%xmm6");
  loadxmm(b+6,"%xmm7");
  for(long int c=0; c < count; c++)
    for(int i=0; i < n; i += 8){
      loadxmm(a+i, "%xmm0");
      addxmm("%xmm4","%xmm0");
      storexmm("%xmm0", a+i);

      loadxmm(a+i+2, "%xmm0");
      addxmm("%xmm5","%xmm0");
      storexmm("%xmm0", a+i+2);
      
      loadxmm(a+i+4, "%xmm0");
      addxmm("%xmm6","%xmm0");
      storexmm("%xmm0", a+i+4);

      loadxmm(a+i+6, "%xmm0");
      addxmm("%xmm7","%xmm0");      
      storexmm("%xmm0", a+i+6);
    }
}

void addarrayxx(double *a, double *b, int n, long int count){
  loadxmm(b,"%xmm4");
  loadxmm(b+2,"%xmm5");
  loadxmm(b+4,"%xmm6");
  loadxmm(b+6,"%xmm7");
  for(long int c=0; c < count; c++){
    for(int i=0; i < n; i += 16){
      loadxmm(a+i, "%xmm0");
      addxmm("%xmm4","%xmm0");
      storexmm("%xmm0", a+i);

      loadxmm(a+i+2, "%xmm0");
      addxmm("%xmm5","%xmm0");
      storexmm("%xmm0", a+i+2);
      
      loadxmm(a+i+4, "%xmm0");
      addxmm("%xmm6","%xmm0");
      storexmm("%xmm0", a+i+4);

      loadxmm(a+i+6, "%xmm0");
      addxmm("%xmm7","%xmm0");      
      storexmm("%xmm0", a+i+6);

      loadxmm(a+i+8, "%xmm0");
      addxmm("%xmm4","%xmm0");
      storexmm("%xmm0", a+i+8);

      loadxmm(a+i+10, "%xmm0");
      addxmm("%xmm5","%xmm0");
      storexmm("%xmm0", a+i+10);
      
      loadxmm(a+i+12, "%xmm0");
      addxmm("%xmm6","%xmm0");
      storexmm("%xmm0", a+i+12);

      loadxmm(a+i+14, "%xmm0");
      addxmm("%xmm7","%xmm0");      
      storexmm("%xmm0", a+i+14);
    }
  }
}

//a = void * 
#define loadrax(a)					\
  asm volatile("movl %0, %%eax \n\t"::"m"(*(a)):"%eax");	


void sequential(){
  int a[1000*1000*1000];
  for(int i=0; i < 1000*1000*1000; i++)
    a[i] = 0;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*1000; i++)
    loadrax(a+i);
  double cycles = clk.toc();
  cout<<"cycles per access = "<<
    cycles/1000/1000/1000<<endl;
}


void stride(){
  int a[1000*1000*1000];
  for(int i=0; i < 1000*1000*1000; i++)
    a[i] = 0;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 1000*1000*1000; i+=16)
    loadrax(a+i);
  double cycles = clk.toc();
  cout<<"cycles per access = "<<
    cycles/(1000.0*1000*1000/16)<<endl;
}


//List must be 64 byte aligned
void accessList(long int *List, long int n, int count){
  long int  index = 0;
  for(int i=0; i < count; i++){
    loadrax(List+index);
    index = List[index]%n;
    index = index - index%8;
  }
    
}
