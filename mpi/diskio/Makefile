include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp $(MPIINC)
LIBS := -openmp $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
pagecache.exe: pagecache.cpp
	g++ -O3 -o $@ $<

serial.o: serial.cpp
-include serial.d

time_serial.o: time_serial.cpp
-include time_serial.d

calc_latency.o: calc_latency.cpp
-include calc_latency.d

time_serial.exe: time_serial.o serial.o dummy.o

calc_latency.exe: calc_latency.o serial.o dummy.o

test_lustre.exe: test_lustre.o lustre.o ../mpi-init ../mpi-init/mpi_init.o

time_lustre.exe: time_lustre.o lustre.o ../mpi-init ../mpi-init/mpi_init.o