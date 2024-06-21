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
            steps {
                script {
                    try {
                        docker.build('app1', './app1')
                    } catch (Exception e) {
                        echo "Error during Build app1: ${e.message}"
                        throw e
                    }
                }
            }
        }
        stage('Build app2') {
            steps {
                script {
                    try {
                        docker.build('app2', './app2')
                    } catch (Exception e) {
                        echo "Error during Build app2: ${e.message}"
                        throw e
                    }
                }
            }
        }
        stage('Deploy Services') {
            steps {
                script {
                    try {
                        sh 'docker-compose up -d'
                    } catch (Exception e) {
                        echo "Error during Deploy Services: ${e.message}"
                        throw e
                    }
                }
            }
        }
    }
}