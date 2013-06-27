#include "Vector.hh"
#include "Matrix.hh"
#include "cVector.hh"
#include "Fourier1D.hh"
#include "TimeStamp.hh"
#include "StatVector.hh"
#include <iomanip>

//From Numerical Recipes in C, 2nd edition, p. 507
#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr
void four1(double data[], unsigned long nn, int isign){
	unsigned long n, mmax, m, j, istep, i;
	double wtemp, wr, wpr, wpi, wi, theta;
	double tempr, tempi;
  
	n=nn<<1;
	j=1;
	for(i=1;i<n;i+=2){
		if(j>i){
			SWAP(data[j],data[i]);
			SWAP(data[j+1],data[i+1]);
		}
		m=n>>1;
		while(m>=2 && j > m){
			j -= m;
			m >>= 1;
		}
		j += m;
	}
	mmax=2;
	while(n > mmax){
		istep=mmax<<1;
		theta=isign*(6.28318530717959/mmax);
		wtemp=sin(0.5*theta);
		wpr = -2.0*wtemp*wtemp;
		wpi=sin(theta);
		wr=1.0;
		wi=0.0;
		for(m=1;m<mmax;m+=2){
			for(i=m; i<=n;i+=istep){
				j=i+mmax;
				tempr=wr*data[j]-wi*data[j+1];
				tempi=wr*data[j+1]+wi*data[j];
				data[j]=data[i]-tempr;
				data[j+1]=data[i+1]-tempi;
				data[i]+=tempr;
				data[i+1]+=tempi;
			}
			wr=(wtemp=wr)*wpr-wi*wpi+wr;
			wi=wi*wpr+wtemp*wpi+wi;
		}
		mmax=istep;
	}
}

void inline nrbwd(cVector& v){
	four1(((double *)v.getRawData())-1,v.getSize(),1);
}

void inline nrbwd(double *v, int n){
	four1(v-1,n,1);
}

void testnr(){
	int n = 256;
	cVector v(n);
	cVector w(n);
	for(int i=0; i < n; i++){
		v(i)[0] = rand()*1.0/RAND_MAX - 0.5;
		v(i)[1] = rand()*1.0/RAND_MAX - 0.5;
	}
	Fourier1Dmkl ftrans(n);
	ftrans.bwd(v, w);
	nrbwd(v);
	v.sub(w);
	cout<<"num recipes error = "<<v.norm()<<endl;
	
}

void testlu(int n){
	Matrix A(n, n);
	Vector v(n);
	for(int i = 0; i < n; i++){
		v(i) = rand()*1.0/RAND_MAX-0.5;
		for(int j = 0; j < n; j++)
			A(i, j) = rand()*1.0/RAND_MAX - 0.5;
	}
	A.output("A.dat");
	int *ipiv;
	ipiv = new int[n];
	lufactorize(A, ipiv);
	v.output("b.dat");
	lusolve(A, ipiv, v);
	v.output("x.dat");
}

void testfouriermkl(int n){
	cVector v(n);
	for(int i=0; i < n; i++){
		v(i)[0] = rand()*1.0/RAND_MAX - 0.5;
		v(i)[1] = rand()*1.0/RAND_MAX - 0.5;
	}
	Fourier1Dmkl ftrans(n);
	cVector w(n);
	ftrans.fwd(v, w);
	v.output("v.dat");
	w.output("w.dat");
	cVector vv(n);
	ftrans.bwd(w, vv);
	v.sub(vv);
	cout<<"mkl fft fwd/bwd error = "<<v.norm()<<endl;
}

void testfourierfftw(int n){
	cVector v(n);
	for(int i=0; i < n; i++){
		v(i)[0] = rand()*1.0/RAND_MAX - 0.5;
		v(i)[1] = rand()*1.0/RAND_MAX - 0.5;
	}
	Fourier1Dfftw ftrans(n);
	cVector w(n);
	ftrans.fwd(v, w);
	v.output("vf.dat");
	w.output("wf.dat");
	cVector vv(n);
	ftrans.bwd(w, vv);
	v.sub(vv);
	cout<<"fftw fwd/bwd error = "<<v.norm()<<endl;
}

void timewcflag(int n, int cflag=0){
	int count = 1024*1024*100/n;
	cVector in(n);
	cVector out(n);
	Fourier1Dmkl ftransmkl(n);
	Fourier1Dfftw ftransfftw(n);
	TimeStamp clkticks;
	StatVector stats(count);
	for(int index=0; index < count; index++){
		for(int i=0; i < n; i++){
			in(i)[0] = rand()*1.0/RAND_MAX-0.5;
			in(i)[1] = rand()*1.0/RAND_MAX-0.5;
		}
		if(cflag !=0 )
			for(int i=0; i < n; i++){
				_mm_clflush(in.getRawData()+i);
				_mm_clflush(out.getRawData()+i);
			}
		clkticks.tic();
		ftransmkl.bwd(in, out);
		double tintvl = clkticks.toc();
		stats.insert(tintvl);
	}
	double mklcycles = stats.median();
	
	stats.flush();
	for(int index=0; index < count; index++){
		for(int i=0; i < n; i++){
			in(i)[0] = rand()*1.0/RAND_MAX-0.5;
			in(i)[1] = rand()*1.0/RAND_MAX-0.5;
		}
		if(cflag !=0 )
			for(int i=0; i < n; i++){
				_mm_clflush(in.getRawData()+i);
				_mm_clflush(out.getRawData()+i);
			}
		clkticks.tic();
		ftransfftw.bwd(in, out);
		double tintvl = clkticks.toc();
		stats.insert(tintvl);
	}
	double fftwcycles = stats.median();
	
	int nn=n;
	while(nn > 1){
		if(nn%2==1){
			printf("%15d   %.1e  %.1e  %.1e \n", n, mklcycles, fftwcycles, -1.0);
			return;
		}
		nn /= 2;
	}
  stats.flush();
  for(int index=0; index < count; index++){
	  for(int i=0; i < n; i++){
		  in(i)[0] = rand()*1.0/RAND_MAX-0.5;
		  in(i)[1] = rand()*1.0/RAND_MAX-0.5;
	  }
	  if(cflag !=0 )
		  for(int i=0; i < n; i++){
			  _mm_clflush(in.getRawData()+i);
			  _mm_clflush(out.getRawData()+i);
		  }
	  clkticks.tic();
	  nrbwd(in);
	  double tintvl = clkticks.toc();
	  stats.insert(tintvl);
  }
  
  double nrcycles = stats.median();
  printf("%15d   %.1e  %.1e  %.1e \n", n, mklcycles, fftwcycles, nrcycles);
}

void timesequential(int n){
	int count = 1024*1024*100/n;
	cVector vin(n*count);
	double *iptr = (double *)vin.getRawData();
	cVector vout(n*count);
	double *optr = (double *)vout.getRawData();
	Fourier1Dmkl ftransmkl(n);
	Fourier1Dfftw ftransfftw(n);
	for(int i=0; i < 2*n*count; i++){
		iptr[i] =  rand()*1.0/RAND_MAX-0.5;
	}
	
	TimeStamp clk;
	clk.tic();
	for(int i=0; i < count; i++)
		ftransmkl.bwd(iptr+2*n*i, optr+2*n*i);
	double mklcycles = clk.toc()/count;
	
	clk.tic();
	for(int i=0; i < count; i++)
		ftransfftw.bwd(iptr+2*n*i, optr+2*n*i);
	double fftwcycles = clk.toc()/count;
	
	int nn=n;
	while(nn > 1){
		if(nn%2==1){
			printf("%15d   %.1e  %.1e  %.1e \n", 
			       n, mklcycles, fftwcycles, -1.0);
			return;
		}
		nn /= 2;
	}
	clk.tic();
	for(int i=0; i < count; i++)
		nrbwd(iptr+2*n*i, n);
	double nrcycles = clk.toc()/count;
	printf("%15d   %.1e  %.1e  %.1e \n", n, mklcycles, fftwcycles, nrcycles);
}

void timingoutput(){
	cout<<setw(30)<<"in cache"<<endl;
	timewcflag(32);
	timewcflag(64);
	timewcflag(80);
	timewcflag(8*3*7);
	timewcflag(192);
	timewcflag(1024);
	timewcflag(1024*128);
	timewcflag(1024*1024);
	
	

	cout<<setw(30)<<"cache flush"<<endl;
	timewcflag(32, 1);
	timewcflag(64, 1);
	timewcflag(80, 1);
	timewcflag(8*3*7, 1);
	timewcflag(192, 1);
	timewcflag(1024, 1);
	timewcflag(1024*128, 1);
	timewcflag(1024*1024, 1);
	


	cout<<setw(30)<<"sequential"<<endl;
	timesequential(32);
	timesequential(64);
	timesequential(80);
	timesequential(8*3*7);
	timesequential(192);
	timesequential(1024);
	timesequential(1024*128);
	timesequential(1024*1024);
}

int main(){
	//testlu(100);
	//testfouriermkl(100);
	//testfourierfftw(200);
	//testnr();
	
	//timingoutput();
	timesequential(1024);
	timesequential(1024*12);
}
