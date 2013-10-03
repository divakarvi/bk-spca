include ../makevars.mk
CFLAGSXX := -fno-inline-functions $(MKLINC)
LIBS := $(MKLLIBS)

latency_utils.o: latency_utils.cpp
include latency_utils.d

array_walk.o: array_walk.cpp
include array_walk.d

time_walk.o: time_walk.cpp
include time_walk.d

time_walk.exe: time_walk.o array_walk.o latency_utils.o 
