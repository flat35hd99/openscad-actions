FROM ubuntu:latest

RUN apt update \
  && apt install -y openscad \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh ./
ENTRYPOINT ["./entrypoint.sh"]
