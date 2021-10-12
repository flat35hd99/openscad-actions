FROM openscad/appimage-x86_64-base

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]
