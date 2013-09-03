#! /usr/bin/env python
import numpy as np
from scipy import fftpack
from StringIO import StringIO
import sys

def read(fname):
    return np.genfromtxt(fname, dtype='float')

def verify(v, vf):
    """
    v = name of file with data for complex vector v
    vf = name of file with data for complex vector vf
    checks if vf is the fft of v
    """
    v = read(v)
    n = v.shape[0]
    vf = read(vf)
    j = complex(0,1);
    v = v[:,0] + j*v[:,1]
    vf = vf[:,0] + j*vf[:,1]
    vff = fftpack.fft(v)
    print v, '\n\n'
    print vf, '\n\n'
    print vff, '\n\n'
    print sum(v),'   ', sum(v)/n
    print sum(v[::2]),'  ', sum(v[::2]/n)

    

if(__name__ == "__main__"):
    verify(sys.argv[1], sys.argv[2])
