import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm

from pathlib import Path

BASE = Path(__file__).parent.parent  # sube a scripts/python/
df = pd.read_csv(BASE / 'datasets' / 'countries.csv', sep=';')

print(df.head(5))

print('Cantidad de Filas y columnas:',df.shape)
print('Nombre columnas:',df.columns)
print('Tipos de datos:\n', df.dtypes)

