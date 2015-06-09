include ../../makevars.mk

######
add.s: add.c 
	gcc -O2 -S -o $@ $<
add.o: add.s
	as -o $@ $< 
add.exe: add.o
	gcc -o $@ $<

######
addtwo.o: addtwo.s
	gcc -c $<
addtwo.exe: addtwo.o
	gcc -o $@ $<

######
addmany.o: addmany.s
	gcc -c $<
addmany.exe: addmany.o
	gcc -o $@ $<

######
-include cpuid.d
cpuid.o: cpuid.cpp
cpuid.exe: cpuid.o
