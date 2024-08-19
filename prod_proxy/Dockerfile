FROM nginx:1.26
#https://hub.docker.com/_/nginx

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

COPY ./app/. /etc/nginx/

LABEL maintainer="notarobot" \
  org.label-schema.name="WWW" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-08" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"