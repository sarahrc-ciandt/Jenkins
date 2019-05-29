node() { 
    stage 'Checkout'
        checkout scm
    stage 'Build Image'
        sh "docker build -t postgres_db -f db/Dockerfile ."
  
    stage 'Application'
        sh 'whoami'
        // sh "docker-compose -f docker-compose.yml up"
}
