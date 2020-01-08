import numpy as np


nn = 10000
xx = np.linspace(0, 6*np.pi, num=nn)
yy = 3.0*np.sin(xx)
np.savetxt('data.dat', yy, delimiter='\n')        
