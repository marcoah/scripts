# Dump desde RDS y restore local en un solo paso:

path_dump= C:\Program Files\PostgreSQL\<version>\bin\pg_dump.exe
path_restore= C:\Program Files\PostgreSQL\<version>\bin\pg_restore.exe

cd "C:\Program Files\PostgreSQL\18\bin\"

´´´bash
pg_dump -h vital4femalepg.c1nfz4nhlr5n.eu-north-1.rds.amazonaws.com -U postgres -d cursos -p 5432 --no-owner --no-acl -Fc -f c:\backup\cursos-backup.dump
´´´
Luego limpiar la base de datos local:

Ejecutar el script limpiarBDlocal.sql para eliminar la base de datos local y crear una nueva vacía:

Luego restore local:

´´´bash
pg_restore -h localhost -U postgres -d cursos --no-owner --no-acl -Fc -v c:\backup\cursos-backup.dump
