FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="FreeRadius Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Radius server using FreeRadius on Ubuntu" \
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
  apache2 libapache2-mod-auth-radius && \
  a2enmod auth_radius && \
  mkdir /var/www/html/auth && \
  chown www-data.www-data /var/www/html/auth -R
#apache and radius auth mod

COPY ./html/. /var/www/html/
#copy custom config into image

CMD ["apache2ctl", "-D", "FOREGROUND"]