include ../../root.mk
DIR := $(ROOT)/mpi/intro

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`

DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`
ifeq ($(DV),on)
    $(info USING DV BUILD OF OPENMPI)
    MPILIBS  := $(DVMPILIBS)
endif

#########
CPP  := icpc
LIBS := $(MPILIBS)

#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d

%.exe: 
	$(CPP) $(EXTRNL) -o $@ $(filter %.o,$^) $(LIBS)

########
.PHONY: clean cleanx cleanxx
clean:
	rm *.o; rm *.exe; rm a.out;

cleanx:
	rm pbs*.*; 

cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*;

########

procname.exe: $(DIR)/procname.o

include $(DIR)/rules.mk