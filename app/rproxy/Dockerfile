FROM ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Reverse Proxy" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
##update, upgrade, set timezone

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  nginx \
  libnginx-mod-http-fancyindex && \
#install chrony package and module
  \
  rm -f /etc/nginx/sites-available/default
#remove default config

COPY ./nginx/. /etc/nginx
#copy virtual hosts and default

CMD ["nginx", "-g", "daemon off;"]