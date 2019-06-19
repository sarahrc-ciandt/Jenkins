#!/bin/bash

docker run -i --rm --name my-maven-project  \
    maven_git \
    pwd &&\
    git clone https://github.com/sarahrc-ciandt/Jenkins.git &&\
    cd Jenkins/SonarApplication &&\
    mvn sonar:sonar \
    -Dsonar.host.url=http://172.17.0.3:9000