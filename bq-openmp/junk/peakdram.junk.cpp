double sum_onecore_blk_stride(double *list, long int n,
			      int blksize, int stride){
  assert(n%24==0);
  zeroxmm("%xmm0");
  zeroxmm("%xmm1");
  zeroxmm("%xmm2");
  zeroxmm("%xmm3"); 
  for(long int i=0; i < n; i = i+8*blksize*stride){
    for(int j=0; j < blksize; j++){
      loadxmm(list+i+8*j, "%xmm4");
      addxmm("%xmm4", "%xmm0");
      loadxmm(list+i+2+8*j,"%xmm5");
      addxmm("%xmm5", "%xmm1");
      loadxmm(list+i+4+8*j, "%xmm6");
      addxmm("%xmm6", "%xmm2");
      loadxmm(list+i+6+8*j, "%xmm7");
      addxmm("%xmm7", "%xmm3");
    }
  }
  __declspec(align(16)) double s[8];
  storexmm("%xmm0", s);
  storexmm("%xmm1", s+2);
  storexmm("%xmm2", s+4);
  storexmm("%xmm3", s+6);
  return s[0]+s[1]+s[2]+s[3]+s[4]+s[5]+s[6]+s[7];
}

void bw_twocore_nonnuma_interleave(long int n){
  double *list = (double *)MKL_malloc(2*n*sizeof(double), 4096);
  for(long int i=0; i < 2*n; i++){
    list[i] = 2.0*rand()/RAND_MAX;
    if((i/8)%2==1)
      list[i]*=2;
  }
  for(long int i=0; i < 2*n; i++)
    _mm_clflush(list+i);
#pragma omp parallel\
  num_threads(2)\
  default(none)\
  shared(n, cout, list)
  {
    int tid = omp_get_thread_num();
  #pragma omp barrier
    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore_stride(list+8*tid, 2*n, 2);
  #pragma omp barrier
  #pragma omp critical
      {
	double cycles = clk.toc();
	cout<<"tid = "<<tid<<" bandwidth = "<<
	  2.0*n*8.0/cycles<<" bytes/cycle"<<" ";
	cout<<"avg of sum - 1 = "<<sum/n-1<<endl;
      }
  }
  MKL_free(list);
}

void bw_twocore_nonnuma_block(long int n){
  double *list = (double *)MKL_malloc(2*n*sizeof(double), 4096);
  for(long int i=0; i < n; i++){
    list[i] = 2.0*rand()/RAND_MAX;
    list[i+n] = 2.0*2*rand()/RAND_MAX;
  }
  for(long int i=0; i < 2*n; i++)
    _mm_clflush(list+i);
#pragma omp parallel\
  num_threads(2)\
  default(none)\
  shared(n, cout, list)
  {
    int tid = omp_get_thread_num();
  #pragma omp barrier
    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore(list+n*tid, n);
  #pragma omp barrier
  #pragma omp critical
      {
	double cycles = clk.toc();
	cout<<"tid = "<<tid<<" bandwidth = "<<
	  2.0*n*8.0/cycles<<" bytes/cycle"<<" ";
	cout<<"avg of sum - 1 = "<<sum/n-1<<endl;
      }
  }
  MKL_free(list);
}

//with 2*m cores
void bw_evencore_numa_interleave(long int n, int m){
  double *glist = (double *)MKL_malloc(2*m*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(2*m)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist+(tid%2)*m*n;
    int offset = tid/2;
    list = list+8*offset;
    int stride = m;
    for(long int i=0; i < m*n; i=i+8*stride){
      for(int j=0; j < 8; j++)
	list[i+j] = 2.0*(tid+1)*rand()/RAND_MAX;
    }
    for(long int i=0; i < n; i=i+8*stride){
      for(int j=0; j < 8; j++)
	_mm_clflush(list+i+j);
    }
  #pragma omp barrier

    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    double sum=sum_onecore_stride(list, m*n, stride);
  #pragma omp barrier
  #pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"tid = "<<tid<<" bandwidth = "<<
	2.0*m*n*8.0/cycles<<" bytes/cycle"<<" ";
      cout<<"avg of sum = "<<sum/n-1<<endl;
    }
  }
  MKL_free(glist);
}

  //cout<<"bw_onestride()"<<endl;
  //bw_onecore_stride(n,1);

  //cout<<"bw_evencore_numa_interleave(n,1)"<<endl;
  //bw_evencore_numa_interleave(n,1);

  //cout<<"bw_evencore_numa_interleave(n,2)"<<endl;
  //bw_evencore_numa_interleave(n,2);

  //cout<<"bw_evencore_numa_interleave(n,3)"<<endl;
  //bw_evencore_numa_interleave(n,3);

  //cout<<"bw_evencore_numa_interleave(n,4)"<<endl;
  //bw_evencore_numa_interleave(n,4);

  //cout<<"bw_evencore_numa_interleave(n,5)"<<endl;
  //bw_evencore_numa_interleave(n,5);
  

  //cout<<"bw_evencore_numa_interleave(n,6)"<<endl;
  //bw_evencore_numa_interleave(n,6);

  //cout<<"bw_twocore_nonnuma_interleave()"<<endl;
  //bw_twocore_nonnuma_interleave(n);
  
  //cout<<"bw_twocore_nonuma_block()"<<endl;
  //bw_twocore_nonnuma_block(n);
  
