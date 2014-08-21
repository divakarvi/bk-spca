include root.mk
d := $(r)

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`

#########
CPP  := icpc
$(d)LIBS := 

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
%.exe: 
	$(CPP) $($(d)EXTRNLL) -o $@ $(filter %.o,$^) $($(d)LIBS)

########
.PHONY: clean cleanx cleanxx
clean:
	rm *.o; rm *.exe; rm a.out;
cleanx:
	rm pbs*.*; 
cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*;

########