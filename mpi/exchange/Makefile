include ../makevars.mk
MODS := ../../utils ../mpi-init

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ objl
	@echo -e '\n'

######
exchange.o: exchange.cpp
-include exchange.d
test_xchg.o: test_xchg.cpp
-include test_xchg.d
time_xchg.o: time_xchg.cpp
-include time_xchg.d

######
test_xchg.exe: test_xchg.o exchange.o 					\
	       ../../utils ../../utils/utils.o				\
	       ../init ../init/mpi_init.o
time_xchg.exe: time_xchg.o exchange.o 					\
	       ../../utils ../../utils/utils.o ../../utils/Table.o 	\
	       ../init ../init/mpi_init.o
