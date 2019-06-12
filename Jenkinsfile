node() { 
    stage 'Checkout'
        checkout scm

    stage 'Installing prerequisites packages'
        sh 'apk add py-pip'
        sh 'apk add python-dev libffi-dev openssl-dev gcc libc-dev make'
        sh 'pip install docker-compose'
        sh 'docker-compose --version'       

    stage 'Build DataBase Image'
        sh "docker build -t postgres_db -f db/Dockerfile ."
  
    stage 'Java Application'       
        sh "docker-compose -f docker-compose.yml up -d"
}
