include ../makevars.mk
MODS := ../init
CFLAGS := $(CFLAGS) #-DCOLLECTIVE

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ objl
	@echo -e '\n'

######
lustre.o: lustre.cpp
-include lustre.d
test_lustre.o: test_lustre.cpp
-include test_lustre.d
time_lustre.o: time_lustre.cpp
-include time_lustre.d

######
test_lustre.exe: test_lustre.o lustre.o ../init ../init/mpi_init.o
time_lustre.exe: time_lustre.o lustre.o ../init ../init/mpi_init.o

