FROM nginx:latest
#

LABEL maintainer="notarobot" \
  org.label-schema.name="Reverse Proxy" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

RUN rm -rf /var/log/nginx/*

COPY ./nginx/. /etc/nginx