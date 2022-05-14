#!/bin/bash

FROM docker.io/library/ubuntu:20.04

LABEL maintainer="notarobot" \
  org.label-schema.name="Bind9 DNS Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Bind9 DNS Server with Docker Compose" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
  #update, upgrade, set timezone

RUN apt-get update -y && apt-get install -y bind9
#install bind package

COPY ./app /app
#config will live locally on image

EXPOSE 53/tcp
EXPOSE 53/udp
#dns uses both tcp and udp port 53

#ENTRYPOINT ["named", "-f", "-4", "-c"]
CMD ["named", "-f", "-4", "-c", "/app/named.conf"]
#named -f -4 -c /app/named.conf
#CMD ["/bin/bash"]
#CMD would allow user to specify alternative config for container instance

#-g #switch to -g to troubleshoot and see output to console when in interactive mode
#-f #Run the server in the foreground. Necessary when running as docker instance
#-c #Use config-file as the configuration file instead of the default, /etc/named.conf
#https://linux.die.net/man/8/named
