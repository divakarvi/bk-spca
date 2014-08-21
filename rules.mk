#########
saved := $(D)
D := $(R)

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
CPP 	 := icpc
$(D)CFLAGS := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGSXX :=
$(D)CFLAGS := $($(D)CFLAGS) $(CFLAGSXX)

#########
$(D)/%.o: $(D)/%.cpp
	$(CPP) $($(@D)CFLAGS) $($(@D)EXTRNL) -o $@ -c $<
$(D)/%.s: $(D)/%.cpp 
	$(CPP) $($(@D)CFLAGS) -fno-verbose-asm  $($(@D)EXTRNL) -o $@ -S $< 
$(D)/%.o: $(D)/%.s 
	$(CPP) $($(@D)CFLAGS) $($(@D)EXTRNL) -o $@ -c $< 

#########

#########
D := $(saved)