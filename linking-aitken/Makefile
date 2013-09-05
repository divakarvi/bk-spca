NOINLINE := true
include ../makevars.mk
LIBS := $(MKLLIBS)

##################################################
include MakefileC.mk

include MakefileF.mk

.PHONY: all

all: Aitken.o 

Aitken.o: Aitken.cpp
include Aitken.d

Leibniz.o: Leibniz.cpp
include Leibniz.d

Logseries.o: LogSeries.cpp
include LogSeries.d

Leibniz.exe: Leibniz.o Aitken.o

LogSeries.exe: LogSeries.o Aitken.o

include MakefileFCPP.mk