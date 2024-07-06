FROM internetsystemsconsortium/bind9:9.18

ENV TZ="US/Hawaii"
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

COPY ./app /app
#copy app files into image

RUN chown -R 1000:1000 /app && \
  chmod 775 /app
#ensure owner and write permissions are acceptable
#change UID:GID as needed

ENTRYPOINT ["named", "-c", "/app/named.conf"]
#-c #Use config-file as the configuration file instead of the default, /etc/named.conf
#command in docker-compose.yml will require -f or -g flag
#https://linux.die.net/man/8/named

EXPOSE 53/tcp
EXPOSE 53/udp
#dns uses both tcp and udp port 53

LABEL maintainer="notarobot" \
  org.label-schema.name="Bind9 DNS Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2023-06-11" \
  org.label-schema.description="Bind9 DNS Server with Docker Compose" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/bind9"