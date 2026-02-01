FROM jellyfin/jellyfin:latest

ENV LANG=C.UTF-8

VOLUME ["/data"]

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

ENV JELLYFIN_PublishedServerUrl=""

EXPOSE 8096
