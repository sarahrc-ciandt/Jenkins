pipeline {
    agent none
    stages {
        stage('build images') {
            steps {
                sh 'docker build -t postgres_db -f db/DockerFile .'
            }
        }
        // stage('docker-compose') {
        //     steps {
        //         sh 'docker-compose -f docker-compose.yml up'
        //     }
        // }        
    }
}