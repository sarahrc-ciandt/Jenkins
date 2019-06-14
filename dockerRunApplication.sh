#!/bin/bash

docker build -t postgres_db -f db/Dockerfile .

docker run -it --rm --name docker-compose1 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$(pwd)":/usr/src/mydocker \
    -w /usr/src/mydocker \
    dduportal/docker-compose \
    up -d

     