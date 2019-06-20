node() { 
    stage('Checkout') {
        checkout scm 
    }         
            
    stage('Running Sonar') {

        docker.image('maven:ibmjava-alpine').inside {             
            sh '(cd SonarApplication && mvn sonar:sonar -Dsonar.host.url=http://172.17.0.3:9000)'        
        }
    }

    stage('Java Application') {
        sh 'docker-compose up -d'
    }

    stage('Migration DataBase') {
        sh 'docker cp db/acesso_init.sql data_base:/opt/acesso_init.sql'
        sh 'docker exec data_base su - postgres && PGPASSWORD=postgres psql --host=localhost --port=5432 --username=postgres --file /opt/acesso_init.sql'

    }


   
}