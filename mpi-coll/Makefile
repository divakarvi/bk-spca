include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp $(MPIINC)
LIBS := -openmp $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
bcast.o: bcast.cpp
-include bcast.d

test_bcast.o: test_bcast.cpp
-include test_bcast.d

time_bcast.o: time_bcast.cpp
-include time_bcast.d

test_bcast.exe: test_bcast.o bcast.o				\
		 ../utils ../utils/utils.o			\
		 ../mpi-init ../mpi-init/mpi_init.o

time_bcast.exe: time_bcast.o bcast.o			 	\
		 ../utils ../utils/utils.o ../utils/Table.o	\
		 ../mpi-init ../mpi-init/mpi_init.o

all2all.o: all2all.cpp
-include all2all.d

test_all2all.o: test_all2all.cpp
-include test_all2all.d

time_all2all.o: time_all2all.cpp
-include time_all2all.d

test_all2all.exe: test_all2all.o all2all.o				\
		 ../utils ../utils/utils.o			\
		 ../mpi-init ../mpi-init/mpi_init.o

time_all2all.exe: time_all2all.o all2all.o			 	\
		 ../utils ../utils/utils.o ../utils/Table.o	\
		 ../mpi-init ../mpi-init/mpi_init.o