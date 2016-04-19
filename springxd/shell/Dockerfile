FROM springxd_springxd-base


COPY docker-entrypoint.sh /entrypoint.sh

COPY scripts/ /tmp/scripts/

#Make executeble
RUN chmod +x /entrypoint.sh && sleep 1

ENTRYPOINT ["/entrypoint.sh"]
