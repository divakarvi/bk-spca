include ../../root.mk
D := $(R)/mpi/jacobi

#########
LIBS := -openmp $(MPILIBS)

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include $(R)/utils/rules.mk
include $(R)/mpi/init/rules.mk
include rules.mk
test_jacobi.exe: $(D)/test_jacobi.o $(D)/jacobi.o		\
		 $(R)/utils/utils.o				\
		 $(R)/mpi/init/mpi_init.o
time_jacobi.exe: $(D)/time_jacobi.o $(D)/jacobi.o		\
		 $(R)/utils/utils.o				\
		 $(R)/mpi/init/mpi_init.o