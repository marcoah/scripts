import pyodbc

conn = pyodbc.connect('DRIVER={SQL Server};SERVER=;DATABASE=;UID=;PWD=')
conn.connect()