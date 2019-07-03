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
        sh 'docker-compose -p java-project up --build -d'
    }

    stage('Migration DataBase') {            
        sh './migration.sh' 
    } 
    
}