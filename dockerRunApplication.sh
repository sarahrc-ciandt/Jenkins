#!/bin/bash

echo 'Building Postgres Image...'
docker build -t postgres_db -f ${1}/db/Dockerfile .

echo 'Running docker-compose...'
for value in {1..2}
do
    docker run -i --rm --name docker-compose1 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v "${1}":/usr/src/mydocker \
        -w /usr/src/mydocker \
        dduportal/docker-compose \
        up -d
done

     