include ../makevars.mk
CFLAGSXX := $(MPIINC)
LIBS := $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
procname.o: procname.cpp
-include procname.d

procname.exe: procname.o 

unsafe.o: unsafe.cpp
-include unsafe.d

unsafe.exe: unsafe.o 					\
	   ../utils ../utils/utils.o			\
	   ../mpi-init ../mpi-init/mpi_init.o