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
serial.o: CPP := icpc
serial.o: serial.cpp
-include serial.d
time_serial.o: CPP := icpc
time_serial.o: time_serial.cpp
-include time_serial.d
calc_latency.o: CPP := icpc
calc_latency.o: calc_latency.cpp
-include calc_latency.d
test_lustre.o: test_lustre.cpp
-include test_lustre.d
time_lustre.o: time_lustre.cpp
-include time_lustre.d

######
pagecache.exe: pagecache.cpp
	g++ -O3 -o $@ $<
time_serial.exe: CPP := icpc
time_serial.exe: time_serial.o serial.o dummy.o
calc_latency.exe: CPP := icpc
calc_latency.exe: calc_latency.o serial.o dummy.o
test_lustre.exe: test_lustre.o lustre.o ../init ../init/mpi_init.o
time_lustre.exe: time_lustre.o lustre.o ../init ../init/mpi_init.o