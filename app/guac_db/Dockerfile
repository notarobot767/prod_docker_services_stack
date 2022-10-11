FROM docker.io/library/mariadb:10

ENV TZ="US/Hawaii"

#RUN export DEBIAN_FRONTEND=noninteractive && \
#  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
#  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
#  dpkg-reconfigure --frontend noninteractive tzdata
#update, upgrade, set timezone

COPY ./schema/. /docker-entrypoint-initdb.d/
#config will live locally on image

EXPOSE 3306

CMD ["mysqld"]

LABEL maintainer="notarobot" \
  org.label-schema.name="Guac Database Server" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2021-06-26" \
  org.label-schema.description="MYSQL database for Guac" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/fa26a-docker-services"