include ../makevars.mk
CFLAGSXX := -fno-inline-functions $(MKLINC)
LIBS := $(MKLLIBS)
MODS := ../utils ../pyplot

##################
.PHONY: $(MODS)
$(MODS):
	$(MAKE) --directory=$@ all

latency_utils.o: latency_utils.cpp
include latency_utils.d

array_walk.o: array_walk.cpp
include array_walk.d

time_walk.o: time_walk.cpp
include time_walk.d

time_walk.exe: time_walk.o array_walk.o latency_utils.o 

latency.o: latency.cpp
include latency.d

dummy.o: dummy.cpp
include dummy.d

table_latency.o: table_latency.cpp
include table_latency.d

table_latency.exe: table_latency.o latency.o dummy.o 		\
		   ../utils ../utils/utils.o ../utils/Table.o
