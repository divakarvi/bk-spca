#ifndef PYPLOT19JULY2013
#define PYPLOT19JULY2013
#include <cstdio>
#include <unistd.h>

enum pipe_type {PLTOFF, PLTON};

const int MAX_NUM_PYPLT_CMDS = 400;
const int MAX_CMD_PYPLT_LEN = 3000;

class PyPlot{
private:
	FILE *pypipe; //pipe to Python.
	/*
	 * state = 0 (no line drawn).
         *       = 1 (line drawn, but figure not saved/shown).
         *       = 2 (figure saved/shown, should possibly save script and exit).
	 */
	int state;
	/*
	 * If nonzero no pipe is opened to python.
	 */
	enum pipe_type pipe_state;
	/*
	 * Figure will be saved in FIGS/"name.pdf."
	 * If asked to do so, data & script will be saved in FIGS/name_*.*.
	 * Normally, data is saved in FIGS/name_* and deleted.
	 */
	char name[30];
	/*
	 * Array of commands issued to python.
	 * At most MAX_NUM commands are allowed.
	 */
	char *cmd[MAX_NUM_PYPLT_CMDS];
	char cmdstr[MAX_CMD_PYPLT_LEN];
	/*
	 * cmdnum: 0 initially,
	 *         index of current/next command.
	 * Incremented after cmd is issued.
	 */
	int cmdnum;
	/*
	 * linenum: index of current line.
	 * Appended to name_ when saving data for Python.
	 * All saved data is removed unless specified otherwise.
	 */
	int linenum;
	/*
	 * savedata: 0 then line data is removed by destructor,
	 *           1 then line data is not removed from FIGS/name_*.*.
	 */
	int savedata;
	/*
	 * Called by plot(), semilogx/y, loglog.
	 */
	void prep_line(double *x, double *y, int n);
	void issue_command(const char *cstr);
public:
	/*
	 * namei[]: must be less than 25 chars.
	 * pipe: PLTOFF then mpl.backend is set to PDF.
	 */
	PyPlot(const char *namei, enum pipe_type pipe=PLTON);//state:0
	~PyPlot();
	/*
	 * Functions that draw lines and set their properties.
	 * state: 0-->1 or 1-->1.
	 */
	void plot(double *x, double *y, int n);
	void plot(double *y, int n);
	void semilogx(double *x, double *y, int n);
	void semilogy(double *x, double *y, int n);
	void semilogy(double *y, int n);
	void loglog(double *x, double *y, int n);
	void linestyle(const char* s);
	void linewidth(const char* s);
	void linecolor(const char* s);
	void markertype(const char* s); 
	void markercolor(const char* s);
	void markersize(const char* s);
	/*
	 * Functions that specify axes and their properties.
	 */
	void axis(); //"tight"
	void axis(double x0, double x1, double y0, double y1);
	void title(const char* s);
	void xticks(double *ticks, int n);
	void yticks(double *ticks, int n);
	void ticksize(const char *s);
	/*
	 * Issues command to python pipe verbatim.
	 * Last char of s must be '\n'.
	 * For Python syntax inside string s, ax and l are always 
         * available as current axis and current line.
	 */
	void pycmd(const char *s);

	/*
	 * Shows plot or outputs python script in FIGS/ for showing plot.
	 * PLTON then plot.
	 * PLTOFF then save to pdf.
	 */
	void show();//state: 1--->2
	/*
	 * Saves python script in FIGS/.
	 */
	void savescript();//state: 2--->2
};
#endif

