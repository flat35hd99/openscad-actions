FROM openscad/openscad:latest

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
