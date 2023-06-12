FROM python:3

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

CMD ["python3", "-m", "uploadserver", "--directory", "/etc"]

LABEL maintainer="human" \
  org.label-schema.name="Upload" \
  org.label-schema.vendor="OG Networks" \
  org.label-schema.build-date="2022-11-13" \
  org.label-schema.description="Custom Python3 Upload Server" \
  org.label-schema.url="https://www.ogrydziak.net" \
  org.label-schema.vcs-ref="https://github.com/notarobot767/prod_docker_services_stack"