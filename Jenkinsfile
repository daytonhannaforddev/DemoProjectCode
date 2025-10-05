pipeline {
  agent any

  tools {
    jdk 'jdk17'
    maven 'maven-3.9'
  }

  triggers {
    pollSCM('H/2 * * * *')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build & Test') {
      steps {
        bat 'mvn -B -DskipTests=false clean verify'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        bat 'docker build -t pipeline-demo:%BUILD_NUMBER% .'
      }
    }

    stage('Deploy Container') {
      steps {
        bat 'docker stop pipeline-demo || ver > nul'
        bat 'docker rm pipeline-demo || ver > nul'
        bat 'docker run -d --name pipeline-demo -p 8081:8080 pipeline-demo:%BUILD_NUMBER%'
      }
    }
  }

  post {
    success {
      echo "✅ Application deployed! Visit http://localhost:8081/"
    }
  }
}
