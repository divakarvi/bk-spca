include ../root.mk
DIR := $(ROOT)/utils

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`

#########
CPP  := icpc
LIBS := 

#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
%.s: %.cpp
%.o: %.cpp
%.exe: %.cpp
%.o: %.s
%.exe: %.s
%.exe: %.o
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
include rules.mk
utils.o: $(DIR)/utils.o
test_stat.exe: $(DIR)/test_stat.o
test_table.exe: $(DIR)/test_table.o $(DIR)/Table.o