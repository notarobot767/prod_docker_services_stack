#!/bin/bash

FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="TFTP" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="TFTP Server" \
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

RUN apt-get update -y && apt-get install -y \
  tftpd-hpa \
  busybox && \
  #install tftp server
  \
  chown tftp:tftp /srv/tftp && \
  chmod 777 /srv/tftp
  #give write permissions to the folder too

EXPOSE 69/udp
#tftp uses udp port 69

CMD ["bash", "-c", "busybox syslogd; in.tftpd -Lscv -u tftp -B 1468 /srv/tftp"]
#common blocksize 1468 bytes
#https://manpages.debian.org/testing/tftpd-hpa/tftpd.8.en.html
#on cisco router, ensure
#ip tftp blocksize 1468
#ip tftp source-interface gi 0/0