node() { 
    stage 'Checkout'
        checkout scm
    stage 'Build Image'
        sh "docker build -t postgres_db -f db/Dockerfile ."
  
    stage 'Application'
        sh 'curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
        sh 'chmod +x /usr/local/bin/docker-compose'
        sh "docker-compose -f docker-compose.yml up"
}
