#########
saved := $(D)
D := $(R)/mpi/cycle

#########
$(D)CFLAGS := $(CFLAGS) $(MPIINC)

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
$(D)/cycle.o: $(D)/cycle.cpp
-include $(D)/cycle.d
$(D)/test_cycle.o: $(D)/test_cycle.cpp
-include $(D)/test_cycle.d
$(D)/time_cycle.o: $(D)/time_cycle.cpp
-include $(D)/time_cycle.d
#########
D := $(saved)