include ../makevars.mk
CFLAGSXX := -DOMPCPY -DFTRANS $(MPIINC) -openmp
LIBS := $(MPILIBS) -openmp
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
timer.o: timer.cpp
-include timer.d

trans.o: trans.cpp
-include trans.d

test_trans.o: test_trans.cpp
-include test_trans.d

time_trans.o: time_trans.cpp
-include time_trans.d

fast_trans.o: fast_trans.cpp
-include fast_trans.d

test_trans.exe: test_trans.o trans.o fast_trans.o timer.o	\
		../utils ../utils/utils.o			\
		../mpi-init ../mpi-init/mpi_init.o


time_trans.exe: time_trans.o trans.o fast_trans.o timer.o	\
		../utils ../utils/utils.o			\
		../mpi-init ../mpi-init/mpi_init.o
