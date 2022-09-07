#!/bin/bash

MARIADB_CONTAINER=$(docker ps -a | grep mariadb | awk '{print $1}')

if [ ! -z "${MARIADB_CONTAINER}" ]; then
   echo "Killing ${MARIADB_CONTAINER}..."
   docker kill ${MARIADB_CONTAINER}
   docker rm ${MARIADB_CONTAINER}
fi

docker container run --name mariadb \
       -v /opt/mariadb:/var/lib/mysql \
       -e MYSQL_ROOT_PASSWORD=root \
       -e MYSQL_USER=kndl \
       -e MYSQL_PASSWORD=kndl \
       -e MYSQL_DATABASE=kndl \
       -p 3306:3306 \
       -d mariadb:latest
