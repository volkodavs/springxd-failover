FROM springxd_springxd-base


COPY docker-entrypoint.sh /entrypoint.sh
COPY config/xd-admin /opt/spring-xd/xd/bin/xd-admin

#Make executeble
RUN  chmod +x /entrypoint.sh \
  && chmod +x /opt/spring-xd/xd/bin/xd-admin \
  && sleep 1

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/opt/spring-xd/xd/bin/xd-admin"]
