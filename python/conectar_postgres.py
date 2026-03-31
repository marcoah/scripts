import psycopg2

conexion1 = psycopg2.connect(database="postgres", user="postgres", password="master")

cursor1=conexion1.cursor()

sql = "create table articulos (id serial primary key, descripcion varchar(50), precio numeric)"
cursor1.execute(sql)

sql="insert into articulos(descripcion, precio) values (%s,%s)"
datos=("naranjas", 23.50)
cursor1.execute(sql, datos)

datos=("peras", 34)
cursor1.execute(sql, datos)
datos=("bananas", 25)
cursor1.execute(sql, datos)

conexion1.commit()
conexion1.close()