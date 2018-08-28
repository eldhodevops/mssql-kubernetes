FROM microsoft/mssql-server-linux
MAINTAINER Eldhose P Wilson 

RUN apt-get update && \
    apt-get -y install unzip && \
    apt-get -y install rsyslog rsyslog-doc supervisor cron procps
RUN mkdir -p /var/log/supervisor
	

COPY scripts/backupscript.sh /
COPY conf/mssql.conf /var/opt/mssql/ 
COPY conf/rsyslog.conf /etc/rsyslog.conf
COPY conf/rsyslog/*.conf /etc/rsyslog.d/Array-graylog.conf
ADD conf/supervisord.conf /etc/supervisor/supervisord.conf
ADD conf/supervisor/*.conf /etc/supervisor/conf.d/

ADD conf/crontab /var/spool/cron/crontabs/root 
RUN chmod 0600 /var/spool/cron/crontabs/root \
	&& chown root:crontab /var/spool/cron/crontabs/root

VOLUME /var/opt/mssql/data
VOLUME /var/backups/ 
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
#CMD [ "/opt/mssql/bin/sqlservr" ]
