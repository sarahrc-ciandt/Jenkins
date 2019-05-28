pipeline {
    agent any
    stages {
        stage('Data Base') {            
            steps {
                sh 'docker build -t postgres_db -f db/DockerFile .'
            }
        }
        stage('Java Application') {
            steps {
                sh 'docker-compose -f docker-compose.yml up'
            }
        }        
    }
}