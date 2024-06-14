import matplotlib.pyplot as plt
import numpy as np


x=np.linspace(0, 200, 200)
t=np.linspace(0, 250, 250)

Dx,Dt=np.meshgrid(x,t)

print(Dx.shape)

E = np.genfromtxt('dataE.txt') #

print(E.shape)


fig, ax = plt.subplots()

grafo=ax.contourf(Dx,Dt,E,cmap='plasma',alpha = 0.5)

#fig.tight_layout()
plt.title('E field')

cbar = ax.figure.colorbar(grafo, ax= ax)
cbar.ax.set_ylabel("E field", rotation = -90, va = "bottom")

print(np.max(E))



"""
H = np.genfromtxt('dataH.txt') #

fig, bx = plt.subplots()
bx.contourf(Dx,Dt,H)#, cmap = "Reds")
fig.tight_layout()
plt.title('H')
"""

plt.grid(alpha=0.5)
#plt.legend()
plt.show()
