include ../../root.mk
DIR := $(ROOT)/mpi/cycle

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
%: %.cpp
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
include $(ROOT)/utils/rules.mk
include $(ROOT)/mpi/init/rules.mk
include rules.mk

test_cycle.exe: $(DIR)/test_cycle.o $(DIR)/cycle.o 		\
		$(ROOT)/utils/utils.o				\
		$(ROOT)/mpi/init/mpi_init.o

time_cycle.exe: $(DIR)/time_cycle.o $(DIR)/cycle.o		\
		$(ROOT)/utils/utils.o $(ROOT)/utils/Table.o	\
		$(ROOT)/mpi/init/mpi_init.o