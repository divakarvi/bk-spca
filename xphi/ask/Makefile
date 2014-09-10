MMIC := -mmic 

test_add.o: test_add.cpp
	icpc $(MMIC) -openmp -O3 -c $^

test_add.exe: test_add.o 
	icpc $(MMIC) -openmp -o $@ $^

test_offl.o: test_offl.cpp
	icpc -openmp -O3 -c $^

test_offl.exe: test_offl.o 
	icpc -openmp -o $@ $^


clean:
	rm *.o *.exe;