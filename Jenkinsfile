pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git branch: 'master', // Change 'master' to your desired branch
          url: 'https://github.com/Santhoshdevmj/guvii-capstone-project.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t varmavikramvasudev65624/guvii-capstone-dev-project:latest .' 
      }
    }
    stage('Push Image to Docker Hub') {
    steps {
        script {
            def credentialsId = 'docker-hub-credentials'
            withCredentials([usernamePassword(credentialsId: credentialsId, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                sh "docker push varmavikramvasudev65624/guvii-capstone-dev-project:latest"
            }
        }
    }
}

    stage('Deploy Container') {
      steps {
        sh 'docker pull varmavikramvasudev65624/guvii-capstone-dev-project:latest'
        sh 'docker run -d -p 80:80 --name guvii-capstone-dev-project varmavikramvasudev65624/guvii-capstone-dev-project:latest'
      }
    }
  }
}
