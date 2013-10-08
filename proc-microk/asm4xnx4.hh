#ifndef __asm4xnx4_1Oct2013__
#define __asm4xnx4_1Oct2013__

/*
 * a = column major format
 * b = row major format
 * c = skewed format (see test_asm.cpp)
 */
extern "C"{
	void asm4x1x4(double *a, double *b, double *c);
	void asm4x4x4(double *a, double *b, double *c);
	void asm4x20x4(double *a, double *b, double *c);
	void asm4x40x4(double *a, double *b, double *c);
	void asm4x100x4(double *a, double *b, double *c);
	void asm4x200x4(double *a, double *b, double *c);
}
#endif


