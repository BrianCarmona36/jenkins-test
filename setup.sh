#!/bin/bash

# Obtener el ID del grupo Docker del host
DOCKER_GROUP_ID=$(getent group docker | cut -d: -f3)

# Exportar el ID del grupo Docker como variable de entorno
export DOCKER_GROUP_ID

# Levantar los servicios con Docker Compose
docker-compose up -d

# Añadir el grupo Docker con el ID del host dentro del contenedor
docker exec -u root jenkins groupadd -g $DOCKER_GROUP_ID docker || true
docker exec -u root jenkins usermod -aG docker jenkins || true

# Reiniciar el contenedor Jenkins para aplicar los cambios
docker restart jenkins