node() { 
    stage 'Checkout'
        checkout scm    

    stage 'Running Sonar'        
        
        docker.image('maven_git').withRun('-i --rm --name my-maven-project') { c ->
            sh 'pwd'
            sh 'git clone https://github.com/sarahrc-ciandt/Jenkins.git'
            sh 'cd Jenkins/SonarApplication'
            sh 'mvn sonar:sonar -Dsonar.host.url=http://172.17.0.3:9000'
        }

    stage 'Java Application'
        sh './dockerRunApplication.sh' 
}