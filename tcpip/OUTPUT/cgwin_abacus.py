#! /usr/bin/env python
import numpy as np
import scipy as sp
import matplotlib as mpl
import matplotlib.pyplot as plt
cg0 = np.genfromtxt("cgwin_abacus.txt")
avg0 = np.average(cg0[:,1])
print 'avg cg in figure: ',avg0
p1, = plt.plot(cg0[:,0]/1000, cg0[:,1],ls=':',lw=3.0)
plt.ylim(0, 90)
plt.xlim(0, 30)
plt.xlabel('Time in Seconds', fontsize=16)
plt.ylabel('Congestion Window', fontsize=16)
ax = plt.gca()
ax.tick_params(axis='both', which='major', labelsize=16)
ax.tick_params(axis='both', which='minor', labelsize=14)
plt.show()

