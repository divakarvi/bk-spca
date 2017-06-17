#include "utils.hh"
#include <emmintrin.h>
#include <errno.h>
#include <dirent.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <iostream>
#include <iomanip>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <stdlib.h>

using namespace std;

//utils.hh
int num_cpu(){
	int nth = sysconf( _SC_NPROCESSORS_ONLN );
	assrt(nth > 0);
	return nth;
}

//utils.hh
void array_abs(double *v, int n){
	for(int i=0; i < n; i++)
		v[i] = fabs(v[i]);
}

//utils.hh
double array_max(double *v, int n){
	double ans = 0;
	for(int i=0; i < n; i++)
		if(fabs(v[i])> ans)
			ans = fabs(v[i]);
	return ans;
}

//utils.hh
void array_diff(double *restrict v, double *restrict w, int n){
	for(int i=0; i < n; i++)
		v[i] -= w[i];
}

//utils.hh
void array_copy(double *restrict v, double *restrict w, int n){
	for(int i=0; i < n; i++)
		w[i] = v[i];
}

//utils.hh
void array_out(double *v, int m, int n, const char* fname){
	FILE *fp;
	if(fname == NULL)
		fp = stdout;
	else
		fp = fopen(fname, "w");

	for(int i=0; i < m; i++){
		for(int j=0; j < n; j++)
			fprintf(fp, "%.15e  ", v[i+j*m]);
		fprintf(fp, "\n");
	}

	if(fname != NULL){
		int rval = fclose(fp);
		assrt(rval !=  -1);
	}
}

//utils.hh
void array_out(double *v, int m, int n, int lda, const char *fname){
	FILE *fp;
	if(fname == NULL)
		fp = stdout;
	else
		fp = fopen(fname, "w");
	
	for(int i=0; i < m; i++){
		for(int j=0; j < n; j++)
			fprintf(fp, "%.15e  ", v[i+j*lda]);
		fprintf(fp, "\n");
	}

	if(fname != NULL){
		int rval = fclose(fp);
		assrt(rval !=  -1);
	}
}

//utils.hh
void array_show(double *v, int n, const char* mesg){
	cout<<"\t\t\t\t"<<mesg<<endl;
	cout<<scientific<<setprecision(15);
	for(int i=0; i < n; i++)
		cout<<"\t\t"<<setw(3)<<i<<": "<<v[i]<<endl;
	cout<<endl;
}

//utils.hh
void array_in(double *v, int size,  const char* fname){
	std::ifstream ifile(fname);
	assrt(ifile.is_open());
	for(int i=0; i < size; i++)
		ifile>>v[i];
	ifile.close();
}

//utils.hh
void array_flush(double *v, int size){
	for(long int i=0; i < size; i++)
		_mm_clflush(v + i);
}

//utils.hh
void solve2x2(double *restrict A, double *restrict rhs, double *restrict x){
  double a = A[0];
  double b = A[2];
  double c = A[1];
  double d = A[3];
  double det = a*d-b*c;
  x[0] = (rhs[0]*d-rhs[1]*b)/det;
  x[1] = (-rhs[0]*c+rhs[1]*a)/det;

}

//utils.hh
void verify_dir(const char *dir){
	struct stat sb;
	int rval = stat(dir, &sb);
	if((rval == -1) && (errno == ENOENT)){
		mkdir(dir, 0700);
		stat(dir, &sb);
	}
	assrt(S_ISDIR(sb.st_mode));
}

//utils.hh
void mop_dir(const char* dir, const char *pfx){
	DIR* dstm;
	dstm = opendir(dir);
	
	FILE *file;
	char fname[200];
	sprintf(fname, "%s/tmp.txt", dir);
	file = fopen(fname, "w");
	assrt(file != NULL);

	struct dirent *dent;
	while((dent = readdir(dstm)) != NULL){
		const char *s = strstr(dent->d_name, pfx);
		if(s == dent->d_name)
			fprintf(file, "%s\n", dent->d_name);
	}

	closedir(dstm);
	fclose(file);
	
	file = fopen(fname, "r");
	assrt(file != NULL);
	char s[200];
	while(fscanf(file, "%s", s) == 1){
		sprintf(fname, "%s/%s", dir, s);
		assrt(remove(fname)  == 0);
	}
	fclose(file);

	sprintf(fname, "%s/tmp.txt", dir);
	remove(fname);
}

static std::streambuf *sbuf_backup;
static std::ofstream ofile;
static int linkcout_state = 0;

//utils.hh
void link_cout(const char *fname, enum link_cout_flag_enum flag){
	assrt(linkcout_state == 0);
	linkcout_state = 1;
	
	switch(flag){
	case LC_NOAPP:
		ofile.open(fname);
		break;
	case LC_APP:
		ofile.open(fname, ios::app);
		break;
	}

	assrt(ofile.good());
	sbuf_backup = cout.rdbuf();
	std::cout.rdbuf(ofile.rdbuf());
	assrt(cout.good());
}

//utils.hh
void unlink_cout(){
	assrt(linkcout_state == 1);
	linkcout_state = 0;

	std::cout.rdbuf(sbuf_backup);
	ofile.close();
}

//utils.hh
void box_file(const char* fname, const char*mesg){
	FILE *file;
		file = fopen(fname, "r");
	char c;
	cout<<setw(40)<<mesg<<":"<<fname<<endl;
	cout<<"\t"
	    <<"----------------------------------"
	      "-----------------------------------"
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
	    <<"----------------------------------"
	      "-----------------------------------"
	    <<endl;
}

//utils.hh
void print_proc_status(const char* mesg){
	int pid = getpid();
	char fname[200];
	sprintf(fname, "/proc/%d/status", pid);
	box_file(fname, mesg);
}

//utils.hh
int dv_omp_nthreads(){
	if(getenv("OMP_NUM_THREADS")==NULL){
		printf("OMP_NUM_THREADS not defined");
		exit(-1);
	}
	return atoi(getenv("OMP_NUM_THREADS"));
}

