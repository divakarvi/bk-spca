include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp 
LIBS := -openmp 
MODS := ../utils
MMIC := -mmic
export MMIC

hello.o: hello.cpp
-include hello.d

hello.exe: hello.o

time_leibniz.exe:
	make --directory=../omp-leibniz time_leibniz.exe
	mv ../omp-leibniz/time_leibniz.exe .