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
        azureWebAppPublish(azureCredentialsId: params.AZURE_CREDENTIAL_ID, resourceGroup: params.RESOURCE_GROUP, appName: params.APP_NAME, deployOnlyIfSuccessful: true, filePath: '**/*.js,package.json,process.json')
      }
    }

  }
  parameters {
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
    credentials(name: 'AZURE_CREDENTIAL_ID', defaultValue: 'AZURE_CREDENTIAL_ID', description: 'Credenciales de Azure', credentialType: 'Azure Service Principal', required: true)
  }
}