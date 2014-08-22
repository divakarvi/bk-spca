include ../../root.mk
D := $(R)/mpi/collective

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


test_bcast.exe: $(D)/test_bcast.o $(D)/bcast.o		\
		$(R)/utils/utils.o				\
		$(R)/mpi/init/mpi_init.o

time_bcast.exe: $(D)/time_bcast.o $(D)/bcast.o		\
		$(R)/utils/utils.o $(R)/utils/Table.o	\
		$(R)/mpi/init/mpi_init.o
test_all2all.exe: $(D)/test_all2all.o $(D)/all2all.o	\
		$(R)/utils/utils.o				\
		$(R)/mpi/init/mpi_init.o
time_all2all.exe: $(D)/time_all2all.o $(D)/all2all.o	\
		$(R)/utils/utils.o 				\
		$(R)/mpi/init/mpi_init.o
time_reduce.exe: $(D)/time_reduce.o $(D)/reduce.o		\
		$(R)/utils/utils.o 				\
		$(R)/mpi/init/mpi_init.o