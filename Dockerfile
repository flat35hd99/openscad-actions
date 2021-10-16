FROM ubuntu:latest

RUN apt update \
  && apt-get install -y openscad \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
