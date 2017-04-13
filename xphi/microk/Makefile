include ../makevars.mk
EXTRNL := -mmic
export EXTRNL
MODS := ../../utils

######
%.exe:  
	$(CPP) $(EXTRNL) $(LFLAGS) -o $@ $(filter %.o,$^) $(LIBS)

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl
######
test_instn.o: test_instn.cpp
-include test_instn.d
test_asm.o: test_asm.cpp
-include test_asm.d
time_asm.o: time_asm.cpp
-include time_asm.d

######
test_instn: test_instn0.exe test_instn1.exe test_instn2.exe test_instn3.exe\
	    test_instn4.exe test_instn5.exe test_instn6.exe test_instn7.exe
	echo 'test instn done'
test_instn0.exe: test_instn.o fma0.o
test_instn1.exe: test_instn.o fma1.o
test_instn2.exe: test_instn.o fma2.o
test_instn3.exe: test_instn.o fma3.o
test_instn4.exe: test_instn.o fma4.o
test_instn5.exe: test_instn.o fma5.o
test_instn6.exe: test_instn.o fma6.o
test_instn7.exe: test_instn.o fma7.o
test_asm.exe: test_asm.o 						\
	      asm8x1x8.o 						\
	      asm8x12x8.o						\
	      asm8x24x8.o						\
	      asm8x36x8.o						\
	      asm8x48x8.o						\
	      ../../utils  ../../utils/utils.o
time_asm.exe: time_asm.o 						\
	      asm8x1x8.o 						\
	      asm8x12x8.o						\
	      asm8x24x8.o						\
	      asm8x36x8.o						\
	      asm8x48x8.o						\
	      ../../utils  ../../utils/utils.o ../../utils/Table.o
