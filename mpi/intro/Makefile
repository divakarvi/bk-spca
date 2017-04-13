include ../makevars.mk
CFLAGSXX := $(MPIINC)
MODS := ../../utils ../init

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ objl
	@echo -e '\n'	

######
procname.o: procname.cpp
-include procname.d
unsafe.o: unsafe.cpp
-include unsafe.d

######
procname.exe: procname.o 
unsafe.exe: unsafe.o 					\
	   ../../utils ../../utils/utils.o			\
	   ../init ../init/mpi_init.o
