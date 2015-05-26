#! /usr/bin/env python
import numpy as np
from scipy import linalg
from io import StringIO
import sys

def read(fname):
    return np.genfromtxt(fname, dtype='float')

def verify(Af, bf, xf):
    """
    Af = name of file with A matrix (must be square)
    bf = name of file with vector b (same dim as A)
    xf = name of file with computed soln of Ax = b
    verify() computes the solution using sp.linalg and prints the error
    """
    A = read(Af)
    b = read(bf)
    x = read(xf)
    xx = linalg.solve(A, b)
    error = linalg.norm(x-xx)/linalg.norm(xx)
    print('relative error = ', error)

def test1():
    Af = StringIO('1 2 3 \n 3 2 1 \n 1 -1 2')
    xf = StringIO('1 \n 1 \n 1')
    bf = StringIO('6 \n 6 \n 2')
    verify(Af, bf, xf)

if(__name__ == "__main__"):
    #test1();
    verify(sys.argv[1], sys.argv[2], sys.argv[3])
