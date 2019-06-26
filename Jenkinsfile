node() { 
    stage('Checkout') {
        checkout scm 
    }         
            
    stage('Running Sonar') {
        docker.image('maven:ibmjava-alpine').inside {             
            sh '(cd SonarApplication && mvn sonar:sonar -Dsonar.host.url=http://172.17.0.2:9000)'        
        }
    }

    stage('Java Application') {
        sh 'docker-compose up -d'
    }

    stage('Migration DataBase') {            
        sh 'PGPASSWORD=postgres psql --host=db --port=5555 --username=postgres --file db/acesso_init.sql' 
    } 
}