FROM docker.io/library/ubuntu:22.04

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  #update, upgrade, set timezone
  \
  awscli \
  bash-completion \
  dnsutils \
  curl \
  iperf3 \
  iputils-ping \
  iproute2 \
  monitoring-plugins \
  mtr \
  nano \
  netcat \
  nmap \
  openssh-server \
  python3 \
  python3-pip \
  screen \
  snmp \
  ssh \
  sudo \
  tcpdump \
  telnet \
  traceroute \
  unzip \
  wget \
  whois && \
  #install packages
  \
  pip3 install --upgrade pip awscli && \
  #upgrade pip
  \
  rm -rf /var/lib/apt/lists/*
  #remove apt package cache

COPY ./init.sh /etc/

RUN ln -s /usr/lib/nagios/plugins/* /bin/ && \
  echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  echo "HostKeyAlgorithms +ssh-rsa" >> /etc/ssh/sshd_config && \
  echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config && \
  chmod +x /etc/init.sh && \
  service ssh start
  #why do I need this?...

CMD ["/etc/init.sh"]

LABEL maintainer="human" \
  org.label-schema.name="Devbox" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-03" \
  org.label-schema.description="Custom Devbox Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"