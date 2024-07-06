FROM docker.io/library/ubuntu:24.04

ENV TZ="US/Hawaii"
# set timezone variable
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

ADD http://mirror.ogrydziak.net/ubuntu-24.04.sources /etc/apt/sources.list.d/ubuntu.sources
# add local mirror faster package downloads

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  # update, upgrade, set timezone
  \
  bash-completion \
  curl \
  dnsutils \
  iperf3 \
  iputils-ping \
  iproute2 \
  mtr \
  nano \
  nmap \
  openssh-server \
  python3 \
  screen \
  snmp \
  ssh \
  sudo \
  tcpdump \
  telnet \
  unzip \
  wget \
  whois && \
  # install packages
  \
  rm -rf /var/lib/apt/lists/*
  # remove apt package cache

COPY ./init.sh /etc/

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  #echo "HostKeyAlgorithms +ssh-rsa" >> /etc/ssh/sshd_config && \
  #echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config && \
  chmod +x /etc/init.sh && \
  service ssh start
  # why do I need this?...

CMD ["/etc/init.sh"]

LABEL maintainer="human" \
  org.label-schema.name="Devbox" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-03" \
  org.label-schema.description="Custom Devbox Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"