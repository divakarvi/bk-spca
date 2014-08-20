include ../../root.mk
DIR := $(ROOT)/mpi/intro

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`

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
include $(DIR)/rules.mk
procname.exe: $(DIR)/procname.o
