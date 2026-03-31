# Comandos básicos

## Ver estado

docker ps # contenedores activos
docker ps -a # todos
docker images # imágenes

## Construir la imagen

docker build -t mi-node-app .

docker run -p 3000:3000 mi-node-app

## Ejecutar algo rápido

docker run hello-world
docker run -it ubuntu bash

## Levantar app con puertos

docker run -d -p 8080:80 nginx

## Crear imagen desde Dockerfile

docker build -t mi-app .

## Ejecutar tu app

docker run -d -p 3000:3000 mi-app

## Parar y borrar

docker stop <id>
docker rm <id>
docker rmi <imagen>
