FROM ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Devbox" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-09-01" \
  org.label-schema.description="Custom Devbox Server"

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
  #update, upgrade, set timezone

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  awscli \
  bash-completion \
  dnsutils \
  curl \
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
  pip3 install --upgrade pip awscli
  #upgrade pip

COPY ./init.sh /etc/

RUN ln -s /usr/lib/nagios/plugins/* /bin/ && \
  echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  chmod +x /etc/init.sh && \
  service ssh start
  #why do I need this?...

CMD ["/etc/init.sh"]