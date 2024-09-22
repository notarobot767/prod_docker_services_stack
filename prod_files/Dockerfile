FROM ubuntu:24.04

ENV TZ="Etc/UTC"
# set timezone variable to UTC
# set actual timezone with TZ ENV variable in compose file
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  # set local timezone
  \
  apt-get update && apt-get install -y tzdata \
  # update, upgrade, set timezone
  \
  nginx \
  libnginx-mod-http-fancyindex && \
  # install nginx package and module
  \
  rm -rf /var/lib/apt/lists/* && \
  # remove apt package cache
  \
  rm -rf /etc/nginx/sites-available
  # remove folder

COPY ./app/. /etc
# copy virtual hosts and nginx config

RUN chmod +x /etc/init.sh
# add execution permission to script

ENTRYPOINT ["/etc/init.sh"]
# use init.sh to set timezone and other settings
# also allow for command injection in compose file
# http://nginx.org/en/docs/switches.html

EXPOSE 80/tcp
# default port for web service

LABEL maintainer="notarobot" \
  org.label-schema.name="Files Proxy" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2024-09-21" \
  org.label-schema.description="Custom Nginx File Server Proxy" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"