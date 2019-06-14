node() { 
    stage 'Checkout'
        checkout scm    

    stage 'Running Sonar'        
        sh './dockerRunSonar.sh $(pwd)'

    stage 'Java Application'
        sh "./dockerRunApplication.sh $(pwd)"       
}