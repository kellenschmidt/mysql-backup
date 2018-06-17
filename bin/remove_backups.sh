#!/bin/bash

# Arguments
# $1: Time period type of backup

# Remove all backups except newest 3
ls -t /home/backups/mysql-${ENV}-$1_*.sql.gz | tail -n +3 | xargs rm -f --
