#!/bin/bash

MYSQL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb)
mysql -h $MYSQL_IP -u root -p
