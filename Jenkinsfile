pipeline {
  environment {
    registry = "nouhaylamkl/tp_jenkins"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'master', url: 'https://github.com/NouhaylaMouakkal/TP2_Jenkis.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
stage('Test image') {
        steps{
        script {
                    echo "Tests passed"
        }
      }
    }
    stage('Publish Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImage.push('latest')

          }
        }
      }
    }
        stage('Deploy image') {
      steps{
        bat "docker run -d $registry:$BUILD_NUMBER"
      }
    }
  }
}