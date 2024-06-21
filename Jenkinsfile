pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Obtener el código fuente desde el repositorio configurado en SCM
                checkout scm
            }
        }
        stage('Build app1') {
            agent {
                // Usar Docker para construir la imagen de app1
                docker { image 'docker:19.03.12' }
            }
            steps {
                script {
                    // Construir la imagen Docker para app1 usando el Dockerfile en la carpeta app1
                    docker.build('app1', 'app1')
                }
            }
        }
        stage('Build app2') {
            agent {
                // Usar Docker para construir la imagen de app2
                docker { image 'docker:19.03.12' }
            }
            steps {
                script {
                    // Construir la imagen Docker para app2 usando el Dockerfile en la carpeta app2
                    docker.build('app2', 'app2')
                }
            }
        }
        stage('Deploy Services') {
            steps {
                // Desplegar los servicios usando docker-compose
                sh 'docker-compose up -d'
            }
        }
    }
}