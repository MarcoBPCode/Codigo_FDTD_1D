import matplotlib.pyplot as plt
import numpy as np

x=np.linspace(0, 200, 200)
t=np.linspace(0, 50, 50)
#t=np.linspace(0, 250, 250)

Dx,Dt=np.meshgrid(x,t)

print(Dx.shape)

E = np.genfromtxt('dataE.txt') #
E = E[0:50,:]
print(E.shape)

fig, ax = plt.subplots()

grafo=ax.contourf(Dx,Dt,E,cmap='plasma',alpha = 0.5)

#fig.tight_layout()
plt.title('E field')

cbar = ax.figure.colorbar(grafo, ax= ax)
cbar.ax.set_ylabel("E field", rotation = -90, va = "bottom")

print(np.max(E))

plt.grid(alpha=0.5)
#plt.legend()
plt.show()