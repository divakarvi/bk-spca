include ../makevars.mk
CFLAGS := $(CFLAGS) -openmp
LFLAGS := $(LFLAGS) -openmp
MODS := ../../utils ../init

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ obj
	@echo -e '\n'

######
jacobi.o: jacobi.cpp
-include jacobi.d
test_jacobi.o: test_jacobi.cpp
-include test_jacobi.d
time_jacobi.o: time_jacobi.cpp
-include time_jacobi.d

######
test_jacobi.exe: test_jacobi.o jacobi.o				\
		 ../../utils ../../utils/utils.o		\
		 ../init ../init/mpi_init.o
time_jacobi.exe: time_jacobi.o jacobi.o				\
		 ../../utils ../../utils/utils.o		\
		 ../init ../init/mpi_init.o