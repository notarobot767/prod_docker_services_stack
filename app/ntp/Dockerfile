FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Chrony NTP Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Chrony NTP server on Ubuntu" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
#update, upgrade, set timezone

RUN apt-get update -y && apt-get install -y chrony
#install chrony package

COPY ./app /app
#config will live locally on image

EXPOSE 123/udp
#ntp uses UDP port 123

CMD ["chronyd", "-d", "-4", "-n", "-f", "/app/chrony.conf"]

#-d	all messages will be written to the terminal instead of syslog
#-f	specify an alternate location for the configuration file
#-4	only resolve hostnames to ipv4
#-n	disable reverse lookups
#https://chrony.tuxfamily.org/doc/4.0/chronyd.html