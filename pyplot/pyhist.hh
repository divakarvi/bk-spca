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
