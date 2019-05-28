pipeline {
    agent none
    stages {
        stage('Data Base') {       
            agent {
                dockerfile {
                    dir 'db'
                    label 'my-defined-label'
                }
            }
            steps {
                sh 'docker build -t postgres_db -f db/DockerFile .'
            }
        // }
        // stage('Java Application') {
        //     steps {
        //         sh 'docker-compose -f docker-compose.yml up'
        //     }
        // }        
    }
}