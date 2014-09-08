include ../makevars.mk
CFLAGS := $(CFLAGS) -DCOLLECTIVE -openmp 
LFLAGS := $(LFLAGS) -openmp 
MODS := ../../utils ../init

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ objl
	@echo -e '\n'

######
bcast.o: bcast.cpp
-include bcast.d
test_bcast.o: test_bcast.cpp
-include test_bcast.d
time_bcast.o: time_bcast.cpp
-include time_bcast.d
all2all.o: all2all.cpp
-include all2all.d
test_all2all.o: test_all2all.cpp
-include test_all2all.d
time_all2all.o: time_all2all.cpp
-include time_all2all.d
reduce.o: reduce.cpp
-include reduce.d
time_reduce.o: time_reduce.cpp
-include time_reduce.d

######
test_bcast.exe: test_bcast.o bcast.o					\
		 ../../utils ../../utils/utils.o			\
		 ../init ../init/mpi_init.o
time_bcast.exe: time_bcast.o bcast.o			 		\
		 ../../utils ../../utils/utils.o ../../utils/Table.o	\
		 ../init ../init/mpi_init.o
test_all2all.exe: test_all2all.o all2all.o				\
		 ../../utils ../../utils/utils.o			\
		 ../init ../init/mpi_init.o
time_all2all.exe: time_all2all.o all2all.o		 		\
		 ../../utils ../../utils/utils.o 			\
		 ../init ../init/mpi_init.o
time_reduce.exe: time_reduce.o reduce.o		 			\
		 ../../utils ../../utils/utils.o 			\
		 ../init ../init/mpi_init.o
