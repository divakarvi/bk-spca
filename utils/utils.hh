#ifndef __dvutils25June2013__
#define __dvutils25June2013__
#include <cstdio>
#include <iostream>
#include <fstream>
const double PI = 3.1415926535897932384e+00;

/*
 * based on http://stackoverflow.com/questions/5252375/custom-c-assert-macro
 * works outside debug mode too
 */
#define assrt(cond) \
    do \
    { \
	 if (!(cond)) \
	 { \
		  std::cout<<"ASSRT FAILED:"<<#cond<<std::endl	\
			   <<"file: "<<__FILE__<<std::endl	\
			   <<"line: "<<__LINE__<<std::endl;	\
		 __builtin_trap();				\
        } \
    } while(0)  



 /*
  * v[i] = fabs(v[i]) for i=0...n-1
  */
void array_abs(double *v, int n);

/*
 * returns max of abs values of v[0..n-1]
 */
double array_max(double *v, int n);

 /*
  * display n entries of v on stdout
  */
void array_show(double *v, int n, const char* mesg);

/*
 * v = v - w
 */
void array_diff(double *restrict v, double *restrict w, int n);

 /*
  * copy w = v
  */
 void array_copy(double *restrict v, double *restrict w, int n);

/*
 * v[]   = array to be output (column major)
 * m     = num of rows
 * n     = num of cols 
 * fname = name of file for output
 *         (uses stdout if fname == NULL)
 */
void array_out(double *v, int m, int n, const char *fname = NULL);

 /*
  * same as above except for lda
  * i,j th entry = v[i+j*lda]
  * uses stdout if fname == NULL
  */
void array_out(double *v, int m, int n, int lda, const char *fname = NULL);

/*
 * counterpart of array_out()
 * size = number of entries of v
 */
void array_in(double *v, int size,  const char* fname);

/*
 * A = 4 doubles in column major format
 * rhs = 2 doubles
 * x = soln of Ax=rhs
 */
void solve2x2(double *restrict A, double *restrict rhs, double *restrict x);

 /*
  * verify if the directory exists
  * if not create it
  */
void verify_dir(const char *dir);

/*
 * open file fname and link its stream to that of cout
 */
void link_cout(const char *fname);

/*
 * close file opened with link2cout and restore cout stream
 */
void unlink_cout();

/*
 * prints the file to cout (omitting unprintable characters)
 * the contents of the file are put inside a box
 */
void box_file(const char* fname, const char* mesg);

/*
 * getpid() and use it to copy /proc/pid/status to std::cout
 */
void print_proc_status(const char* mesg);

#endif
