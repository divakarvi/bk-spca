include ../makevars.mk

############
.PHONY: ../utils
../utils:
	$(MAKE) --directory=$@ all

###########
all: asm4x1x4.o asm4x4x4.o asm4x20x4.o asm4x40x4.o asm4x100x4.o asm4x200x4.o

asm4x1x4.o: asm4x1x4.s
asm4x4x4.o: asm4x4x4.s
asm4x20x4.o: asm4x20x4.s
asm4x40x4.o: asm4x40x4.s
asm4x100x4.o: asm4x100x4.s
asm4x200x4.o: asm4x200x4.s

test_asm.o: test_asm.cpp
include test_asm.d

time_asm.o: time_asm.cpp
include time_asm.d

test_asm.exe: test_asm.o 
time_asm.exe: asm4x1x4.o asm4x4x4.o  asm4x20x4.o  asm4x40x4.o \
	      asm4x100x4.o asm4x200x4.o 
test_asm.exe: ../utils ../utils/utils.o

time_asm.exe: time_asm.o
time_asm.exe: asm4x1x4.o asm4x4x4.o  asm4x20x4.o  asm4x40x4.o \
	      asm4x100x4.o asm4x200x4.o 
time_asm.exe: ../utils ../utils/utils.o ../utils/Table.o