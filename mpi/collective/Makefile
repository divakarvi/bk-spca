include ../../root.mk
DIR := $(ROOT)/mpi/collective

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`
DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`

#########
CPP  := icpc
LIBS := -openmp $(MPILIBS)

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
include $(ROOT)/utils/rules.mk
include $(ROOT)/mpi/init/rules.mk
include rules.mk


test_bcast.exe: $(DIR)/test_bcast.o $(DIR)/bcast.o		\
		$(ROOT)/utils/utils.o				\
		$(ROOT)/mpi/init/mpi_init.o
time_bcast.exe: $(DIR)/time_bcast.o $(DIR)/bcast.o		\
		$(ROOT)/utils/utils.o $(ROOT)/utils/Table.o	\
		/mpi-init/mpi_init.o
test_all2all.exe: $(DIR)/test_all2all.o $(DIR)/all2all.o	\
		$(ROOT)/utils/utils.o				\
		$(ROOT)/mpi/init/mpi_init.o
time_all2all.exe: $(DIR)/time_all2all.o $(DIR)/all2all.o	\
		$(ROOT)/utils/utils.o 				\
		$(ROOT)/mpi/init/mpi_init.o
time_reduce.exe: $(DIR)/time_reduce.o $(DIR)/reduce.o		\
		$(ROOT)/utils/utils.o 				\
		$(ROOT)/mpi/init/mpi_init.o