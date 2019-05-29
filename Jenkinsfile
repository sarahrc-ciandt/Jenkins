pipeline {
    agent none
    stages {
        stage('Data Base') {       
            agent {
                docker {
                    image 'postgres' 
                }
            }
            steps {
                sh 'docker-compose -f docker-compose.yml up'
            }
        }
        // stage('Java Application') {
        //     steps {
        //         sh 'docker-compose -f docker-compose.yml up'
        //     }
        // }        
    }
}