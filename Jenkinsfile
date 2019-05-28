pipeline {
    agent none
    stages {
        stage('Data Base') {       
            agent {
                docker {image 'postgres' }
            }
            steps {
                acho 'Hello, Data Base'
            }
        }
        // stage('Java Application') {
        //     steps {
        //         sh 'docker-compose -f docker-compose.yml up'
        //     }
        // }        
    }
}