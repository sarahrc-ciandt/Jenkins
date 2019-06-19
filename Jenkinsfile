node() { 
    stage 'Checkout'
        checkout scm    

    stage 'Build'
        docker_image = docker.build("maven_git", '-f maven_git/Dockerfile .')

    /*stage 'Running Sonar'

        docker_image.inside('-i --rm --name maven-project -v "${1}":/usr/src/mydocker') {
            sh 'pwd'

            -v "${1}":/usr/src/mydocker \
        -w /usr/src/mydocker
        }       
        
        docker.image('maven_git').withRun('-i --rm --name my-maven-project') { c -> 
            sh 'pwd'                      
            sh 'git clone https://github.com/sarahrc-ciandt/Jenkins.git'
            sh 'cd Jenkins/SonarApplication'
            sh 'mvn sonar:sonar -Dsonar.host.url=http://172.17.0.3:9000'                 
        }       */
    stage 'Running Sonar'
        sh './dockerRunSonar.sh'

    stage 'Java Application'
        sh './dockerRunApplication.sh' 
}