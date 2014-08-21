#########
SDIR := $(DIR)
DIR := $(ROOT)/mpi/collective

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
CPP 	 := icpc
CFLAGS 	 := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGSXX := -fno-inline-functions -openmp $(MPIINC)

#########
$(DIR)/%.o: $(DIR)/%.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $<
$(DIR)/%.s: $(DIR)/%.cpp 
	$(CPP) $(CFLAGS) -fno-verbose-asm $(CFLAGSXX) $(EXTRNL) -o $@ -S $< 
$(DIR)/%.o: $(DIR)/%.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $< 

#########
$(DIR)/bcast.o: $(DIR)/bcast.cpp
-include $(DIR)/bcast.d
$(DIR)/test_bcast.o: $(DIR)/test_bcast.cpp
-include $(DIR)/test_bcast.d
$(DIR)/time_bcast.o: $(DIR)/time_bcast.cpp
-include $(DIR)/time_bcast.d
$(DIR)/all2all.o: $(DIR)/all2all.cpp
-include $(DIR)/all2all.d
$(DIR)/test_all2all.o: $(DIR)/test_all2all.cpp
-include $(DIR)/test_all2all.d
$(DIR)/time_all2all.o: $(DIR)/time_all2all.cpp
-include $(DIR)/time_all2all.d
$(DIR)/reduce.o: $(DIR)/reduce.cpp
-include $(DIR)/reduce.d
$(DIR)/time_reduce.o: $(DIR)/time_reduce.cpp
-include time_reduce.d
#########
DIR := $(SDIR)