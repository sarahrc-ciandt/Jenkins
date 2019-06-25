node() { 
    stage('Checkout') {
        checkout scm 
    }         
            
    // stage('Running Sonar') {
    //     docker.image('maven:ibmjava-alpine').inside {             
    //         sh '''cd SonarApplication'''
    //         sh '''mvn sonar:sonar -Dsonar.host.url=http://172.17.0.2:9000)'''        
    //     }
    // }

    stage('Java Application') {
        sh 'docker-compose up -d'
    }

    stage('Migration DataBase') {
        docker.image('postgres').inside('--network=jenkins_new') {             
            sh '''psql --version'''
            sh '''pwd'''
            sh '''PGPASSWORD=postgres psql --host=db --port=5432 --username=postgres --file db/acesso_init.sql'''        
        }
    } 
}