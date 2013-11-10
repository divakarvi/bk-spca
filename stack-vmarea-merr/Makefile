include ../makevars.mk

##########
hanoi.o: hanoi.c
	icc -c -O3 $<
hanoi.s: hanoi.c
	icc -O3 -S -fno-verbose-asm $<
hanoi.exe: hanoi.o
	icc -o $@ $<

##########
stacksize.o: stacksize.cpp
	g++ -c -O3 $<
dummy.o: dummy.cpp
	g++ -c -O3 $<
stacksize.exe: stacksize.o dummy.o
	g++ -o $@ $^

##########
induce_segf.exe: induce_segf.o segf.o  
	g++ -o $@ $^
induce_segf.o: induce_segf.cpp
	g++ -fno-inline-functions -O0 -c $<
segf.o: segf.cpp
	g++ -fno-inline-functions -O0 -c $<
segf.s: segf.cpp
	g++ -S -O0 -c $<

##########
induce_merr.exe: induce_merr.o maccess.o dummy.o 
	g++ -o $@ $^
induce_merr.o: induce_merr.cpp
	g++ -O0 -c $<
maccess.o: maccess.cpp
	g++ -O0 -c $<