include ../makevars.mk
CFLAGSXX := $(MPIINC)
LIBS := $(MPILIBS)
MODS := ../utils

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
all: mpi_utils.o

procname.o: procname.cpp
-include procname.d

procname.exe: procname.o 

mpi_utils.o: mpi_utils.cpp
-include mpi_utils.d

unsafe.o: unsafe.cpp
-include unsafe.d

unsafe.exe: unsafe.o mpi_utils.o ../utils ../utils/utils.o