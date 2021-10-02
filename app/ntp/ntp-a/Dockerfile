FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Chrony NTP Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-09-01" \
  org.label-schema.description="Chrony NTP server on Ubuntu"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
#update, upgrade, set timezone

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  chrony
#install chrony package

COPY ./chrony.conf /etc/chrony/
#copy conf files to chrony default directory

EXPOSE 123/udp
#ntp uses UDP port 123

CMD ["chronyd", "-d", "-4", "-x"]
#-d	all messages will be written to the terminal instead of syslog
#-4	only resolve hostnames to ipv4
#-n	program will not detach itself from the terminal
#-x disables the control of the system clock
#https://chrony.tuxfamily.org/doc/4.0/chronyd.html