import pandas as pd

from pathlib import Path

BASE = Path(__file__).parent.parent  # sube a scripts/python/
df = pd.read_csv(BASE / 'datasets' / 'data.csv', sep=';')

print(df.to_string())   #imprime todo el dataframe sin truncar
print(df.info())        #informacion de la data
print(df.tail())        #imprime ultimas 5 filas
print(df.head(10))      #imprime primeros 10

