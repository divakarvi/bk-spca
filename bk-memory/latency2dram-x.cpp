int unitstride(int *a){
  int sum=0;
  for(int i=0; i < 1000*1000*1000; i++)
    sum += a[i];
  return sum;
}

int stride16(int *a){
  int sum=0;
  for(int i=0; i < 1000*1000*1000; i+=16)
    sum += a[i];
  return sum;
}

//List must be 64 byte aligned
void accessList(long int *List, long int n, int count, double &x){
  long int  index = 0;
  for(int i=0; i < count; i++){
    x += List[index];
    index = List[index]%n;
    index = index - index%8;
  }
    
}
