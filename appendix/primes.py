#! /usr/bin/env python
import numpy as np

def primes(n):
    assert n >= 3
    p = np.zeros((n+1), dtype = bool)
    p[0] = False
    p[1] = False
    p[2] = True
    ksqrt = 1
    for k in range(3,n+1):
        if ksqrt*ksqrt < k:
            ksqrt += 1
        p[k] = True
        for j in range(2, ksqrt+1):
            if p[j] and k%j == 0:
                p[k] = False
                break
    return p

if __name__ == '__main__':
    n = 1000*1000*10
    x = np.arange(0, n+1)
    import time
    start = time.time()
    p = primes(n)
    secs = time.time() - start
    print('number of primes <= {0}: {1}'.format(n, x[p].size))
    print('time elapsed: {0} secs'.format(secs))
    CPUGHZ = 3.6
    print('assuming CPUGHZ to be ', CPUGHZ)
    print('time elapsed: {0:.7e} cycles'.format(secs*CPUGHZ*1e9))
    
    
            

