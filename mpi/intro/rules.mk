#########
SDIR := $(DIR)
DIR := $(ROOT)/mpi/intro

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
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
$(DIR)/%.o: $(DIR)/%.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $<
$(DIR)/%.s: $(DIR)/%.cpp 
	$(CPP) $(CFLAGS) -fno-verbose-asm $(CFLAGSXX) $(EXTRNL) -o $@ -S $< 
$(DIR)/%.o: $(DIR)/%.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $< 

#########
$(DIR)/procname.o: $(DIR)/procname.cpp
-include $(DIR)/procname.d

#########
DIR := $(SDIR)