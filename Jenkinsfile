pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/santhosh9790500644/guvii-capstone-dev'
        DOCKER_IMAGE_NAME = 'santhosh9790500644/guvii-capstone-dev'
    }

    stages {
        stage('Build') {
            steps {
                // Build your application
                sh 'sudo docker build -t $DOCKER_IMAGE_NAME .'
            }
        }
        stage('Tag and Push') {
            steps {
                // Tag and push Docker images with different tags
                script {
                    def tags = ['latest', 'v1.0', 'development']
                    tags.each { tag ->
                        sh "sudo docker tag $DOCKER_IMAGE_NAME $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$tag"
                        sh "sudo docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$tag"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deploy your application using Docker images
                sh 'docker-compose up -d'
            }
        }
    }
}
