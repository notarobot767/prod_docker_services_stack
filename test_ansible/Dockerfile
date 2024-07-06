FROM ubuntu:24.04
# 24.04 not yet mature

ENV TZ="Etc/UTC"
# set timezone variable as UTC and set in runtime using TZ var
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

ADD http://mirror.ogrydziak.net/ubuntu-24.04.sources /etc/apt/sources.list.d/ubuntu.sources
# add local mirror faster package downloads

COPY ./app/init.sh /etc/init.sh
# copy init script into image

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  # set timezone with TZ var to avoid prompt with install tzdata
  # update, upgrade, set timezone
  \
  openssh-client sshpass \
  # install ssh client and package to use interactive passwords
  \
  less python3 python3-pip && \
  pip3 install --upgrade pip ansible ansible-pylibssh && \
  # install ssh clint, python, less, pip, and ansible via pip
  # https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip
  \
  apt-get install -y bash-completion && \
  pip3 install --upgrade argcomplete && \
  activate-global-python-argcomplete && \
  # allow command line completion for ansible
  \
  rm -rf /var/lib/apt/lists/* && \
  # remove apt package cache
  \
  chmod 555 /etc/init.sh
  # ensure init.sh is executable

WORKDIR /app
# set working directory

ENTRYPOINT ["/etc/init.sh"]
# entry script

LABEL maintainer="notarobot" \
  org.label-schema.name="Ansible" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2024-04-26" \
  org.label-schema.description="Ansible Automation Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"