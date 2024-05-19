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
    // stage('Push Image to Docker Hub') {
    //   steps {
    //     script {
    //       def imageName = "varmavikramvasudev65624/guvii-capstone-dev-project:latest"
    //       def credentialsId = 'docker-hub-credentials'
    //       sh "docker login -u \${env.DOCKER_USERNAME} -p \${env.DOCKER_PASSWORD}"
    //       sh "docker push ${imageName}"
    //     }
    //   }
    // }
    // stage('Deploy Container') {
    //   steps {
    //     sh 'docker pull varmavikramvasudev65624/guvii-capstone-dev-project:latest'
    //     sh 'docker run -d -p 80:80 varmavikramvasudev65624/guvii-capstone-dev-project:latest --name guvii-capstone-dev-project'
    //   }
    // }
  }
}
