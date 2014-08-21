include ../makevars.mk
CFLAGSXX := $(MPIINC)
LIBS := $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
exchange.o: exchange.cpp
-include exchange.d

test_xchg.o: test_xchg.cpp
-include test_xchg.d

test_xchg.exe: test_xchg.o exchange.o 				\
	       ../utils ../utils/utils.o			\
	       ../mpi-init ../mpi-init/mpi_init.o

time_xchg.o: time_xchg.cpp
-include time_xchg.d

time_xchg.exe: time_xchg.o exchange.o 				\
	       ../utils ../utils/utils.o ../utils/Table.o 	\
	       ../mpi-init ../mpi-init/mpi_init.o