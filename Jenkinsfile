pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials'
        DOCKER_IMAGE_NAME = 'guvii-capstone-dev'
        DOCKER_REGISTRY = 'docker.io/santhosh9790500644'
        DOCKER_IMAGE_TAG = 'latest' // Change the tag here
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
                    docker.build("-t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .")
                }
            }
        }
        
        stage('Push Image to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry("https://index.docker.io/v1/", "docker") {
                            docker.image("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push("latest")
                        }
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        sh "docker pull ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                        sh "docker stop ${DOCKER_IMAGE_NAME} || true"
                        sh "docker rm ${DOCKER_IMAGE_NAME} || true"
                        sh "docker run -d --name ${DOCKER_IMAGE_NAME} -p 80:80 ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
