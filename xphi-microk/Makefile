include ../makevars.mk
CFLAGSXX := -openmp -fno-inline-functions
LIBS := -openmp
MMIC := -mmic
export MMIC

test_instn.o: test_instn.cpp
-include test_instn.d

test_instn.exe: test_instn.o fma1.o
