include ../makevars.mk
CFLAGS := $(CFLAGS) -DOMPCPY -DFTRANS -openmp
LFLAGS := $(LFLAGS) -openmp
MODS := ../../utils ../init

######
.PHONY: $(MODS)

$(MODS):
	@echo -e '\n'
	make --directory=$@ objl
	@echo -e '\n'

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

######
test_trans.exe: test_trans.o trans.o fast_trans.o timer.o	\
		../../utils ../../utils/utils.o			\
		../init ../init/mpi_init.o
time_trans.exe: time_trans.o trans.o fast_trans.o timer.o	\
		../../utils ../../utils/utils.o			\
		../init ../init/mpi_init.o

