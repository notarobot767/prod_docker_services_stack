FROM ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Devbox" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Devbox Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
  #update, upgrade, set timezone

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
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
  pip install --upgrade pip
  #upgrade pip

RUN useradd -m -s /bin/bash admin && \
  usermod -aG sudo admin && \
  passwd -d admin && \
  #create admin user and remove password
  \
  echo "AllowUsers admin" >> /etc/ssh/sshd_config && \
  echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  #only allow admin ssh acccess adn force ssh key auth only
  \
  cd /home/admin && \
  mkdir .ssh && \
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDyCqfRh/0Nh639upwsf3jAZTduCXW5HZgUxy/JWjMMAoG4pqKfv6mP5g8hwXmTwbZ1xVJ3AZvqIdUIHUXW/Nc5f9I9Y9I/s54remj10qISGLA3IBOZuBCA5QxYIcuA+eY8geMOGanZlatOsHjZTN+KLRxgyXQmHQWGtSzKGtjUKu3ij/ZwtCvXCxA7MQRYDuv3xanITZYD+jZeDUFFKqKwNOS1PgnZfgHS8yzQzgHLWcnTQ9woKGBumJljeOZZsxfWFX/i+6OLdoiJlKKg+Ody6o+z+c8E0mO67oRC19doXbO8ri4C11dVrprjLdFnJOhGWhxr7ZNs/0eR4agSo/Z7+dQB++G3RBhwvxdQDNJ8JYzLErOP77p1EmhhAVec0/WicXvgmDQS+JeikM2FQRFT8j4LazZN+M5Vk++NPYppFMvDKCQ5GwgmTB9LiOuRidWIq901YIfTx/KUJJWg9hDlhal+JZ7oPyzpxcU7TidyWuGC0WhVtDMNlsSBAjsN3gP2WrXVOMCXw8CG32FnV+shcnoyCXsFLJhP+pfwlu+zSQmOLutk8fBqJK1CqhapT9pCDpUHdrGRSeVFnPMlPb8qp12bDOt3UcUGlFtHHGzKr7I/CmNuV8eEDDwPvvfe+9KKCtN2OgoBi9wlC9yWObrC8B++f2fFB1N651D9dazUdw== god" > .ssh/authorized_keys && \
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAjLaKvdYDKS3hAQ3bGD0KKp6IlKN6Lscqg5gJqbDU1dDXN8EYcek+a9F/X2JIS4Imsyy/V8NCKVFQ9KA1SJdY+bZpDQWenbG4cy6p3paehyjBaNV0GolGfZaCYiqccYQq+pKhgpfby9J0kUcVprXQuFs9psElMYq011dN2lZjhUxbcMBbnI3cgGWFBt810ygzmFiIKrerp1yga0rEkta1/fmYvKXVceJ8gFZW3uU2houAzPNH1PQfTq+x6TkvKG36H65Ebr87Xp+7mbXd0jZCLEWNMS3nqeRX4IIsKg1BQX51/Uco8siLR+RmVnyg9vqenJ8QejAaNTMgvXMSVB6rDw== blackbox" >> .ssh/authorized_keys && \
  chown -R admin:admin .ssh && \
  #add key to authorized ssh key file
  \
  ln -s /usr/lib/nagios/plugins/* /bin/ && \
  #create symbolic link for nagios check commands
  service ssh start

CMD ["/usr/sbin/sshd", "-D"]