CPP := nvcc
CFLAGS := -O3 -prec-div=true -ftz=false -Drestrict="__restrict__" 
ARCH := sm_35
CFLAGS := $(CFLAGS) -arch=$(ARCH)
CFLAGS := $(CFLAGS) #-Xcompiler=-MMD,-MP #does not work, nvcc uses lots of tmps
CFLAGS := $(CFLAGS) -Xptxas=-v


######
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d .cu .ptx .cubin .fatbin
%.o: %.cpp
	$(CPP) $(CFLAGS) -x cu -dc $<
	@echo
%.o: %.cu
	$(CPP) $(CFLAGS) -dc $<
	@echo
%.ptx: %.cu
	$(CPP) $(CFLAGS) -ptx $<
	@echo
%.cubin: %.cu
	$(CPP) $(CFLAGS) -cubin $<
	@echo
%.fatbin: %.cu
	$(CPP) $(CFLAGS) -fatbin $<
	@echo
%.exe: %.o
	$(CPP) -arch=$(ARCH) -o $@ $(filter %.o,$^) $(LIBS)
	@echo

######
.PHONY: clean cleanx cleanxx
clean cleanx cleanxx:
	rm *.o; rm *.exe; rm a.out; rm *.cubin; rm *.ptx; rm *.fatbin; 