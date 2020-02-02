pipeline {
    agent any

    stages {
        stage('Clone'){
          checkout scm
        }
        
        stage('Build') {
            steps {
                app = docker.build("pestotoast/nextcloud")
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