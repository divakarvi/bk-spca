#########
saved := $(D)
D := $(R)/mpi/collective

#########
$(D)CFLAGS := $(CFLAGS) -fno-inline-functions -openmp $(MPIINC)

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
$(D)/bcast.o: $(D)/bcast.cpp
-include $(D)/bcast.d
$(D)/test_bcast.o: $(D)/test_bcast.cpp
-include $(D)/test_bcast.d
$(D)/time_bcast.o: $(D)/time_bcast.cpp
-include $(D)/time_bcast.d
$(D)/all2all.o: $(D)/all2all.cpp
-include $(D)/all2all.d
$(D)/test_all2all.o: $(D)/test_all2all.cpp
-include $(D)/test_all2all.d
$(D)/time_all2all.o: $(D)/time_all2all.cpp
-include $(D)/time_all2all.d
$(D)/reduce.o: $(D)/reduce.cpp
-include $(D)/reduce.d
$(D)/time_reduce.o: $(D)/time_reduce.cpp
-include time_reduce.d

#########
D := $(saved)