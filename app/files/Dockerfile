FROM ubuntu:22.04

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata \
  #update, upgrade, set timezone
  \
  nginx \
  libnginx-mod-http-fancyindex && \
  #install ngix package and module
  \
  rm -f /etc/nginx/sites-available/default
  #remove default config

COPY ./nginx/. /etc/nginx
#copy virtual hosts and default

CMD ["nginx", "-g", "daemon off;"]
#http://nginx.org/en/docs/switches.html

EXPOSE 80/tcp
#default port for web service

LABEL maintainer="notarobot" \
  org.label-schema.name="Files Proxy" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-03-10" \
  org.label-schema.description="Custom Nginx File Server Proxy" \
  org.label-schema.url="https://www.ogrydziak.net"