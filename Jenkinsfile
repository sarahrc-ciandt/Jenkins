node() { 
    stage 'Checkout'
        checkout scm    

    stage 'Running Sonar'        
        sh './dockerRunSonar.sh ${WORKSPACE}/SonarApplication'

    stage 'Java Application'
        sh './dockerRunApplication.sh "$(pwd)"' 
}