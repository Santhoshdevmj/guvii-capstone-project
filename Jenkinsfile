pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials'
        DOCKER_IMAGE_NAME = 'guvii-capstone-dev'
        DOCKER_REGISTRY = 'docker.io/santhosh9790500644/guvii-capstone-dev'
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} .")

                }
            }
        }
        
        stage('Push Image to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry("https://index.docker.io/v1/", "docker") {
                            docker.image("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}").push("latest")
                        }
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        sh "docker pull ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:latest"
                        sh "docker stop ${DOCKER_IMAGE_NAME} || true"
                        sh "docker rm ${DOCKER_IMAGE_NAME} || true"
                        sh "docker run -d --name ${DOCKER_IMAGE_NAME} -p 80:80 ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:latest"
                    }
                }
            }
        }
    }
}
