#!/bin/bash

docker run -i --rm --name maven-project  \
    -v /var/lib/docker/volumes/jenkins-data/_data/workspace/JavaApplication/SonarApplication:/usr/src/maven-project \
    -w /usr/src/maven-project \
    maven:ibmjava-alpine \
    mvn sonar:sonar -Dsonar.host.url=http://172.17.0.3:9000


