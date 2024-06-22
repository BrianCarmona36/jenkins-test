FROM jenkins/jenkins:lts

USER root

# Instalar Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Añadir el usuario jenkins al grupo docker
RUN usermod -aG docker jenkins

USER jenkins