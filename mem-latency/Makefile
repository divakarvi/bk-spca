include ../makevars.mk
CFLAGSXX := -fno-inline-functions $(MKLINC)
LIBS := $(MKLLIBS)

latency_utils.o: latency_utils.cpp
include latency_utils.d

array_walk.o: array_walk.cpp
include array_walk.d

time_stride.o: time_stride.cpp
include time_stride.d

time_stride.exe: time_stride.o array_walk.o latency_utils.o 
