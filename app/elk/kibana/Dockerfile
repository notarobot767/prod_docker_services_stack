FROM docker.elastic.co/kibana/kibana:7.13.3
#https://www.elastic.co/guide/en/kibana/current/docker.html

LABEL maintainer="notarobot" \
  org.label-schema.name="Kibana" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Kibana Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

COPY ./kibana.yml /usr/share/kibana/config/kibana.yml
#https://github.com/elastic/kibana/blob/master/config/kibana.yml