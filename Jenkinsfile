node() { 
    stage 'Checkout'
        checkout scm    

    stage 'Running Sonar'        
        sh './dockerRunSonar.sh'

    stage 'Java Application'
        sh "./dockerRunApplication.sh"       
}