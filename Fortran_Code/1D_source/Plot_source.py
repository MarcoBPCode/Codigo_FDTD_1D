import matplotlib.pyplot as plt
import numpy as np


E = np.genfromtxt('E.txt') #
E50 = np.genfromtxt('E50.txt') #
E40 = np.genfromtxt('E40.txt') #
E30 = np.genfromtxt('E30.txt') #
E20 = np.genfromtxt('E20.txt') #
Eaux = np.genfromtxt('Eaux.txt') #
Esource = np.genfromtxt('Esource.txt')

H = np.genfromtxt('H.txt') #

t = np.genfromtxt('T.txt') #

#plt.plot(t,E50,color='b',ls='-',label='E50_new',lw=0.8)

plt.plot(t[0:199],E20,color='b',ls='-',label='E20',lw=0.8)
plt.plot(t[0:199],E30,color='r',ls='-',label='E30',lw=0.8)
plt.plot(t[0:199],E40,color='g',ls='-',label='E40',lw=0.8)
plt.plot(t[0:199],Eaux,color='m',ls='-',label='Eaux',lw=0.8)

#plt.plot(t,Esource,color='r',ls='--',label='Esource_new')
plt.yticks(np.arange(0, 1.1, step=0.1))

#plt.plot(t,E50_1,label='E50_1')
#plt.plot(t,Esource_1,label='Esource_1')

plt.title('Wave Propagation')
plt.grid(alpha=0.5)
plt.legend()
plt.show()
