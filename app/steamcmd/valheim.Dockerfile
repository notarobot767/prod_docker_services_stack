FROM docker.io/library/ubuntu:22.04

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update && apt-get upgrade -y && apt-get install -y tzdata \
    ca-certificates \
    #necessary for TLS when connecting to steam servers
    \
    libatomic1 libpulse-dev libpulse0 && \
    #from the manual itself
  \
  rm -rf /var/lib/apt/lists/*
  #remove apt package cache

WORKDIR /app

ENTRYPOINT ["./start_server.sh"]

LABEL maintainer="human" \
  org.label-schema.name="Unturned" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2023-05-18" \
  org.label-schema.description="Custom OS for Valheim Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"