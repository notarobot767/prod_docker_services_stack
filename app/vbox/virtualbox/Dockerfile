FROM ubuntu:latest

ENV TZ="Pacific/Honolulu"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  #update, upgrade, set timezone
  \
  virtualbox && \
  #install vbox
  #must also
    #install on host OS: linux-headers-generic virtualbox-dkms
    #mount file /dev/vboxdrv
  \
  rm -rf /var/lib/apt/lists/*
  #remove apt package cache

COPY ./init.sh /etc/
#initiation script to
  #set password of USER
  #start vboxwebsrv

ENV USER="vbox"
#name of user to use for remote virtualbox

RUN useradd -m $USER && \
  usermod -a -G vboxusers $USER && \
  #create user for virtualbox and add to vboxusers group
  \
  vboxmanage setproperty machinefolder /app/vbox/ && \
  #change default VM folder
  #ensure folder exists or is mounted in service yml file
  \
  chmod +x /etc/init.sh
  #ensure script is executable

CMD ["bash", "/etc/init.sh"]

EXPOSE 18083/tcp
#default port for vboxwebsrv

LABEL maintainer="notarobot" \
  org.label-schema.name="VBOX" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-03-09" \
  org.label-schema.description="Headless VBOX Server"