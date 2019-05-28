pipeline {
    agent { dockerfile true }
    stages {
        stage('build images') {
            steps {
                sh 'docker build -t postgres_db -f DockerFile \db'
            }
        }
        stage('docker-compose') {
            steps {
                sh 'docker-compose -f docker-compose.yml up'
            }
        }        
    }
}