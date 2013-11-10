include ../makevars.mk
CFLAGSXX := $(MKLINC)
LIBS := $(MKLLIBS)

##############
.PHONY: ../utils all
../utils:
	make --directory=$@ all

##############
all: lusolve.o

lusolve.o: lusolve.cpp
-include lusolve.d

test_lusolve.o: test_lusolve.cpp
-include test_lusolve.d

test_lusolve.exe: test_lusolve.o lusolve.o ../utils ../utils/utils.o