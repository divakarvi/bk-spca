#include <cmath>
#include "utils.hh"
#include <cstdio>
#include <iostream>
#include <iomanip>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
using namespace std;

void array_abs(double *v, int n){
	for(int i=0; i < n; i++)
		v[i] = fabs(v[i]);
}

double array_max(double *v, int n){
	double ans = 0;
	for(int i=0; i < n; i++)
		if(fabs(v[i])> ans)
			ans = fabs(v[i]);
	return ans;
}


void array_diff(double *restrict v, double *restrict w, int n){
	for(int i=0; i < n; i++)
		v[i] -= w[i];
}

void array_copy(double *restrict v, double *restrict w, int n){
	for(int i=0; i < n; i++)
		v[i] = w[i];
}

void array_out(double *v, int m, int n, const char* fname){
	FILE *fp;
	fp = fopen(fname, "w");
	for(int i=0; i < m; i++){
		for(int j=0; j < n; j++)
			fprintf(fp, "%.15e  ", v[i+j*m]);
		fprintf(fp, "\n");
	}
	int rval = fclose(fp);
	assrt(rval !=  -1);
}

void array_out(double *v, int m, int n, int lda, const char *fname){
	FILE *fp;
	fp = fopen(fname, "w");
	for(int i=0; i < m; i++){
		for(int j=0; j < n; j++)
			fprintf(fp, "%.15e  ", v[i+j*lda]);
		fprintf(fp, "\n");
	}
	int rval = fclose(fp);
	assrt(rval !=  -1);
}

void array_show(double *v, int n, const char* mesg){
	cout<<"\t\t\t\t"<<mesg<<endl;
	cout<<scientific<<setprecision(15);
	for(int i=0; i < n; i++)
		cout<<"\t\t"<<setw(3)<<i<<": "<<v[i]<<endl;
	cout<<endl;
}

void array_in(double *v, int size,  const char* fname){
	std::ifstream ifile(fname);
	assrt(ifile.is_open());
	for(int i=0; i < size; i++)
		ifile>>v[i];
	ifile.close();
}

void solve2x2(double *restrict A, double *restrict rhs, double *restrict x){
  double a = A[0];
  double b = A[2];
  double c = A[1];
  double d = A[3];
  double det = a*d-b*c;
  x[0] = (rhs[0]*d-rhs[1]*b)/det;
  x[1] = (-rhs[0]*c+rhs[1]*a)/det;

}

void open_ifile(const char* dir, const char* file, std::ifstream& ifile){
	if(ifile.is_open())
		ifile.close();
	char fname[200];
	sprintf(fname, "%s/%s", dir, file);
	ifile.open(fname);
	assrt(ifile.is_open());
}

void open_ofile(const char* dir, const char* file, std::ofstream& ofile){
	if(ofile.is_open())
		ofile.close();
	char fname[200];
	sprintf(fname, "%s/%s", dir, file);
	ofile.open(fname);
	assrt(ofile.is_open());
}

void verify_dir(const char *dir){
	struct stat sb;
	int rval = stat(dir, &sb);
	if((rval == -1) && (errno == ENOENT)){
		char cmd[200];
		sprintf(cmd, "mkdir %s", dir);
		printf("%s\n", cmd);
		system(cmd);
		stat(dir, &sb);
	}
	assrt(S_ISDIR(sb.st_mode));
}

void box_file(const char* fname, const char*mesg){
	FILE *file;
		file = fopen(fname, "r");
	char c;
	cout<<setw(40)<<mesg<<":"<<fname<<endl;
	cout<<"\t"
	    <<"---------------------------------------------------------------------"
	    <<endl;
	int line = 0;
	while((c=getc(file))!=EOF){
		if(line==0)
			cout<<'\t'<<'|';
		if((c=='\n')||(line==67)){
			for(int i=line; i < 67; i++)
				cout<<' ';
			line = 0;
			cout<<'|'<<'\n';
		}
		else if(c=='\b'){
			if(line > 0)
				line--;
			cout<<c;
		}
		else if(c=='\t'){
			int i;
			for(i=line; (i < 67)&&(i<line+8); i++)
				cout<<' ';
			line = i;
		}
		else if((32<=c)&&(c<127)){
			cout<<c;
			line++;
		}
	}
	cout<<"\t"
	    <<"---------------------------------------------------------------------"
	    <<endl;
}

void print_proc_status(const char* mesg){
	int pid = getpid();
	char fname[200];
	sprintf(fname, "/proc/%d/status", pid);
	box_file(fname, mesg);
}
