include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp 
LIBS := -openmp 
MODS := ../utils
MMIC := 
export MMIC

hello.o: hello.cpp
-include hello.d

hello.exe: hello.o