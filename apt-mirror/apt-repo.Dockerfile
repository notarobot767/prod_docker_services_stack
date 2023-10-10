FROM ubuntu:22.04

ENV TZ="Etc/UTC"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

COPY ./app/init.sh /etc/init.sh
#copy init script into image

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  #update, upgrade, set timezone
  \
  ca-certificates curl gnupg \
  #necessary for gpg keys
  \
  apt-mirror && \
  #install apt-mirror
  \
  install -m 0755 -d /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  chmod a+r /etc/apt/keyrings/docker.gpg && \
  #install docker keyring
  ##https://docs.docker.com/engine/install/ubuntu/
  \
  rm -rf /var/lib/apt/lists/* && \
  #remove apt package cache
  \
  chmod 555 /etc/init.sh
  #ensure init.sh is executable

#COPY ./app/apt-mirror/mirror.list /etc/apt/mirror.list
#copy apt-mirror config file into image

ENTRYPOINT ["/etc/init.sh"]
#entry script

LABEL maintainer="notarobot" \
  org.label-schema.name="Apt-Mirror" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-8" \
  org.label-schema.description="Custom Local Ubuntu Repository" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"