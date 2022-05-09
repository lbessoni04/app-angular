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
      environment {
        AZURE_CREDENTIAL_ID = credentials('AZURE_CREDENTIAL_ID')
        DOCKER_HUB = credentials('DockerHub')
      }
      steps {
        sh 'pwd'
        azureWebAppPublish(azureCredentialsId: env.AZURE_CREDENTIAL_ID, resourceGroup: params.RESOURCE_GROUP, appName: params.APP_NAME, deployOnlyIfSuccessful: true, dockerImageName: 'angular-dockerizado', dockerImageTag: 'latest', dockerRegistryEndpoint: [credentialsId: ${env.DOCKER_HUB}, url: "https://hub.docker.com/r/valen97/angular-dockerizado"])
      }
    }

  }
  parameters {
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
  }
}