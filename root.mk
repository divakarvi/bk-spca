R := $(shell echo $$HOME)/git/Programs/bk-spca

#########
CPP  := icpc
CFLAGS := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $(shell echo $$FFTW_INC)
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $(shell echo $$FFTW_LINK -lfftw3)
MPILIBS := `mpiCC -showme:link`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`
MPION = yes
ifeq ($(MPION), yes)
	MPILIBS := 
	MPIINC := 
	DVMPILIBS :=
	DVMPIINC :=
	MPICC := mpicxx
endif
#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
%: %.cpp
%.s: %.cpp
%.o: %.cpp
%.exe: %.cpp
%.o: %.s
%.exe: %.s
%.exe: %.o

########
.PHONY: clean cleanx cleanxx
clean:
	rm *.o; rm *.exe; rm a.out;
cleanx:
	rm pbs*.*; rm slurm*.out;
cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*; rm *.out
########
 