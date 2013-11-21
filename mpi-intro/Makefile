include ../makevars.mk
CFLAGSXX := $(MPIINC)
LIBS := $(MPILIBS)
MODS := ../utils

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
procname.o: procname.cpp
-include procname.d

procname.exe: procname.o ../utils ../utils/utils.o

unsafe.o: unsafe.cpp
-include unsafe.d

unsafe.exe: unsafe.o