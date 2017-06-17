#ifndef asm4xnx4_1Oct2013
#define asm4xnx4_1Oct2013

/*
 * a: in column major format
 * b: in row major format
 * c: in skewed format (see test_asm.cpp)
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



