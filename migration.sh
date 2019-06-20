#!/bin/bash
     
echo "Coping Files..."
docker cp db/acesso_init.sql data_base:opt/acesso_init.sql

echo 'Executing Migration ..'
docker exec data_base bash -c 'su - postgres && \
    PGPASSWORD=postgres psql \
    --host=localhost \
    --port=5432 \
    --username=postgres \
    --file /opt/acesso_init.sql'