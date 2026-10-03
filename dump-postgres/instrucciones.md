# Dump desde RDS y restore local en un solo paso

path_dump= C:\Program Files\PostgreSQL\<version>\bin\pg_dump.exe
path_restore= C:\Program Files\PostgreSQL\<version>\bin\pg_restore.exe

cd "C:\Program Files\PostgreSQL\18\bin\"

´´´bash
pg_dump -h <server>.rds.amazonaws.com -U <user> -d <database> -p 5432 --no-owner --no-acl -Fc -f c:\backup\backup.dump
´´´
Luego limpiar la base de datos local:

Ejecutar el script limpiarBDlocal.sql para eliminar la base de datos local y crear una nueva vacía:

Luego restore local:

´´´bash
pg_restore -h localhost -U <user> -d <database> --no-owner --no-acl -Fc -v c:\backup\backup.dump
