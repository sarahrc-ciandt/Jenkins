#!/bin/bash     

i=0
status=1

while [ $i -lt 3 ]
do
    echo 'inicio mig'
    PGPASSWORD=postgres psql \
        --host=db \
        --port=5432 \
        --username=postgres \
        --file db/acesso_init.sql && ((status=0))  
    if [[ "$status" == '0' ]]; then
        echo 'saindo'
        break
    fi
    echo 'dormindo'
    sleep 10
    ((i++))
done


