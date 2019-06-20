node() { 
    stage 'Checkout'
        checkout scm   
            
    stage 'Running Sonar'

        docker.image('maven:ibmjava-alpine').withRun('-v /var/lib/docker/volumes/jenkins-data/_data/workspace/JavaApplication/SonarApplication:/usr/src/maven-project -w /usr/src/maven-project') { c ->
            sh 'mvn sonar:sonar -Dsonar.host.url=http://172.17.0.3:9000'        
        }

    stage 'Java Application'
        sh './dockerRunApplication.sh' 
}