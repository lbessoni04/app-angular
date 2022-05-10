pipeline {
  agent {
    docker {
      image 'valen97/node-chrome-angular:azure-cli'
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
        zip(zipFile: 'app', dir: '/dist/angular')
      }
    }

    stage('Test') {
      steps {
        sh 'ng test --browsers ChromeHeadless'
      }
    }

    stage('Deploy') {
      steps {
        withCredentials(bindings: [azureServicePrincipal('AZURE_CREDENTIAL_ID')]) {
          sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
          sh 'az webapp config appsettings set -g $RESOURCE_GROUP -n $APP_NAME --settings AZTENANTID=$AZURE_TENANT_ID'
          sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
        }

      }
    }

  }
  parameters {
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
  }
}