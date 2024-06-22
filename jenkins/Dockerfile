FROM jenkins/jenkins:lts

USER root

# Instalar Docker CLI
RUN apt-get update && apt-get install -y docker.io

RUN curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '(?<=tag_name": ")([0-9.]+)')" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Añadir el usuario jenkins al grupo docker
RUN usermod -aG docker jenkins

USER jenkins