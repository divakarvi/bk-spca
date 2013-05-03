#! /usr/bin/env python
import numpy as np
import scipy as sp
import matplotlib as mpl
import matplotlib.pyplot as plt
cg0 = np.genfromtxt("cgwin_317kbs.txt")
avg0 = np.average(cg0[:,1])
cg1 = np.genfromtxt("cgwin_500kbs.txt")
avg1 = np.average(cg1[:,1])
cg2 = np.genfromtxt("cgwin_820kbs.txt")
avg2 = np.average(cg2[:,1])
cg3 = np.genfromtxt("cgwin_850kbs.txt")
avg3 = np.average(cg3[:,1])
cg4 = np.genfromtxt("cgwin_1050kbs.txt")
avg4 = np.average(cg4[:,1])
print 'average/bw = ', avg0/317, avg1/500, avg2/820, avg3/850, avg4/1050
p1, = plt.plot(cg0[:,0]/1000, cg0[:,1],ls=':',lw=3.0)
p2, = plt.plot(cg1[:,0]/1000, cg1[:,1], ls='--',lw=2.0)
p3, = plt.plot(cg4[:,0]/1000, cg4[:,1],lw=1.0)
plt.legend([p1,p2,p3],["317 KB/s", "500 KB/s", "1050 KB/s"])
plt.ylim(0, 90)
plt.xlim(0, 65)
plt.xlabel('Time in Seconds', fontsize=16)
plt.ylabel('Congestion Window', fontsize=16)
ax = plt.gca()
ax.tick_params(axis='both', which='major', labelsize=16)
ax.tick_params(axis='both', which='minor', labelsize=14)
plt.show()

