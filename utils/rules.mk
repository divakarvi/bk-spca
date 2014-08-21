#########
SDIR := $(DIR)
DIR := $(ROOT)/utils

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
CPP 	 := icpc
CFLAGS 	 := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGSXX := -fPIC

#########
$(DIR)/%.o: $(DIR)/%.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $<
$(DIR)/%.s: $(DIR)/%.cpp 
	$(CPP) $(CFLAGS) -fno-verbose-asm $(CFLAGSXX) $(EXTRNL) -o $@ -S $< 
$(DIR)/%.o: $(DIR)/%.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) $(EXTRNL) -o $@ -c $< 

#########
$(DIR)/utils.o: $(DIR)/utils.cpp
-include $(DIR)/utils.d

$(DIR)/Table.o: $(DIR)/Table.cpp
-include $(DIR)/Table.d

$(DIR)/test_stat.o: $(DIR)/test_stat.cpp
-include $(DIR)/test_stat.d

$(DIR)/test_table.o: $(DIR)/test_table.cpp
-include $(DIR)/test_table.d

#########
DIR := $(SDIR)