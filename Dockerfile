FROM alpine:latest

RUN apk --no-cache add openscad

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]
