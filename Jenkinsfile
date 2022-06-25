pipeline {
  
  agent any//{ dockerfile { args '--privileged --network=host' } }
  //options { skipDefaultCheckout() } 
  
  stages {
    stage('Checkout'){
        steps{
          echo 'hola'
        }
    }

    stage('Install') {
      steps {
        echo 'hola'
      }
    }

    stage('Build') {
      parallel {
        stage('Build Dev') {          
          steps {
            echo 'hola'
          }
        }

        stage('Build Prod') {          
          steps {
            echo 'hola'
          }
        }
      }
    }
    
    stage('Test') {
      steps {
        echo 'hola'
      }
    }

    stage('SonarQube Analysis') {      
      steps {        
        echo 'hola'
      }
    }

    stage('Quality Gate') {
      steps {
        echo 'hola'
      }
    }
    
    stage('Deploy') {
      parallel {
        stage('Deploy Dev') {
          steps {
            echo 'hola'
          }
        }

        stage('Deploy Prod') {          
          steps {            
            echo 'hola'
          }
        }
      }
    }
  }
  parameters {
    string(name: 'ENV_PROD', defaultValue: 'production', description: 'Nombre del entorno de producción')
    string(name: 'ENV_DEV', defaultValue: 'development', description: 'Nombre del entorno de desarrollo')
    string(name: 'RESOURCE_GROUP', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-DEV', description: 'Grupo de Recursos')
    string(name: 'RESOURCE_GROUP_PROD', defaultValue: 'SOCIUSRGLAB-RG-MODELODEVOPS-PROD', description: 'Grupo de Recursos')
    string(name: 'APP_NAME', defaultValue: 'sociuswebapptest007', description: 'Nombre de App Service')
    string(name: 'APP_NAME_PROD', defaultValue: 'sociuswebapptest002p', description: 'Nombre de App Service')
  }
}
