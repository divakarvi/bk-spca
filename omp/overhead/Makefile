include ../makevars.mk
MODS := ../../utils

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ obj


######
dummy.o: dummy.cpp
-include dummy.d
parallelA.o: parallelA.cpp
-include parallelA.d
parallelB.o: parallelB.cpp
-include parallelB.d
time_parallel.o: time_parallel.cpp
-include time_parallel.d
barrier.o: barrier.cpp
-include barrier.d
ompfor.o: ompfor.cpp
-include ompfor.d
calc_overhead.o: calc_overhead.cpp
-include calc_overhead.d

######
time_parallel.exe: time_parallel.o parallelA.o parallelB.o dummy.o	\
		   ../../utils ../../utils/utils.o
calc_overhead.exe: calc_overhead.o barrier.o ompfor.o dummy.o	\
		   ../../utils ../../utils/utils.o ../../utils/Table.o
