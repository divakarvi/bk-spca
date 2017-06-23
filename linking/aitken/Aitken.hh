#ifndef AitkenAugust09DVjli
#define AitkenAugust09DVjli
#include "../../utils/Vector.hh"

/* 
 * Applies Aitken transformation to seq1 to produce seq2.
 * Length of seq2 must be 2 less than that of seq1.
 */
void Aitken(const Vector& seq1, Vector& seq2);

/*
 * Overwrites seq after the Aitken transformation.
 * The last two entries of seq are set to zero.
 */
void Aitken(Vector& seq);

/*
 * Extrapolates seq using repeated Aitken transformations.
 * Returns extrapolated value. 
 * If printflag==1, the sequence is printed after each iteration.
 */
double AitkenE(const Vector& seq, int printflag=0);
#endif

