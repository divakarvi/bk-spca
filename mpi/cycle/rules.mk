#########
SDIR := $(DIR)
DIR := $(ROOT)/mpi/cycle

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
CPP 	 := icpc
CFLAGS 	 := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGSXX := $(MPIINC)

#########
$(DIR)/%.o: $(DIR)/%.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $<
$(DIR)/%.s: $(DIR)/%.cpp 
	$(CPP) $(CFLAGS) -fno-verbose-asm $(CFLAGSXX) $(EXTRNL) -o $@ -S $< 
$(DIR)/%.o: $(DIR)/%.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $< 

#########
$(DIR)/cycle.o: $(DIR)/cycle.cpp
-include $(DIR)/cycle.d
$(DIR)/test_cycle.o: $(DIR)/test_cycle.cpp
-include $(DIR)/test_cycle.d
$(DIR)/time_cycle.o: $(DIR)/time_cycle.cpp
-include $(DIR)/time_cycle.d
#########
DIR := $(SDIR)