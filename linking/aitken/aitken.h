#ifndef aitkenJuly09DVsfe
#define aitkenJuly09DVsfe

/*
 * seq1: s_0, s_1, s_2, s_3, ... (at input).
 * seq2: t_0, t_1, t_2, t_3, ... (at output).
 * (t_{n} = s_n - (s_{n+1}-s_n)^2/(s_{n+2}-2s_{n+1}+s_n).
 * len: length of seq1.
 * seq2 has two fewer entries than seq1.
 */
void aitken(const double *seq1, double *seq2, int len);

/*
 * Applies the aitken iteration as many times as 
 * possible to seq1.
 * seq2 is scratch space. 
 * Both seq1 and seq2 are overwritten.
 * Returns extrapolated value.
 */
double aitkenExtrapolate(double *seq1, double* seq2, int len);

#endif

