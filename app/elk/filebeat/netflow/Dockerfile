FROM docker.elastic.co/beats/filebeat:7.13.2
#https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html

LABEL maintainer="notarobot" \
  org.label-schema.name="Netflow Filebeat" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="Custom Filebeat Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"

COPY ./fb.yml /usr/share/filebeat/filebeat.yml
#https://www.elastic.co/guide/en/beats/filebeat/current/configuration-filebeat-options.html