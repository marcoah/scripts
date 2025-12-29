import pandas as pd

df = pd.read_csv('datasets/data.csv')

#print(df.to_string()) 

print(df.info())  #informacion de la data
#print(df.tail()) 
print(df.head(10)) #imprime primeros 10