#include "../utils/utils.hh"
#include "volatile.hh"

int main(){
	int x = 7;
	const int len = 5;
	int list[len] = {1, 2, 3, 4, 5};

	array_show(list, len, "initial list");

	addx(&x, list, len);
	array_show(list, len, "added 5 using addx");

	vaddx(&x, list, len);
	array_show(list, len, "added 5 using vaddx [volatile]");
}
