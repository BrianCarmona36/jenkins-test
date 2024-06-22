#!/bin/bash

# Obtener el ID del grupo Docker del host
DOCKER_GROUP_ID=$(getent group docker | cut -d: -f3)

# Exportar el ID del grupo Docker como variable de entorno
export DOCKER_GROUP_ID

# Detener los servicios actuales
docker-compose down

# Levantar los servicios con Docker Compose
docker-compose up -d --build

# Añadir el grupo Docker con el ID del host dentro del contenedor, si no existe
docker exec -u root integracioncontinua-jenkins-1 sh -c "getent group docker || groupadd -g $DOCKER_GROUP_ID docker"

# Añadir el usuario jenkins al grupo docker
docker exec -u root integracioncontinua-jenkins-1 usermod -aG docker jenkins

# Reiniciar el contenedor Jenkins para aplicar los cambios
docker restart integracioncontinua-jenkins-1
# 194cc34bd6ae4219a7be5256a7c4ba37