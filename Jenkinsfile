pipeline {
  agent {
    docker {
      image 'valen97/node-chrome-angular'
      args '--privileged'
    }

  }
  stages {
    stage('Install') {
      steps {
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

    stage('Deploy') {
      steps {
        sh 'apt-get update'
        sh 'apt-get install curl'
        sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | bash'
      }
    }

  }
  parameters {
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
  }
}