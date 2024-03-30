pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "ahamed5485"
        IMAGE_NAME = "dev"
        IMAGE_TAG = "latest"
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image
                    docker.withRegistry("${DOCKER_REGISTRY}", 'your_registry_credentials_id') {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}

