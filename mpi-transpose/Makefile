include ../makevars.mk
CFLAGSXX := -NDOMPCPY $(MPIINC) -openmp
LIBS := $(MPILIBS) -openmp
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
trans.o: trans.cpp
-include trans.d

test_trans.o: test_trans.cpp
-include test_trans.d

test_trans.exe: test_trans.o trans.o 				\
		../utils ../utils/utils.o			\
		../mpi-init ../mpi-init/mpi_init.o

time_trans.o: time_trans.cpp
-include time_trans.d

time_trans.exe: time_trans.o trans.o 				\
		../utils ../utils/utils.o			\
		../mpi-init ../mpi-init/mpi_init.o