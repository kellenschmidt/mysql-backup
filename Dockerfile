# docker build -t kellenschmidt/mysql-backup .
# docker run --env-file ./mysql-backup.env -d kellenschmidt/mysql-backup

FROM alpine:3.7

RUN apk update && apk add --no-cache mysql-client wget bash curl

ADD ./bin /home/bin
ADD ./cron /home/cron

RUN chmod +x /home/bin/*.sh && \
    mkdir /home/backups

RUN wget https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh -P /usr/bin && \
    chmod +x /usr/bin/dropbox_uploader.sh

# Combine individual cron files into single cron file and load into crontab
RUN cat /home/cron/*.cron > /home/cron/combined_cron && \
    crontab /home/cron/combined_cron

ENTRYPOINT [ "crond", "&&", "tail", "-f", "/dev/null" ]
