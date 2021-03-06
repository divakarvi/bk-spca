#ifndef xxMYVECTORxx
#define xxMYVECTORxx
#include <cassert>
#include <cmath>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cstring>

using namespace std;
#ifndef dvutils25June2013
const double PI = 3.1415926535897932384e+00;
#endif

/*
 * This class is used to introduce C++ features.
 * It is used to show how the use or misuse of C++ abstraction features
 * can become problematic. 
 * Do not use this class. 
 * For those who insist on an abstract Vector class, there are better options.
 */

class Vector{
private:
	long int size;
	double *data;
	int owner;
public:
	//Empty constructor.
	Vector(){
		size = 0;
		data = NULL;
		owner = 0;
	}
	
	//Only constructor to allocate space for data.
	Vector(long int  n){
		size = n;
		data = (double *)malloc(sizeof(double)*n);
		owner = 1;
	}
  
  
	//*this becomes shadow of Vector v (copy constructor).
	Vector(const Vector& v){
		size = v.size;
		data = v.data;
		owner = 0;
	} 
	
	
	//Destructor, finds out if *this is a shadow or owns space.
	~Vector(){
		if(owner!=0)
			free(data);
	}
	

	//Makes *this shadow dataptr.
	void shadow(double *dataptr, long int len){
		assert(!owner);
		size = len;
		data = dataptr;
		owner = 0;
	}
	
	//Makes *this shadow v.
	void shadow(const Vector& v){
		assert(!owner);
		size = v.size;
		data = v.data;
		owner = 0;
	}
	
	//Makes *this shadow v(i:i+len-1).
	void shadow(const Vector& v,  long int i,  long int len){ 
		assert(!owner);
		assert(i+len<=v.size);
		size = len;
		data = v.data + i;
		owner = 0;
	}
  
	//Returns length of (*this).
	long int getSize() const{
		return size;
	}


	//Use with care! better yet: don't use this class.
	double * getRawData() const{
		return data;
	}
 

	//Returns (*this)(i).
	double& operator()(long int i){
		assert(i < size);
		return(data[i]);
	}
  
	//Returns (*this)(i).
	const double& operator()(long int i) const{
		assert(i<size);
		return(data[i]);
	}
		
	//(*this)(i) = v(i) for all i.
	Vector& operator=(const Vector& v){
		assert(size==v.size);
		assert(((data<v.data)&&((data+size-1)<v.data))||
		       ((data>v.data)&& (data>(v.data+size-1)))||
		       (data==v.data)); //no overlap or data==v.data
		if(data==v.data)
			return *this;
		memcpy((char *)data, (char *)v.data, size*sizeof(double));
		return(*this);
	}

	//*this(i) = *this(i) + v(i).
	void add(const Vector& v){
		assert(size == v.size);
		for(long int i=0; i < size; i++)
			data[i] += (v.data)[i];
	}

	//*this(i) = *this(i) - v(i).
	void sub(const Vector& v){
		assert(size == v.size);
		for(long int i=0; i < size; i++)
			data[i] -= (v.data)[i];
	}

	//*this(i) = *this(i) .* v(i).
	void mul(const Vector& v){
		assert(size == v.size);
		for(long int i=0; i < size; i++)
			data[i] *= (v.data)[i];
	}

	//*this(i) = *this(i) ./ v(i).
	void div(const Vector& v){
		assert(size == v.size);
		for(long int i=0; i < size; i++)
			data[i] /= (v.data)[i];
	}

	//*this(i) *= x. 
	void scale(const double x){
		for(long int i=0; i < size; i++)
			data[i] *= x;
	}
	
	//*this(i) +=  x.
	void add_constant(const double x){
		for(long int i=0; i < size; i++)
			data[i] += x;
	}

	//Returns inf-norm of *this.
	double norm() const{
		double ans = 0;
		for(long int i=0; i < size; i++)
			if(ans < fabs(data[i]))
				ans = fabs(data[i]);
		return ans;
	}

	//Outputs vector to file fname.
	void output(const char* fname, int digits=18)const{
		ofstream ofile(fname);
		assert(!ofile.fail());
		ofile.setf(ios::scientific, ios::floatfield);
		ofile.precision(digits);
		long int i;
		for(i=0; i < size; i++)
			ofile<<(*this)(i)<<endl;
		ofile.close();
	}

	//Inputs vector from file fname.
	void input(const char* fname){
		ifstream ifile(fname);
		assert(!ifile.fail());
		long int i;
		for(i=0; i < size; i++){
			assert(!ifile.eof());
			ifile>>(*this)(i);
		}
		ifile.close();
	}
};

#endif

