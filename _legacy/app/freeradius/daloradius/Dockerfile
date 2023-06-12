FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="FreeRadius Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Daloradus web gui for FreeRadius" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

COPY ./daloradius.conf.php /tmp
#copy daloradius zip and config into image

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
#update, upgrade, set timezone

RUN  apt-get update -y && apt-get install -y \
  apache2 \
  libapache2-mod-php \
  php \
  php-common \
  php-curl \
  php-db \
  php-gd \
  php-mail \
  php-mail-mime \
  php-mbstring \
  php-mysql \
  php-pear \
  php-xml \
  unzip \
  wget
#install dependencies

RUN cd /tmp && \
  wget https://github.com/lirantal/daloradius/archive/master.zip && \
  mkdir /app && \
  unzip /tmp/master.zip -d /tmp/ && \
  mv -f /tmp/daloradius-master/* /var/www/html/ && \
  mv -f /tmp/daloradius.conf.php /var/www/html/library/ && \
  rm -f /var/www/html/index.html && \
  rm -rf /tmp/* && \
  apt-get remove -y unzip wget
#download daloradius http/php files
#move daloradius to apache folder
#overwrite daloradius config with file from earlier copy
#remove default apache index.html
#remove files in /tmp directory
#remove unzip and wget

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
#start apache in foreground
#https://httpd.apache.org/docs/2.4/programs/apachectl.html