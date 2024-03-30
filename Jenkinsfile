##
pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "https://index.docker.io/v1/"
        DEV_IMAGE_NAME = "ahamed5485/dev"
        PROD_IMAGE_NAME = "ahamed5485/production"
        IMAGE_TAG = "latest"
    }
    
    stages {
        stage(' DEV Build Docker Image') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Build Docker image
                    docker.build("${DEV_IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
        stage(' PROD Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Build Docker image
                    docker.build("${PROD_IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
        stage('Push DEV Docker Image') {
            when {
                   branch 'dev'
                 }
            steps {
                script {
                    // Push Docker image
                    docker.withRegistry("${DOCKER_REGISTRY}", 'docker') {
                        docker.image("${DEV_IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
        stage('Push PROD Docker Image') {
            when {
                    branch 'master'
                }
            steps {
                script {
                    // Push Docker image
                    docker.withRegistry("${DOCKER_REGISTRY}", 'docker') {
                        docker.image("${PROD_IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}

