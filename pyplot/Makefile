include ../makevars.mk

##########
.PHONY: ../utils
../utils:
	make --directory=$@ all

##########
.PHONY: all
all: pyplot.o pyhist.o

pyplot.o: pyplot.cpp
include pyplot.d

pyhist.o: pyhist.cpp
include pyhist.d

test_pyplot.o: test_pyplot.cpp
include test_pyplot.d

test_pyplot.exe: test_pyplot.o pyplot.o 		\
	         ../utils ../utils/utils.o

test_pyhist.o: test_pyhist.cpp
include test_pyhist.d

test_pyhist.exe: test_pyhist.o pyhist.o 		\
	         ../utils ../utils/utils.o
