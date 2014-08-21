include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp $(MPIINC)
LIBS := -openmp $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
jacobi.o: jacobi.cpp
-include jacobi.d

test_jacobi.o: test_jacobi.cpp
-include test_jacobi.d

test_jacobi.exe: test_jacobi.o jacobi.o			\
		 ../utils ../utils/utils.o		\
		 ../mpi-init ../mpi-init/mpi_init.o

time_jacobi.o: time_jacobi.cpp
-include time_jacobi.d

time_jacobi.exe: time_jacobi.o jacobi.o			\
		 ../utils ../utils/utils.o		\
		 ../mpi-init ../mpi-init/mpi_init.o