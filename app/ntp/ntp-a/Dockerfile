FROM docker.io/library/ubuntu:22.04

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  #update, upgrade, set timezone
  \
  chrony && \
  #install chrony package
  \
  rm -rf /var/lib/apt/lists/*
  #remove apt package cache

COPY ./chrony.conf /etc/chrony/
#copy conf files to chrony default directory

CMD ["chronyd", "-d", "-4", "-x", "-s"]
#-d	all messages will be written to the terminal instead of syslog
#-4	only resolve hostnames to ipv4
#-n	program will not detach itself from the terminal
#-x disables the control of the system clock
#https://chrony.tuxfamily.org/doc/4.0/chronyd.html

EXPOSE 123/udp
#ntp uses UDP port 123

HEALTHCHECK --interval=5m --timeout=3s \
  CMD chronyc tracking || exit 1

LABEL maintainer="notarobot" \
  org.label-schema.name="Chrony NTP Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-05-14" \
  org.label-schema.description="Chrony NTP server on Ubuntu" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"