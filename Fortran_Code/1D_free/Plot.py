import matplotlib.pyplot as plt
import numpy as np


#E = np.genfromtxt('E.txt') #
E50 = np.genfromtxt('E50_1.txt') #
#Esource = np.genfromtxt('Esource.txt')

#E50_1 = np.genfromtxt('E50_1.txt') #
Esource_1 = np.genfromtxt('Esource_1.txt')

H = np.genfromtxt('H.txt') #

t = np.genfromtxt('T.txt') #

plt.plot(t,E50,color='b',ls='-',label='E50_new',lw=0.8)
#plt.plot(t,Esource,color='r',ls='--',label='Esource_new')
plt.yticks(np.arange(0, 1.1, step=0.1))

#plt.plot(t,E50_1,label='E50_1')
#plt.plot(t,Esource_1,label='Esource_1')

plt.grid(alpha=0.5)
plt.legend()
plt.show()
