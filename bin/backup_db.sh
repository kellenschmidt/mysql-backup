#!/bin/bash

# Arguments
# $1: Time period type of backup

date=$(date +"%d-%m-%Y_%H:%M:%S")

if [ "$ENV" == "kellenschmidtcom" ]; then
  curl -fsS --retry 3 https://cronhub.io/start/b664ebe0-8646-11e8-a0d4-d38e284fbc15
elif [ "$ENV" == "kellenforthewin" ]; then
  curl -fsS --retry 3 https://cronhub.io/start/92789fd0-8647-11e8-95a2-7352beb5f5da
fi

mysqldump -h$HOSTNAME -u$MYSQL_USER -p$MYSQL_PASSWORD --lock-tables=false --add-drop-database --add-drop-table --databases personal_website | gzip > /home/backups/mysql-${ENV}-$1_$date.sql.gz

if [ "$ENV" == "kellenschmidtcom" ]; then
  curl -fsS --retry 3 https://cronhub.io/finish/b664ebe0-8646-11e8-a0d4-d38e284fbc15
elif [ "$ENV" == "kellenforthewin" ]; then
  curl -fsS --retry 3 https://cronhub.io/finish/92789fd0-8647-11e8-95a2-7352beb5f5da
fi
