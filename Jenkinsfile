pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'docker.io/santhosh9790500644/guvii-capstone-dev'
        DOCKER_IMAGE_NAME = 'guvii-capstone-dev'
        VERSION_MAJOR = '1' // Initial major version
        VERSION_MINOR = '0' // Initial minor version
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
                script {
                    // Use Docker Hub credentials stored in Jenkins
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Log in to Docker Hub
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"

                        // Increment version minor for each build
                        def versionMinor = sh(script: 'echo $(( ${env.VERSION_MINOR} + 1 ))', returnStdout: true).trim()

                        // Tag and push Docker images with different tags
                        def tags = ['latest', "${VERSION_MAJOR}.${versionMinor}", 'development']
                        tags.each { tag ->
                            sh "docker tag $DOCKER_IMAGE_NAME $DOCKER_REGISTRY:$tag"
                            sh "docker push $DOCKER_REGISTRY:$tag"
                        }

                        // Update VERSION_MINOR for the next build
                        env.VERSION_MINOR = versionMinor
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Use Docker Hub credentials stored in Jenkins
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Log in to Docker Hub
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"

                        // Pull the latest image
                        sh "docker pull $DOCKER_REGISTRY:latest"

                        // Stop and remove the old container if it exists
                        sh """
                        docker stop guvii-capstone-dev || true
                        docker rm guvii-capstone-dev || true
                        """

                        // Run the container with port mapping
                        sh """
                        docker run -d --name guvii-capstone-dev -p 80:80 $DOCKER_REGISTRY:$tag
                        """
                    }
                }
            }
        }
    }
}
