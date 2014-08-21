#########
SDIR := $(DIR)
DIR := $(ROOT)/mpi/exchange

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
$(DIR)/exchange.o: $(DIR)/exchange.cpp
-include $(DIR)/exchange.d

$(DIR)/test_xchg.o: $(DIR)/test_xchg.cpp
-include $(DIR)/test_xchg.d

$(DIR)/time_xchg.o: $(DIR)/time_xchg.cpp
-include $(DIR)/time_xchg.d
#########
DIR := $(SDIR)