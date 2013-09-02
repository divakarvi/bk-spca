include ../makevars.mk

##########
.PHONY: ../utils
../utils:
	make --directory=$@ all

##########
.PHONY: all
all: pyplot.o

pyplot.o: pyplot.cpp
include pyplot.d

test_pyplot.o: test_pyplot.cpp
include test_pyplot.d

test_pyplot.exe: test_pyplot.o pyplot.o ../utils
	$(CPP) -openmp -o $@ test_pyplot.o pyplot.o ../utils/utils.o

