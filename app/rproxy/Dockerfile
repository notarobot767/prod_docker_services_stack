FROM nginx:1.23

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

COPY ./nginx/. /etc/nginx
#copy virtual hosts and default

LABEL maintainer="notarobot" \
  org.label-schema.name="Reverse Proxy" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-06" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net"