pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
      args '--privileged'
    }

  }
  stages {
    stage('Install') {
      steps {
        echo 'Probando 1 2 3'
        sh 'npm install'
      }
    }

    stage('Build') {
      steps {
        sh 'ng build'
      }
    }

    stage('Test') {
      steps {
        sh 'ng test --browsers ChromeHeadless'
      }
    }

  }
}