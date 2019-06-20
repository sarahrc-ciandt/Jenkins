#!/bin/bash

echo 'Building Postgres Image...'
docker build -t postgres_db -f db/Dockerfile .

echo 'Running docker-compose...'
docker run -i --rm --name docker-compose1 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker/volumes/jenkins-data/_data/workspace/JavaApplication:/usr/src/mydocker \
    -w /usr/src/mydocker \
    dduportal/docker-compose \
    up -d

     