/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef __pyhist04Sept2013__
#define __pyhist04Sept2013__
#include "pyplot.hh"

class PyHist{
private:
	enum pipe_type pipe_state;
	FILE *pypipe;
	char name[30];
	int state;
	char *cmd[MAX_NUM_PYPLT_CMDS];
	char cmdstr[MAX_CMD_PYPLT_LEN];
	int cmdnum;
	int savedata;
	void prep_data(double *x, int n);
	void issue_command(const char* cstr);
public:
	/*
	 * name must be less than 25 chars
	 * pipe == PIPE_OFF then no pipe is opened to python
	 */
	PyHist(const char *namei, enum pipe_type pipe=PIPE_ON);
	~PyHist();
	void hist(double *x, int n);
	void bins(int b);
	void title(const char* s);
	void show();
	void output(); /* eps output */
	void savescript();
};

#endif
