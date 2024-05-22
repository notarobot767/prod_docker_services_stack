FROM ubuntu:24.04

ENV TZ="Etc/UTC"
# set timezone variable to default UTC
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

COPY ./app/html/ubuntu-24.04.sources.list /etc/apt/sources.list
# add local mirror sources.list for faster build

COPY ./app/init.sh /etc/init.sh
# copy init script into image

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  # update, upgrade, set timezone
  \
  gnupg debmirror && \
  # install debmirror and dependency
  # gnupg needed to create a keyring
  \
  rm -rf /var/lib/apt/lists/* && \
  # remove apt package cache
  \
  mkdir /etc/apt/keyrings/mirrorkeyring && \
  gpg --no-default-keyring --keyring /etc/apt/keyrings/mirrorkeyring/trustedkeys.gpg --import /usr/share/keyrings/ubuntu-archive-keyring.gpg && \
  # create GPG keyring
  \
  chmod 555 /etc/init.sh
  # ensure init.sh is executable

ENTRYPOINT ["/etc/init.sh"]
# entry script

LABEL maintainer="notarobot" \
  org.label-schema.name="Deb-Mirror" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2024-05-16" \
  org.label-schema.description="Custom Local Ubuntu Repository" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"