FROM springxd_springxd-base


COPY docker-entrypoint.sh /entrypoint.sh
COPY config/xd-container /opt/spring-xd/xd/bin/xd-container

#Make executeble
RUN \
  chmod +x /entrypoint.sh \
  && chmod +x /opt/spring-xd/xd/bin/xd-container \
  && sleep 1

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/opt/spring-xd/xd/bin/xd-container"]
