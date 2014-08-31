include ../makevars.mk
LIBS := $(MPILIBS)
MODS := ../../utils ../init

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ obj
	@echo -e '\n'

######
cycle.o: cycle.cpp
-include cycle.d
test_cycle.o: test_cycle.cpp
-include test_cycle.d
time_cycle.o: time_cycle.cpp
-include time_cycle.d

######
test_cycle.exe: test_cycle.o cycle.o 					\
		../../utils ../../utils/utils.o				\
		../init ../init/mpi_init.o	
time_cycle.exe: time_cycle.o cycle.o					\
		../../utils ../../utils/utils.o ../../utils/Table.o	\
		../init ../init/mpi_init.o