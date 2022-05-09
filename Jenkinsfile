pipeline {
  agent {
    docker {
      image 'valen97/node-chrome-angular'
      args '--privileged'
    }

  }
  stages {
    stage('Install') {
      agent {
        docker {
          image 'valen97/node-chrome-angular'
        }

      }
      steps {
        sh 'npm install'
      }
    }

    stage('Build') {
      agent {
        docker {
          image 'valen97/node-chrome-angular'
        }

      }
      steps {
        sh 'ng build'
      }
    }

    stage('Test') {
      agent {
        docker {
          image 'valen97/node-chrome-angular'
          args '--privileged'
        }

      }
      steps {
        sh 'ng test --browsers ChromeHeadless'
      }
    }

    stage('Deploy') {
      agent {
        docker {
          image 'bitnami/azure-cli:latest'
        }

      }
      steps {
        withCredentials(bindings: [azureServicePrincipal('AZURE_CREDENTIAL_ID')]) {
          sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
        }

      }
    }

  }
  parameters {
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
  }
}