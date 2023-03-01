pipeline {
  agent { dockerfile { args '--privileged --network=host' } }
  //options { skipDefaultCheckout() }

  stages {
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }

    stage('Build') {
      environment {
          TITLE = 'prod'
          BUTTON = 'danger'
      }
      steps {
        //contentReplace(configs: [fileContentReplaceConfig(configs: [fileContentReplaceItemConfig(replace: "${TITLE}", search: '%TITLE%|dev'), fileContentReplaceItemConfig(replace: "${BUTTON}", search: '%BUTTON%|success')], fileEncoding: 'UTF-8', filePath: "${env.WORKSPACE}" + '/prod/src/environments/environment.ts')])
        sh 'ng build --configuration ${ENV_PROD}'
      }
    }

    stage('Test') {
      steps {
        sh 'ng test --browsers ChromeHeadless'
      }
    }

    stage('SonarQube Analysis') {
      environment {
        sonarHome = tool 'sonar-scanner'
        JAVA_HOME = tool 'openjdk-11'
      }
      steps {
        withSonarQubeEnv('sonarqube') {
          sh "${sonarHome}/bin/sonar-scanner"
        }
      }
    }

    stage('Quality Gate') {
      steps {
        waitForQualityGate true
        echo '--- QualityGate Passed ---'
      }
    }

    stage('Deploy') {
      environment {
        dockerHome = tool 'docker'
        dockerHub = credentials('VsDockerHub')
      }
      steps {
        sh "echo 'FROM nginx:1.17.1-alpine \nCOPY dist/app-angular /usr/share/nginx/html' > Dockerfile"
        sh "${dockerHome}/bin/docker login -u $dockerHub_USR -p $dockerHub_PSW"
        sh "${dockerHome}/bin/docker build -t valen97/calculadora ."
        sh "${dockerHome}/bin/docker push valen97/calculadora"
        sh "${dockerHome}/bin/docker logout"
        withCredentials(bindings: [azureServicePrincipal('prodServicePrincipal')]) {
          sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
          sh 'az webapp create -p $PLAN_PROD -n $APP_NAME_PROD -g $RESOURCE_GROUP_PROD -i valen97/calculadora'
        }
      }
    }
  }
  parameters {
    string(name: 'ENV_PROD', defaultValue: 'production', description: 'Nombre del entorno de producción')
    string(name: 'RESOURCE_GROUP_PROD', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-PROD', description: 'Grupo de Recursos')
    string(name: 'APP_NAME_PROD', defaultValue: 'sociuswebapptest002p', description: 'Nombre de App Service')
    string(name: 'PLAN_PROD', defaultValue: 'Plan-SociusRGLABRGModeloDevOpsDockerProd', description: 'Nombre de plan de RG')
  }
}
