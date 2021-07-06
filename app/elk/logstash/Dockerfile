FROM docker.elastic.co/logstash/logstash:7.13.2
#https://www.elastic.co/guide/en/logstash/current/index.html

LABEL maintainer="notarobot" \
  org.label-schema.name="Logstash" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Logstash Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

COPY ./config /usr/share/logstash/config
COPY ./pipeline /usr/share/logstash/pipeline
#https://www.elastic.co/guide/en/logstash/current/config-examples.html