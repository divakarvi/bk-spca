include ../makevars.mk
LIBS := $(MKLLIBS)

##############
.PHONY: ../utils all
../utils:
	make --directory=$@ all

##############
all: linalg.o

linalg.o: linalg.cpp
include linalg.d

test_linalg.o: test_linalg.cpp
include test_linalg.d

test_linalg.exe: test_linalg.o linalg.o ../utils ../utils/utils.o