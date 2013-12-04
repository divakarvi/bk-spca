include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp 
LIBS := -openmp 
MODS := ../utils
MMIC := 
export MMIC

hello.o: hello.cpp
-include hello.d

hello.exe: hello.o

time_leibniz.exe:
	make --directory=../omp-leibniz time_leibniz.exe
	mv ../omp-leibniz/time_leibniz.exe .

test_rwc.exe:	
	make --directory=../omp-bw2mem test_rwc.exe
	mv ../omp-bw2mem/test_rwc.exe test_rwc.exe

time_rwc.exe:	
	make --directory=../omp-bw2mem time_rwc.exe
	mv ../omp-bw2mem/time_rwc.exe time_rwc.exe