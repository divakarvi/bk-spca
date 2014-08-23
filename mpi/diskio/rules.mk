#########
saved := $(D)
D := $(R)/mpi/diskio

#########
$(D)CFLAGS := $(CFLAGS) -fno-inline-functions -openmp -DCOLLECTIVE $(MPIINC)

#########
$(D)/%.o: $(D)/%.cpp
	$(eval TMPTMP = $(CPP) $($(@D)CFLAGS) $($(@D)EXTRNL) -o $@ -c $<)
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)
$(D)/%.s: $(D)/%.cpp 
	$(eval TMPTMP = $(CPP) $($(@D)CFLAGS) -fno-verbose-asm  \
	$($(@D)EXTRNL) -o $@ -S $<)
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)
$(D)/%.o: $(D)/%.s 
	$(CPP) $($(@D)CFLAGS) $($(@D)EXTRNL) -o $@ -c $< 
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

#########
$(D)/serial.o: $(D)/serial.cpp
-include $(D)/serial.d
$(D)/time_serial.o: $(D)/time_serial.cpp
-include $(D)/time_serial.d
$(D)/calc_latency.o: $(D)/calc_latency.cpp
-include $(D)/calc_latency.d
$(D)/lustre.o: $(D)/lustre.cpp
-include lustre.d

#########
D := $(saved)