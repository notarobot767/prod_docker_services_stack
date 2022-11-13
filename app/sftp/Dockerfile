FROM docker.io/library/ubuntu:22.04

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  #update, upgrade, set timezone
  \
  openssh-server && \
  #openssh server
  \
  rm -rf /var/lib/apt/lists/*
  #remove apt package cache

COPY ./init.sh /etc/

RUN ln -s /usr/lib/nagios/plugins/* /bin/ && \
  chmod +x /etc/init.sh && \
  service ssh start
  #why do I need this?...

CMD ["/etc/init.sh"]

LABEL maintainer="human" \
  org.label-schema.name="SFTP" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-03" \
  org.label-schema.description="Custom SFTP Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"