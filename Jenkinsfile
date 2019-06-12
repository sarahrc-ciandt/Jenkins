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
            sh 'curl -L --fail https://github.com/docker/compose/releases/download/1.24.0/run.sh -o /usr/local/bin/docker-compose'
            sh 'chmod +x /usr/local/bin/docker-compose'
        }               

    stage 'Build DataBase Image'
        sh "docker build -t postgres_db -f db/Dockerfile ."
  
    stage 'Java Application'       
        sh "docker-compose -f docker-compose.yml up -d"
}
