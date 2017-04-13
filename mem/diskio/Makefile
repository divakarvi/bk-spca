include ../../makevars.mk
CFLAGS := $(CFLAGS) 

######
.PHONY: $(MODS)
$(MODS):
	@echo -e '\n'
	make --directory=$@ objl
	@echo -e '\n'

######
pagecache.o: pagecache.cpp
-include pagecache.d
serial.o: serial.cpp
-include serial.d
time_serial.o: time_serial.cpp
-include time_serial.d
calc_latency.o: calc_latency.cpp
-include calc_latency.d

######
pagecache.exe: pagecache.o
time_serial.exe: time_serial.o serial.o dummy.o
calc_latency.exe: calc_latency.o serial.o dummy.o

