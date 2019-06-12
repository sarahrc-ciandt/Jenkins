def buildStatus = "SUCCESS"

node() { 
    stage 'Checkout'
        checkout scm

    stage 'Verifying if docker-compose exists'
        try {
            sh 'docker-compose --version'
        }
        catch(all) {
            echo 'Installing docker-compose'
            sh 'apk add py-pip'
            sh 'apk add python-dev libffi-dev openssl-dev gcc libc-dev make'
            sh 'pip install docker-compose'
        }               

    stage 'Running Sonar'
        try {
            sh 'cd SonarApplication/'
            sh 'mvn clean verify sonar:sonar'
            sh 'mvn clean package sonar:sonar'            
        }
        catch(all) {
            buildStatus = "FAILURE"
        }

    if (buildStatus == "SUCCESS") {
        stage 'Build DataBase Image'
            sh "docker build -t postgres_db -f db/Dockerfile ."  
    
        stage 'Java Application'
            sh "docker-compose -f docker-compose.yml up -d"
    }    
}