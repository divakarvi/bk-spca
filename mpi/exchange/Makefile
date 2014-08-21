include ../../root.mk
DIR := $(ROOT)/mpi/exchange

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
include $(ROOT)/utils/rules.mk
include $(ROOT)/mpi/init/rules.mk
test_xchg.exe: $(DIR)/test_xchg.o $(DIR)/exchange.o 			\
	       $(ROOT)/utils $(ROOT)/utils/utils.o			\
	       $(ROOT)/mpi/init/mpi_init.o
time_xchg.exe: $(DIR)/time_xchg.o $(DIR)/exchange.o 			\
	       $(ROOT)/utils/utils.o $(ROOT)/utils/Table.o		\
	       $(ROOT)/mpi/init/mpi_init.o