pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'docker.io/santhosh9790500644/guvii-capstone-dev'
        DOCKER_IMAGE_NAME = 'guvii-capstone-dev'
    }

    stages {
        stage('Build') {
            steps {
                // Build your application
                sh "docker build -t $DOCKER_IMAGE_NAME ."
            }
        }
        stage('Tag and Push') {
            steps {
                // Tag and push Docker images with different tags
                script {
                    def tags = ['latest', 'v1.0', 'development']
                    tags.each { tag ->
                        sh "docker tag $DOCKER_IMAGE_NAME $DOCKER_REGISTRY:$tag"
                        sh "docker push $DOCKER_REGISTRY:$tag"
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
