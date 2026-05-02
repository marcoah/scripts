SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'cursos' AND pid <> pg_backend_pid();

DROP DATABASE cursos;
CREATE DATABASE cursos WITH OWNER = postgres ENCODING = 'UTF8';
