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
        sh 'ng build --prod'
      }
    }

    stage('Test') {
      steps {
        sh 'ng test --browsers ChromeHeadless'
      }
    }

    stage('Deploy') {
      steps {
        echo 'hola'
      }
    }

  }
  parameters {
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
    credentials(name: 'AZURE_CREDENTIAL_ID', defaultValue: 'AZURE_CREDENTIAL_ID', description: 'Credenciales de Azure', credentialType: 'Azure Service Principal', required: true)
  }
}