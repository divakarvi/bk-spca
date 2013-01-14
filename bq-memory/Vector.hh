#ifndef __MYVECTOR__
#define __MYVECTOR__
#include <assert.h>
#include <iostream>
#include <cstring>
#include <fstream>
#include <mkl.h>
using namespace std;
const double PI = 3.1415926535897932384e+00;
class Matrix;
extern "C" double dnrm2_(int *, double *, int *);
class Vector{
private:
  int size;
  double * data;
  int owner;
public:
  friend class Matrix;
  friend void shadow(Vector& v, Matrix& M);

  
public:
  //empty constructor
  Vector(){
    size = 0;
    data = NULL;
    owner = 0;
  }
  
  //only constructor to allocate space for data
  Vector(int  n){
    size = n;
    data = (double *)MKL_malloc(sizeof(double)*n, 64);
    owner = 1;
#ifdef DEBUG
    for(int i=0; i < size; i++)
      data[i] = -i;
#endif
  }
  
  
  //*this becomes shadow of Vector v (copy constructor)
  Vector(const Vector& v){
    size = v.size;
    data = v.data;
    owner = 0;
  } 
  
  //destructor, finds out if *this is a shadow or owns space
  ~Vector(){
    if(owner!=0)
      MKL_free(data);
  }

  //makes *this shadow v
  void shadow(const Vector& v){
    assert(!owner);
    size = v.size;
    data = v.data;
    owner = 0;
  }

  //make *this shadow dataptr
  void shadow(double *dataptr, int len){
    assert(!owner);
    size = len;
    data = dataptr;
    owner = 0;
  }

	
  //makes *this shadow v(i:i+len-1)
  void shadow(const Vector& v,  int i,  int len){ 
    int n;
    assert(!owner);
    assert((len>0)&&(i>=0));
    assert(i+len<=v.size);
    size = len;
    data = v.data + i;
    owner = 0;
  }
  
 
  //retuns length of (*this)
  int getSize() const{
    return size;
  }


  //use with care!
  double * getRawData() const{
    return data;
  }
 

  //returns (*this)(i)
  double& operator()(int i){
    assert(i < size);
    return(data[i]);
  }
  
  //returns (*this)(i)
  const double& operator()(int i) const{
    assert(i<size);
    return(data[i]);
  }
		
  
  //(*this)(i) = v(i) for all i
  Vector& operator=(const Vector& v){
    assert(size==v.size);
    assert(((data<v.data)&&((data+size-1)<v.data))||
	   ((data>v.data)&& (data>(v.data+size-1)))||
	   (data==v.data)); //no overlap 
                            //but allow data==v.data
    if(data==v.data)
      return *this;
    memcpy((char *)data, (char *)v.data, 
	   size*sizeof(double));
    return(*this);
  }


  //*this = *this + v
  void add(const Vector& v){
    assert(size == v.size);
    for(int i=0; i < size; i++)
      data[i] += (v.data)[i];
  }

  //*this = *this - v
  void sub(const Vector& v){
    assert(size == v.size);
    for(int i=0; i < size; i++)
      data[i] -= (v.data)[i];
  }

  //*this = *this .* v
  void mul(const Vector& v){
    assert(size == v.size);
    for(int i=0; i < size; i++)
      data[i] *= (v.data)[i];
  }

  //*this = *this ./ v
  void div(const Vector& v){
    assert(size == v.size);
    for(int i=0; i < size; i++)
      data[i] /= (v.data)[i];
  }

  //*this = x * (*this)
  void scale(const double x){
    for(int i=0; i < size; i++)
      data[i] *= x;
  }

  //*this = *this + x
  void add_constant(const double x){
    for(int i=0; i < size; i++)
      data[i] += x;
  }

  //returns 2-norm of *this
  double norm() const{
    int dim = size;
    double * vec = data;
    int stride = 1;
    return dnrm2_(&dim, vec, &stride); 
  }

  //output vector to file fname
  void output(const char* fname, int digits=18)const{
    ofstream ofile(fname);
    assert(!ofile.fail());
    ofile.setf(ios::scientific, ios::floatfield);
    ofile.precision(digits);
    int i;
    for(i=0; i < size; i++)
      ofile<<(*this)(i)<<endl;
    ofile.close();
  }

  //input vector from file fname
  void input(const char* fname){
    ifstream ifile(fname);
    assert(!ifile.fail());
    int i;
    for(i=0; i < size; i++){
      assert(!ifile.eof());
      ifile>>(*this)(i);
      if(ifile.fail()){
	cout<<"Possible underflow in input from "<<fname<<endl;
	ifile.clear();
      }
    }
    ifile.close();
  }

};

void lufactorize(Matrix& M, int * ipiv);//M can be rectangular
void lusolve(Matrix& M, int * ipiv, Vector& v);//M must be square

#endif
