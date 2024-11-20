#!/bin/bash

service mariadb start
sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO \`${DB_USER}\`@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin --user=root shutdown

exec mysqld --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql' --user=mysql
