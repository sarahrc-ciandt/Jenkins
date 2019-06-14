#!/bin/bash

docker run -it --rm --name my-maven-project  \
    -v "$(pwd)/SonarApplication":/usr/src/mymaven \
    -w /usr/src/mymaven maven:3.6-jdk-8-alpine \
    mvn sonar:sonar \
    -Dsonar.host.url=http://172.17.0.3:9000