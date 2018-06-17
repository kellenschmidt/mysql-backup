#!/bin/bash

# Arguments
# $1: Time period type of backup

date=$(date +"%d-%m-%Y_%H:%M:%S")
mysqldump -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD --lock-tables=false --add-drop-database --add-drop-table --databases personal_website | gzip > /home/backups/mysql-${ENV}-$1_$date.sql.gz
