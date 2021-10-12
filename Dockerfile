FROM openscad/mxe-x86_64-deps

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]