pipeline {
    agent any

    stages {
        stage('Clone'){
          	steps {
				checkout scm
			}
        }
        
        stage('Build') {
            steps {
				docker.build("pestotoast/nextcloud")
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}