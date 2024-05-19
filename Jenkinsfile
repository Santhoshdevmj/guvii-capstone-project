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
        sh 'docker build -t santhosh9790500644/guvii-capstone-dev:latest .' // Build with ":latest" tag
      }
    }
    stage('Push Image to Docker Hub') {
      steps {
        script {
          def imageName = "santhosh9790500644/guvii-capstone-dev:latest"
          def credentialsId = 'docker-hub-credentials'
          sh "docker login -u \${env.DOCKER_USERNAME} -p \${env.DOCKER_PASSWORD}"
          sh "docker push ${imageName}"
        }
      }
    }
    stage('Deploy Container') {
      steps {
        sh 'docker pull santhosh9790500644/guvii-capstone-dev:latest'
        sh 'docker run -d -p 80:80 santhosh9790500644/guvii-capstone-dev:latest --name guvii-capstone-dev' // Add container name (optional)
      }
    }
  }
}
