#include "pyplot.hh"
#include "../utils/utils.hh"
#include <cstring>
#include <cstdlib>

PyPlot::PyPlot(const char* namei, enum pipe_type pipe){
	pipe_state = pipe;
	verify_dir("FIGS");
	chdir("FIGS/");
	pypipe = popen("python", "w");
	assrt(pypipe != NULL);
	chdir("..");
	
	assrt(strlen(namei)<25);
	strcpy(name, namei);

	state = 0;
	
	for(int i=0; i < MAX_NUM_PYPLT_CMDS; i++)
		cmd[i] = new char[MAX_CMD_PYPLT_LEN];
	
	cmdnum = 0;

	linenum = -1;

	savedata = 0;

	sprintf(cmdstr, "import matplotlib as mpl\n");
	issue_command(cmdstr);
	sprintf(cmdstr, "mpl.rcParams['font.size'] = 18\n");
	issue_command(cmdstr);

	/*
	 * change backend if PLTOFF
	 */
	if(pipe_state == PLTOFF){
		sprintf(cmdstr, "mpl.use('PDF', warn = True)\n");
		issue_command(cmdstr);
	}

	sprintf(cmdstr, "from matplotlib import pyplot as plt\n");
	issue_command(cmdstr);

	sprintf(cmdstr, "from numpy import genfromtxt\n");
	issue_command(cmdstr);

	sprintf(cmdstr, "fig = plt.figure(1)\n");
	issue_command(cmdstr);

	sprintf(cmdstr, "ax = plt.subplot(111)\n");
	issue_command(cmdstr);
}

PyPlot::~PyPlot(){
	sprintf(cmdstr, "plt.close()\n");
	issue_command(cmdstr);
	int rval = pclose(pypipe);
	assrt(rval != -1);
	
	//pipe must be closed (as above) before data is removed
	if(savedata==0){
		sprintf(cmdstr, "rm FIGS/%s_*", name);
		system(cmdstr);
	}
	
	for(int i=0; i < MAX_NUM_PYPLT_CMDS; i++)
		delete[] cmd[i];
}

void PyPlot::issue_command(const char *cstr){
	assrt(cmdnum < MAX_NUM_PYPLT_CMDS);
	int len = strlen(cstr);
	assrt(len < MAX_CMD_PYPLT_LEN-1);
	assrt(cstr[len-1] == '\n');
	
	strcpy(cmd[cmdnum], cstr);
	fprintf(pypipe, "%s", cmd[cmdnum++]);
}

void PyPlot::prep_line(double *x, double *y, int n){
	assrt(state < 2);
	state = 1;
	linenum++;

	char fname[200];
	sprintf(fname,"FIGS/%s_x%d.dat", name, linenum);
	array_out(x, n, 1, fname);
	sprintf(fname,"FIGS/%s_y%d.dat", name, linenum);
	array_out(y, n, 1, fname);
	
	sprintf(cmdstr, 
		"x = genfromtxt('%s_x%d.dat', dtype='float')\n",
		name, linenum);
	issue_command(cmdstr);

	sprintf(cmdstr, 
		"y = genfromtxt('%s_y%d.dat', dtype='float')\n",
		name, linenum);
	issue_command(cmdstr);
}

void PyPlot::plot(double *x, double *y, int n){
	prep_line(x, y, n);
	sprintf(cmdstr, "l, = plt.plot(x,y)\n");
	issue_command(cmdstr);
}

void PyPlot::plot(double *y, int n){
	double *x = new double[n];
	for(int i=0; i < n; i++)
		x[i] = i;
	plot(x, y, n);
	delete[] x;
}

void PyPlot::semilogx(double *x, double *y, int n){
	prep_line(x, y, n);
	sprintf(cmdstr, "l, = plt.semilogx(x,y)\n");
	issue_command(cmdstr);
}

void PyPlot::semilogy(double *x, double *y, int n){
	prep_line(x, y, n);
	sprintf(cmdstr, "l, = plt.semilogy(x,y)\n");
	issue_command(cmdstr);
}	

void PyPlot::semilogy(double *y, int n){
	double *x = new double[n];
	for(int i=0; i < n; i++)
		x[i] = i+1;
	semilogy(x, y, n);
	delete[] x;
}

void PyPlot::loglog(double *x, double *y, int n){
	prep_line(x, y, n);
	sprintf(cmdstr, "l, = plt.loglog(x,y)\n");
	issue_command(cmdstr);
}



void PyPlot::linestyle(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "l.set_linestyle('%s')\n",s);
	issue_command(cmdstr);
}

void PyPlot::linewidth(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "l.set_linewidth(%s)\n",s);
	issue_command(cmdstr);
}

void PyPlot::linecolor(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "l.set_color('%s')\n",s);
	issue_command(cmdstr);
}

void PyPlot::markertype(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "l.set_marker('%s')\n",s);
	issue_command(cmdstr);
}

void PyPlot::markercolor(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "l.set_markerfacecolor('%s')\n",s);
	issue_command(cmdstr);
}

void PyPlot::markersize(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "l.set_markersize(%s) \n",s);
	issue_command(cmdstr);
}

void PyPlot::axis(){
	assrt(state==1);
	sprintf(cmdstr, "ax.axis('tight') \n");
	issue_command(cmdstr);
}

void PyPlot::axis(double x0, double x1, double y0, double y1){
	assrt(state==1);
	sprintf(cmdstr, "ax.axis([%.4e, %.4e, %.4e, %.4e]) \n",
		x0, x1, y0, y1);
	issue_command(cmdstr);
}

void PyPlot::title(const char* s){
	assrt(state==1);
	sprintf(cmdstr, "ax.set_title('%s', fontsize=20) \n", s);
	issue_command(cmdstr);
}

void PyPlot::xticks(double *x, int n){
	assrt(state==1);
	char fname[200];
	sprintf(fname,"FIGS/%s_xticks%d.dat", name, linenum);
	array_out(x, n, 1, fname);
	
	sprintf(cmdstr, 
		"xticks = genfromtxt('%s_xticks%d.dat', dtype='float')\n",
		name, linenum);
	issue_command(cmdstr);
	sprintf(cmdstr, "ax.set_xticks(xticks)\n");
	issue_command(cmdstr);
}

void PyPlot::yticks(double *y, int n){
	assrt(state==1);
	char fname[200];
	sprintf(fname,"FIGS/%s_yticks%d.dat", name, linenum);
	array_out(y, n, 1, fname);
	
	sprintf(cmdstr, 
		"yticks = genfromtxt('%s_yticks%d.dat', dtype='float')\n",
		name, linenum);
	issue_command(cmdstr);
	sprintf(cmdstr, "ax.set_yticks(yticks)\n");
	issue_command(cmdstr);
}

void PyPlot::ticksize(const char* s){
	sprintf(cmdstr, "ax.tick_params(labelsize = %s)\n", s);
	issue_command(cmdstr);
}

void PyPlot::pycmd(const char* s){
	assrt(state == 1);
	int len = strlen(s);
	assrt(len < MAX_CMD_PYPLT_LEN-1);
	assrt(s[len-1] == '\n');
	issue_command(s);
}

void PyPlot::show(){
	assrt(state==1);
	state = 2;
	if(pipe_state == PLTON){
		sprintf(cmdstr, "plt.show() \n");
		issue_command(cmdstr);
	}
	else{
		sprintf(cmdstr, "plt.savefig('%s.pdf') \n",name);
		issue_command(cmdstr);
	}
}

void PyPlot::savescript(){
	assrt(state==2);
	savedata = 1;
	char fname[200];
	sprintf(fname, "FIGS/%s.py", name);
	FILE *fp = fopen(fname, "w");
	fprintf(fp, "#! /usr/bin/env python\n");
	for(int i=0; i < cmdnum; i++)
		fprintf(fp, "%s", cmd[i]);
	fclose(fp);
}

