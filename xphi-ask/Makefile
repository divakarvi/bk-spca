MMIC := -mmic 

init_add.o: init_add.cpp
	icpc $(MMIC) -openmp -O3 -c $^

test_add.o: test_add.cpp
	icpc $(MMIC) -openmp -O3 -c $^

test_add.exe: test_add.o init_add.o
	icpc $(MMIC) -openmp -o $@ $^

clean:
	rm *.o *.exe;