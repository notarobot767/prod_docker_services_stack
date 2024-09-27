FROM nginx:1.27
# https://hub.docker.com/_/nginx

ENV TZ="Etc/UTC"
# set timezone variable to UTC
# set actual timezone with TZ ENV variable in compose file
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

COPY ./app/nginx/. /etc/nginx/

COPY ./app/init.sh /etc
RUN chmod +x /etc/init.sh
# copy virtual hosts and nginx config
# add execution permission to script

ENTRYPOINT ["/etc/init.sh"]
# use init.sh to set timezone and other settings
# also allow for command injection in compose file
# http://nginx.org/en/docs/switches.html

LABEL maintainer="notarobot" \
  org.label-schema.name="www" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2024-09-21" \
  org.label-schema.description="Custom Nginx Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"