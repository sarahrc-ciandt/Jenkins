def buildStatus = "SUCCESS"

node() { 
    stage 'Checkout'
        checkout scm

    stage 'Checking dependencies'
        try {
            sh 'docker-compose --version'
        }
        catch(all) {
            echo 'Installing docker-compose'
            sh 'apk add py-pip'
            sh 'apk add python-dev libffi-dev openssl-dev gcc libc-dev make'
            sh 'pip install docker-compose'
        }    
        try {
            sh 'mvn --version'
        }
        catch(all) {
            echo 'Installing maven'
            sh 'apk add maven'
        }           

    stage 'Running Sonar'        
        try {
            sh '(cd SonarApplication/; mvn clean verify sonar:sonar; mvn clean package sonar:sonar)'           
        }          
        catch(all) {
            buildStatus = "FAILURE"
        }

    if (buildStatus == "SUCCESS") {
        stage 'Build DataBase Image'
            sh "docker build -t postgres_db -f db/Dockerfile ."  
    
        stage 'Java Application'
            sh "docker-compose up -d"

        stage 'Configuring DataBase'
            sh 'docker exec -it data_base su - postgres'
            sh 'PGPASSWORD=postgres psql --host=db --port=5432 --username=postgres --file /opt/acesso_init.sql'
    }    
}