#!/bin/bash

# Arguments
# None

newestBackup=$(ls -t /home/backups | head -1)

echo $OAUTH_ACCESS_TOKEN > ~/.dropbox_uploader
dropbox_uploader.sh upload /home/backups/${newestBackup} /mysql/$ENV/${newestBackup}
