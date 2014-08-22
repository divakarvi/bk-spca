#########
saved := $(D)
D := $(R)/mpi/jacobi

#########
$(D)CFLAGS := $(CFLAGS) -openmp -fno-inline-functions $(MPIINC) 

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
$(D)/jacobi.o: $(D)/jacobi.cpp
-include $(D)/jacobi.d
$(D)/test_jacobi.o: $(D)/test_jacobi.cpp
-include $(D)/test_jacobi.d
$(D)/time_jacobi.o: $(D)/time_jacobi.cpp
-include $(D)/time_jacobi.d

#########
D := $(saved)