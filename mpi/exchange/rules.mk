#########
saved := $(D)
D := $(R)/mpi/exchange

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
$(D)/exchange.o: $(D)/exchange.cpp
-include $(D)/exchange.d

$(D)/test_xchg.o: $(D)/test_xchg.cpp
-include $(D)/test_xchg.d

$(D)/time_xchg.o: $(D)/time_xchg.cpp
-include $(D)/time_xchg.d
#########
D := $(saved)