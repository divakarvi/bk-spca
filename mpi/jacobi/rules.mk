#########
SDIR := $(DIR)
DIR := $(ROOT)/mpi/jacobi

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
CPP 	 := icpc
CFLAGS 	 := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGSXX := -openmp -fno-inline-functions $(MPIINC)

#########
$(DIR)/%.o: $(DIR)/%.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $<
$(DIR)/%.s: $(DIR)/%.cpp 
	$(CPP) $(CFLAGS) -fno-verbose-asm $(CFLAGSXX) $(EXTRNL) -o $@ -S $< 
$(DIR)/%.o: $(DIR)/%.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $< 

#########
$(DIR)/jacobi.o: $(DIR)/jacobi.cpp
-include $(DIR)/jacobi.d
$(DIR)/test_jacobi.o: $(DIR)/test_jacobi.cpp
-include $(DIR)/test_jacobi.d
$(DIR)/time_jacobi.o: $(DIR)/time_jacobi.cpp
-include $(DIR)/time_jacobi.d

#########
DIR := $(SDIR)