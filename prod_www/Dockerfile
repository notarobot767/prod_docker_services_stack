FROM nginx:1.27
#https://hub.docker.com/_/nginx

RUN rm -rf /usr/share/nginx/html/*

COPY ./app/nginx/. /etc/nginx/
COPY ./app/html/. /usr/share/nginx/html/

EXPOSE 80/tcp
#default port for web service

LABEL maintainer="notarobot" \
  org.label-schema.name="WWW" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-08" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"