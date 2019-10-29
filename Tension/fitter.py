import numpy as np
from lmfit import Model
import pylab
import array

#Function for forced oscillation
def resonance(x, c1, c2, gamma, omega):
	return (c1*x - c2*(omega**2 - x**2)*x/((omega**2 - x**2)**2 + (2*gamma*x)**2))


gmodel = Model(resonance)

def bipolar_reso(y_val, x_val, params_init, y_fit, y_ifit, params_fit):
	result = gmodel.fit(y_val, x = x_val, c1 = params_init[0], c2 = params_init[1], gamma = params_init[2], omega = params_init[3])
	y_fit[:] =  result.best_fit
	y_ifit[:] = result.init_fit

	params_fit[:] = result.best_values.values()
	print(result.fit_report())
	




