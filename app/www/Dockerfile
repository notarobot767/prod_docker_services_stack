FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*

COPY ./nginx/. /etc/nginx/
COPY ./html/. /usr/share/nginx/html/

LABEL maintainer="notarobot" \
  org.label-schema.name="WWW" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-07-08" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"