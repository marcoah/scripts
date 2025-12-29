import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm
 

df = pd.read_csv('datasets/countries.csv', sep=';')

print(df.head(5))

print('Cantidad de Filas y columnas:',df.shape)
print('Nombre columnas:',df.columns)
print('Tipos de datos:\n', df.dtypes)
