FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Nagios Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Nagios network monitoring server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref=""

ENV NAGIOSADMIN=nagios
#default pw for nagiosadmin
#set envionrment var in run command

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
  #update, upgrade, set timezone

RUN apt-get update -y && apt-get install -y \
  apache2 \
  autoconf \
  php \
  libapache2-mod-php \
  #apache dependencies
  \
  bc \
  build-essential \
  dc \
  gawk \
  gcc \
  gettext \
  libc6 \
  libgd-dev \
  libmcrypt-dev \
  libssl-dev \
  make \
  unzip \
  wget \
  #nagios dependencies
  \
  bind9-utils \
  iputils-ping \
  libnet-snmp-perl \
  monitoring-plugins \
  nagios-nrpe-plugin \
  snmp \
  traceroute
  #for nagios check commands

RUN useradd -m -s /bin/bash nagios && \
  usermod --password nagios nagios && \
  #create nagios user
  \
  cd /tmp && \
  wget -O nagios.tar.gz https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz && \
  mkdir nagios && \
  tar xzf ./nagios.tar.gz -C ./nagios --strip-components=1 && \
  #download and unzip nagios core
  \
  cd /tmp/nagios && \
  ./configure --with-command-group=nagcmd && \
  make all && \
  \
  groupadd nagcmd && \
  usermod -a -G nagcmd nagios && \
  usermod -a -G nagcmd www-data && \
  make install-groups-users && \
  #create nagios command group for commands via web interface
  \
  make install && \
  make install && \
  make install-init && \
  make install-config && \
  make install-commandmode && \
  #install and configure nagios core
  \
  make install-webconf && \
  htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin $NAGIOSADMIN && \
  #rm -f /etc/apache2/sites-enabled/000-default.conf && \
  #config web interface
  #accessible via http://localhost:80/
  \
  cd /tmp && \
  wget -O nagiostv.tar.gz https://github.com/chriscareycode/nagiostv-react/releases/download/v0.7.4/nagiostv-0.7.4.tar.gz && \
  mkdir nagiostv && \
  tar xzf ./nagiostv.tar.gz -C nagiostv --strip-components=1 && \
  mv nagiostv /usr/local/nagios/share/tv && \
  #install nagiostv
  #accessible via http://localhost:80/tv
  \
  cd /tmp && \
  wget -O nagios-plugins.tar.gz https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz && \
  mkdir nagios-plugins && \
  tar xzf ./nagios-plugins.tar.gz -C ./nagios-plugins --strip-components=1 && \
  #download and unzip nagios plugins
  \
  cd nagios-plugins && \
  ./configure --with-nagios-user=nagios --with-nagios-group=nagios && \
  make && \
  make install && \
  #install nagios plugin
  \
  echo '<META HTTP-EQUIV="Refresh" Content="0; URL=/nagios">' > /var/www/html/index.html && \
  #redirect apache root to nagios
  \
  rm -rf /tmp/*
  #remove zip files from tmp

COPY ./etc/. /usr/local/nagios/etc

EXPOSE 80
#nagios core http:80

CMD ["bash", "-c", "htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin $NAGIOSADMIN; /etc/init.d/nagios start; a2enmod rewrite cgi; apache2ctl -D FOREGROUND"]