include ../makevars.mk
CFLAGSXX := -fno-inline-functions $(MPIINC)
LIBS := $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
cycle.o: cycle.cpp
-include cycle.d

test_cycle.o: test_cycle.cpp
-include test_cycle.d

test_cycle.exe: test_cycle.o cycle.o 			\
		../utils ../utils/utils.o		\
		../mpi-init ../mpi-init/mpi_init.o