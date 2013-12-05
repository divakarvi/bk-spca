include ../makevars.mk
CFLAGSXX := -fno-inline-functions #-DMEMWALK
LIBS := 
MODS := ../utils ../pyplot

##################
.PHONY: $(MODS)
$(MODS):
	$(MAKE) --directory=$@ all

all: latency.o latency_utils.o dummy.o

latency_utils.o: latency_utils.cpp
-include latency_utils.d

array_walk.o: array_walk.cpp
-include array_walk.d

time_walk.o: time_walk.cpp
-include time_walk.d

time_walk.exe: time_walk.o array_walk.o latency_utils.o 

latency.o: latency.cpp
-include latency.d

dummy.o: dummy.cpp
-include dummy.d

table_latency.o: table_latency.cpp
-include table_latency.d

table_latency.exe: table_latency.o latency.o dummy.o latency_utils.o	\
		   ../utils ../utils/utils.o ../utils/Table.o

hist_latency.o: hist_latency.cpp
-include hist_latency.d

hist_latency.exe: hist_latency.o latency.o dummy.o latency_utils.o	\
		   ../utils ../utils/utils.o 				\
		   ../pyplot ../pyplot/pyhist.o