include ../makevars.mk
LIBS := $(MKLLIBS)

LinAlg.o: LinAlg.cpp
include LinAlg.d

test_linalg.o: test_linalg.cpp
include test_linalg.d

test_linalg.exe: test_linalg.o linalg.o