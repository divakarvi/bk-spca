-include ../makevars.mk
CFLAGSXX := -openmp $(MKLINC)
LIBS := -openmp $(MKLLIBS)
MODS := ../utils ../mem-latency

##############
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

#############

latency.o: latency.cpp
-include latency.d

latency.exe: latency.o ../utils 					\
	     ../utils/utils.o ../utils/Table.o 				\
	     ../mem-latency ../mem-latency/latency.o 			\
	     ../mem-latency/latency_utils.o ../mem-latency/dummy.o