import numpy as np
np.set_printoptions(precision=3,suppress=True)
import simil

source_points =  [[658000.00095,7745999.99981,0],[664051.772667158,7752586.05015018,0]]

target_points = [[0,0,0],[8000,4000,0]]



source_points_array = np.array(source_points)
target_points_array = np.array(target_points)

# Get the parameters
m_scalar, r_matrix, t_vector = simil.process(source_points_array,target_points_array)

# Print the parameters
print('\n m scalar = \n' + str(m_scalar))
print('\n R matrix = \n' + str(r_matrix))
print('\n T vector = \n' + str(t_vector))

# Print them ready for the WKT
print('\n A0 = ' + str(t_vector[0]))
print('\n A1 = ' + str(m_scalar * r_matrix[0][0]))
print('\n A2 = ' + str(m_scalar * r_matrix[0][1]))
print('\n B0 = ' + str(t_vector[1]))
print('\n B1 = ' + str(m_scalar * r_matrix[1][0]))
print('\n B2 = ' + str(m_scalar * r_matrix[1][1]))
