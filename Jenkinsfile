pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "https://index.docker.io/v1/"
        IMAGE_NAME = "ahamed5485/dev"
        IMAGE_TAG = "latest"
    }
    
    stages {
        stage('Build Docker Image') {
    
            steps {
                script {
                    // Build Docker image
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
        
        stage('Push PROD Docker Image') {
        
            steps {
                script {
                    // Push Docker image
                    docker.withRegistry("${DOCKER_REGISTRY}", 'docker') {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}
