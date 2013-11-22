#########
CPP 	 := icpc
CFLAGS 	 := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP

MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC 	 := -I $$MKL_INC

MKLLIBS  := -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core 	\
	    -lpthread
MKLTHRD  := -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core \
	    -lpthread -lm
FFTWLIB  :=  -L $$FFTW_LINK -lfftw3
MPILIBS  := `mpiCC -showme:link`

DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`
ifeq ($(DV),on)
    export DV
    $(info USING dv build of OpenMPI)
    MPIINC   := $(DVMPIINC)
    MPILIBS  := $(DVMPILIBS)
endif


#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
%.o: %.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) -c $<
%.s: %.cpp 
	$(CPP) $(CFLAGS) -fno-verbose-asm $(CFLAGSXX) -S $< 
%.o: %.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) -c $< 
%.exe: %.o 
	$(CPP) -o $@ $(filter %.o,$^) $(LIBS) 

########
.PHONY: clean cleanx cleanxx
clean:
	rm *.o; rm *.exe; rm a.out;

cleanx:
	rm pbs*.*; 

cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*;