#########
saved := $(D)
D := $(R)/mpi/transpose

#########
$(D)CFLAGS := $(CFLAGS) -DOMPCPY -DFTRANS $(MPIINC) -openmp

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
$(D)/timer.o: $(D)/timer.cpp
-include $(D)/timer.d
$(D)/trans.o: $(D)/trans.cpp
-include $(D)/trans.d
$(D)/test_trans.o: $(D)/test_trans.cpp
-include $(D)/test_trans.d
$(D)/time_trans.o: $(D)/time_trans.cpp
-include $(D)/time_trans.d
$(D)/fast_trans.o: $(D)/fast_trans.cpp
-include $(D)/fast_trans.d
#########
D := $(saved)