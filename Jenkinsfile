pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Install') {
      steps {
        echo 'Probando 1 2 3'
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