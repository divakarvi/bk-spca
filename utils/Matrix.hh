#ifndef __MYMATRIX__
#define __MYMATRIX__
#include "Vector.hh"
#include <assert.h>
#include <iostream>
#include <fstream>
#include <math.h>
#include <stdio.h>

using namespace std;

class Matrix{
private:
	int size1;
	int size2;
	int lda;
	double *data;
	int owner;
public:
	friend class Vector;
public:
	//empty constructor
	Matrix(){
		size1 = 0;
		size2 = 0;
		lda = 0;
		data = NULL;
		owner = 0;
	}
  
	//only constructor to actually allocate space for data
	Matrix(int m, int n){
		size1 = m;
		size2 = n;
		lda = m;
		data = (double *)MKL_malloc(m*n*sizeof(double), 64);
		owner = 1;
		for(int i=0; i < size1*size2; i++)
			data[i] = -i;
	}

    
	//copy constructor, makes *this a shadow of M
	Matrix(const Matrix& M){
		size1 = M.size1;
		size2 = M.size2;
		lda = M.lda;
		data = M.data;
		owner = 0;
	}

	//destructor, checks if *this is a shadow or owns space
	~Matrix(){
		if(owner!=0)
			MKL_free(data);
	}
	
	//make *this a shadow of dataptr
	void shadow(double *dataptr, int m, int n){
		assert(!owner);
		size1 = m;
		size2 = n;
		lda = m;
		data = dataptr;
		owner = 0;
	}
	
	//makes *this a shadow of M
	void shadow(const Matrix & M){
		assert(!owner);
		size1 = M.size1;
		size2 = M.size2;
		lda = M.lda;
		data = M.data;
		owner = 0;
  }

	//makes *this a shadow of M(i1:i2,j1:j2)
	void shadow(const Matrix & M, int i1, int j1, int m, int n){
		assert(!owner);
		assert((i1+m<=M.getm())&&(j1+n<=M.getn()));
		size1 = m;
		size2 = n;
		lda = M.lda;
		data = M.data + j1*lda+i1;
		owner = 0;
	}
	
	
	//makes *this an m by n matrix shadowing v(i1:i1+m*n-1)
	void shadow(const Vector& v, int i1, int m, int n){
		size1 = m;
		size2 = n;
		lda = m;
		data = v.data + i1;
		owner = 0;
	}
	

	//returns number of rows of *this
	int getm() const{
		return size1;
	}
	
	//returns number of columns of *this
	int getn() const{
		return size2;
	}
	

	//use with care!
	double * getRawData() const{
		return data;
	}
  
	int getLDA() const{
		return lda;
	}
	
	//returns reference to (i,j)th entry of *this
	double& operator()(int i, int j){
		assert(i<size1);
		assert(j<size2);
		return data[j*lda+i];
	}
	
	//returns reference ot (i,j)th entry of *this
	const double& operator()(int i, int j)const{
		assert(i<size1);
		assert(j<size2);
		return data[j*lda+i];
		
	}
	
  //*this(i,j) is set to M(i,j) for all (i,j)
	Matrix& operator=(const Matrix& M){
		assert((size1==M.size1)&&(size2==M.size2));
		for(int j=0; j < size2; j++)
			memcpy((char *)(data+lda*j), (char *)(M.data+M.lda*j), 
			       size1*sizeof(double));
		return(*this);
  }

  
	// returns a vector that shadows column j
	Vector getColumn(int j){
		Vector v;
		assert(j<size2);
		v.size = size1;
		v.data = data + j*lda;
		v.owner = 0;
		return v;
	}

	//transpose square matrix
	void transpose(){
		assert(getm()==getn());
		for(int i=0; i < getm(); i++)
			for(int j = i+1; j < getn(); j++){
				double temp = (*this)(i,j);
				(*this)(i,j) = (*this)(j,i);
				(*this)(j,i) = temp;
			}
	}
	
     
	//*this = *this+M
	void add(const Matrix& M){
		assert((size1 == M.size1)&&(size2==M.size2));
		for(int j=0; j < size2; j++)
			for(int i=0; i < size1; i++)
				data[j*lda+i] += (M.data)[j*M.lda+i];
	}
	
	//*this = *this-M
	void sub(const Matrix& M){
		assert((size1 == M.size1)&&(size2==M.size2));
		for(int j=0; j < size2; j++)
			for(int i=0; i < size1; i++)
				data[j*lda+i] -= (M.data)[j*M.lda+i];
	}
	
	//*this = (*this).*M
	void mul(const Matrix& M){
		assert((size1 == M.size1)&&(size2==M.size2));
		for(int j=0; j < size2; j++)
			for(int i=0; i < size1; i++)
				data[j*lda+i] *= (M.data)[j*M.lda+i];
	}
	
	//*this = (*this)./M
	void div(const Matrix& M){
		assert((size1 == M.size1)&&(size2==M.size2));
		for(int j=0; j < size2; j++)
			for(int i=0; i < size1; i++)
				data[j*lda+i] /= (M.data)[j*M.lda+i]; 
	}
	
	//*this = x * (*this)
	void scale(const double x){
		for(int j=0; j < size2; j++)
			for(int i=0; i < size1; i++)
				data[j*lda+i] *= x; 
	}

	//*this = (*this) + x
	void add_constant(const double x){
		for(int j=0; j < size2; j++)
			for(int i=0; i < size1; i++)
	      data[j*lda+i] += x; 
	}


	//output matrix to file fname
	void output(const char *fname, int digits=18)const{
		ofstream ofile(fname);
		assert(!ofile.fail());
		ofile.setf(ios::scientific, ios::floatfield);
		ofile.precision(digits);
		int i,j;
		for(i=0; i < size1; i++){
			for(j=0; j < size2; j++)
				ofile<<(*this)(i,j)<<" ";
			ofile<<endl;
		}
		ofile.close();
	}

	//input matrix from file fname
	void input(const char *fname){
		ifstream ifile(fname);
		assert(!ifile.fail());
		int i,j;
		for(i=0; i < size1; i++)
			for(j=0; j < size2; j++){
				assert(!ifile.eof());
				ifile>>(*this)(i,j);
				if(ifile.fail()){
					cout<<"Possible underflow"
						" in input to "<<fname<<endl;
					ifile.clear();
				}
			}
		ifile.close();
	}
};

#endif
