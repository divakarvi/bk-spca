#########
CPP = icpc
DFLAGS = -g -DDEBUG -openmp -I$$MKL_INC `mpiCC -showme:compile`
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG -I$$MKL_INC -openmp `mpiCC -showme:compile`
CFLAGS = $(OFLAGS)
MKLLIBS= -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor

##########
.SUFFIXES: .cpp .c .o .exe
.PHONY: clean cleanx

%.o: %.cpp
	$(CPP) $(CFLAGS) -c $<
%.s: %.cpp
	$(CPP) $(CFLAGS) -S $< 
%.exe: %.o
	$(CPP)  -openmp `mpiCC -showme:link` -o $@ $^ 


##########
all: procname unsafe exchange exchgpackets cycle jacobi collective transpose

procname: procname.exe
	echo 'procname done'
procname.o: procname.cpp
procname.exe: procname.o

unsafe: unsafe.exe
	echo 'unsafe done'
unsafe.o: unsafe.cpp
unsafe.exe: unsafe.o

exchange: exchange.exe
	echo 'exchange done'
exchange.o: exchange.cpp
exchange.exe: exchange.o

cycle: cycle.exe
	echo 'cycle done'
cycle.o: cycle.cpp
cycle.exe: cycle.o

jacobi: jacobi.exe
	echo 'jacobi done'
jacobi.o: jacobi.cpp
jacobi.exe: jacobi.o

transpose: transpose.exe
	echo 'transpose done'
transpose.o: transpose.cpp
transpose.exe: transpose.o

collective: collective.exe
	echo 'collective done'
collective.o: collective.cpp
collective.exe: collective.o


##########
clean:
	rm *.exe; rm *.o;
cleanx:
	rm pbs*.*; rm outP*.txt;
