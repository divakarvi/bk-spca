CPP = icpc
DFLAGS = -g -DDEBUG -openmp  `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG -openmp `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`
CFLAGS = $(OFLAGS)

##########
.SUFFIXES: .cpp .c .o .exe
.PHONY: clean cleanx

%.o: %.cpp
	$(CPP) $(CFLAGS) -c $<
%.s: %.cpp
	$(CPP) $(CFLAGS) -S $< 
%.exe: %.o
	$(CPP)  -openmp `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link` -o $@ $^ 


##########
procname: procname.exe
	echo 'procname done'
procname.o: procname.cpp
procname.exe: procname.o

unsafe: unsafe.exe
	echo 'unsafe done'
unsafe.o: unsafe.cpp
unsafe.exe: unsafe.o

cycle: cycle.exe
	echo 'cycle done'
cycle.o: cycle.cpp
cycle.exe: cycle.o

exchange: exchange.exe
	echo 'exchange done'
exchange.o: exchange.cpp
exchange.exe: exchange.o

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

diskio-serial: diskio-serial.exe
	echo 'diskio-serial done'
diskio-serial.o: diskio-serial.cpp
	icpc -O3 -c $<
diskio-serial.exe: diskio-serial.o
	icpc -o $@ $^

diskio-mpi: diskio-mpi.exe
	echo 'diskio-mpi done'
diskio-mpi.o: diskio-mpi.cpp
diskio-mpi.exe: diskio-mpi.o

##########
clean:
	rm *.exe; rm *.o; rm core*;
cleanx:
	rm pbs*.*; rm outP*.txt; rm core*;
