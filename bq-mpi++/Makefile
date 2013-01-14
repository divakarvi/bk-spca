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

exchange: exchange.exe
	echo 'exchange done'
exchange.o: exchange.cpp
exchange.exe: exchange.o

##########
clean:
	rm *.exe; rm *.o;
cleanx:
	rm pbs*.*; rm outP*.txt;
