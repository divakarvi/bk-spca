include ../makevars.mk

add.s: add.c 
	gcc -O2 -S -o $@ $<
add.o: add.s
	as -o $@ $< 
add.exe: add.o
	gcc -o $@ $<

addtwo.o: addtwo.s
	icc -c $<
addtwo.exe: addtwo.o
	icc -o $@ $<

addmany.o: addmany.s
	icc -c $<
addmany.exe: addmany.o
	icc -o $@ $<

-include cpuid.d
cpuid.o: cpuid.cpp
cpuid.exe: cpuid.o
