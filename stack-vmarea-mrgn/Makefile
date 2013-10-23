hanoi.o: hanoi.c
	icc -c -O3 $<
hanoi.s: hanoi.c
	icc -O3 -S2 -fno-verbose-asm $<
hanoi.exe: hanoi.o
	icc -o $@ $<
