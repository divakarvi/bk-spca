R := /home1/00013/tg456871/git/Programs/bk-spca

#########
CPP  := icpc
CFLAGS := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`

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
	rm pbs*.*; 
cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*;
